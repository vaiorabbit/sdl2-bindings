import os, pprint, re, sys
import json
from pathlib import Path
from clang.cindex import Config, CursorKind, Index, TranslationUnit, TranslationUnitLoadError, TypeKind

Config.set_library_path("/opt/homebrew/opt/llvm/lib")

####################################################################################################

def generate_type_mapping(headers_list_filename = './sdl2_headers_list.json', headers_dir = './SDL3'):
    headers_list_file = Path(headers_list_filename)

    if not headers_list_file.exists():
        return False

    headers_list = None
    with headers_list_file.open() as f:
        headers_list = json.load(f)

    print("{", file = sys.stdout)
    first = True
    for header_filename in headers_list:
        header_filename = headers_dir + '/' + header_filename
        if not Path(header_filename).exists():
            continue

        ctx = ParseContext()
        ctx.parse_file = header_filename
        idx = Index.create()
        try:
            tu = idx.parse(ctx.parse_file, args=parser_arg, unsaved_files=None, options=parser_opt)
            ctx.depth = 0
            collect_decl(ctx, tu.cursor)
        except TranslationUnitLoadError as err:
            print(err)
        assert ctx.depth == 0

        for typedef_name, typedef_info in ctx.decl_typedefs.items():
            print("    %s \"%s\" : \"%s\"" % (' ' if first else ',', typedef_name, typedef_info.type_kind), file = sys.stdout)
            first = False
    print("}", file = sys.stdout)


def generate_define_list(headers_list_filename = './sdl2_headers_list.json', headers_dir = './SDL3', concatinate = True):
    headers_list_file = Path(headers_list_filename)

    if not headers_list_file.exists():
        return False

    headers_list = None
    with headers_list_file.open() as f:
        headers_list = json.load(f)

    print("{", file = sys.stdout)
    first = True
    for header_filename in headers_list:
        header_filename = headers_dir + '/' + header_filename
        if not Path(header_filename).exists():
            continue

        ctx = ParseContext()
        ctx.parse_file = header_filename
        idx = Index.create()
        try:
            tu = idx.parse(ctx.parse_file, args=parser_arg, unsaved_files=None, options=parser_opt)
            ctx.depth = 0
            collect_decl(ctx, tu.cursor)
        except TranslationUnitLoadError as err:
            print(err)
        assert ctx.depth == 0

        for macro_name, macro_value in ctx.decl_macros.items():
            val = ' '.join(macro_value) if concatinate else macro_value
            print("    %s \"%s\" : %s" % (' ' if first else ',', macro_name, val), file = sys.stdout)
            first = False
    print("}", file = sys.stdout)


####################################################################################################

define_mapping = None

def _init_define_mapping(mapping_filename = './sdl2_define_mapping.json'):
    mapping_file = Path(mapping_filename)

    if not mapping_file.exists():
        return False
    with mapping_file.open() as f:
        global define_mapping
        define_mapping = json.load(f)

    return True

def get_define_mapping(strDefineName):
    if define_mapping == None:
        _init_define_mapping()
    if strDefineName not in define_mapping:
        return None
    return define_mapping[strDefineName]

####################################################################################################

cindex_mapping = None

def _init_type_mapping(mapping_filename = './sdl2_cindex_mapping.json'):
    mapping_file = Path(mapping_filename)

    if not mapping_file.exists():
        return False
    with mapping_file.open() as f:
        global cindex_mapping
        cindex_mapping = json.load(f)

    return True

def register_sdl2_cindex_mapping(strTypeKind, strSDL2Typedef):
    if cindex_mapping == None:
        _init_type_mapping()
    if strSDL2Typedef not in cindex_mapping:
        cindex_mapping[strSDL2Typedef] = strTypeKind

def query_sdl2_cindex_mapping_entry_exists(strSDL2Typedef):
    if cindex_mapping == None:
        _init_type_mapping()
    return strSDL2Typedef in cindex_mapping

def get_sdl2_cindex_mapping_value(strSDL2Typedef):
    if cindex_mapping == None:
        _init_type_mapping()
    return cindex_mapping[strSDL2Typedef]


def get_cindex_ctypes_mapping(strTypeKind, strSDL2Typedef):

    if strTypeKind == 'TypeKind.RECORD':
        return strSDL2Typedef

    isPointerToChar = False
    if strTypeKind == 'TypeKind.POINTER':
        pattern = re.compile(r"\s*char\s*\*")
        m = re.search(pattern, strSDL2Typedef)
        if m:
            isPointerToChar = True

    isSizeType = False
    if strTypeKind == 'TypeKind.TYPEDEF':
        pattern = re.compile(r"\s*size_t\s*")
        m = re.search(pattern, strSDL2Typedef)
        if m:
            isSizeType = True

    # clang types -> python ctypes
    ctypes_mapping = {
        'TypeKind.VOID' : ':void',
        'TypeKind.BOOL' : ':bool',
        'TypeKind.CHAR_U' : ':uint8',
        'TypeKind.UCHAR' : ':uchar',
        'TypeKind.CHAR16' : ':int16',
        'TypeKind.CHAR32' : ':int32',
        'TypeKind.USHORT' : ':ushort',
        'TypeKind.UINT' : ':uint',
        'TypeKind.ULONG' : ':ulong',
        'TypeKind.ULONGLONG' : ':ulong_long',
        'TypeKind.UINT128' : ':ulong_long',
        'TypeKind.CHAR_S' : ':char',
        'TypeKind.SCHAR' : ':char',
        'TypeKind.WCHAR' : ':short', # not supported in Ruby/FFI
        'TypeKind.SHORT' : ':short',
        'TypeKind.INT' : ':int',
        'TypeKind.LONG' : ':long',
        'TypeKind.LONGLONG' : ':long_long',
        'TypeKind.INT128' : ':long_long',
        'TypeKind.FLOAT' : ':float',
        'TypeKind.DOUBLE' : ':double',
        'TypeKind.LONGDOUBLE' : ':double', # not supported in Ruby/FFI
        'TypeKind.NULLPTR' : ':pointer',
        'TypeKind.POINTER' : ':pointer',
        'TypeKind.ENUM' : ':int',
        'TypeKind.FUNCTIONPROTO' : ':pointer',
        'TypeKind.CONSTANTARRAY' : ':pointer', # 'va_list' on macOS
        'TypeKind.RECORD' : 'nil',
    }

    if isPointerToChar:
        return ':pointer'
    elif isSizeType:
        return ':size_t'
    else:
        mapping_key = ""
        if strTypeKind != 'TypeKind.TYPEDEF':
            mapping_key = strTypeKind
        else:
            mapping_key = get_sdl2_cindex_mapping_value(strSDL2Typedef)

        if mapping_key == "TypeKind.RECORD":
            return str(strSDL2Typedef)
        else:
            return ctypes_mapping[mapping_key]

def is_sdl2_callback_type(strTypeKind, strSDL2Typedef):
    return query_sdl2_cindex_mapping_entry_exists(strSDL2Typedef) and (get_sdl2_cindex_mapping_value(strSDL2Typedef) == "TypeKind.FUNCTIONPROTO")

####################################################################################################

class FieldInfo(object):
    """
    Holds one field of struct/union.
    """

    # Block adding members unintentionally
    __slots__ = ('element_count', 'element_name', 'type_kind', 'type_original_name', 'type_api_name')

    def __init__(self):
        self.element_count = -1
        self.element_name = ""
        self.type_kind = TypeKind.INVALID
        self.type_original_name = ""
        self.type_api_name = ""

    def __repr__(self):
        return str(vars(self))

class StructInfo(object):
    """
    Holds struct/union information.
    """

    # Block adding members unintentionally
    __slots__ = ('fields', 'kind', 'original_name', 'api_name')

    def __init__(self):
        self.fields = []
        self.kind = None # CursorKind.STRUCT_DECL or CursorKind.UNION_DECL
        self.original_name = ""
        self.api_name = ""

    def __repr__(self):
        return str(vars(self))

    def push(self, field):
        self.fields.append(field)

    def pop(self):
        self.fields.pop()

class TypedefInfo(object):
    """
    Holds typedef information.
    """

    # Block adding members unintentionally
    __slots__ = ('original_name', 'api_name', 'element_count', 'type_kind', 'func_proto')

    def __init__(self):
        self.original_name = ""
        self.api_name = ""
        self.element_count = -1
        self.type_kind = TypeKind.INVALID
        self.func_proto = None

    def __repr__(self):
        r = "%s : ((%s) x %s)" % (self.original_name, self.type_kind, self.element_count)
        if self.func_proto != None:
            r += " [%s]" % str(vars(self.func_proto))
        return r

class ArgumentInfo(object):
    """
    Holds one argument of function.
    """

    # Block adding members unintentionally
    __slots__ = ('original_name', 'api_name', 'type_kind', 'type_name')

    def __init__(self):
        self.original_name = ""
        self.api_name = ""
        self.type_kind = TypeKind.INVALID
        self.type_name = ""

    def __repr__(self):
        return str(vars(self))

class RetvalInfo(object):
    """
    Holds return value information.
    """

    # Block adding members unintentionally
    __slots__ = ('type_kind', 'type_original_name', 'type_api_name')

    def __init__(self):
        self.type_kind = TypeKind.INVALID
        self.type_original_name = ""
        self.type_api_name = ""

    def __repr__(self):
        return str(vars(self))

class FunctionInfo(object):
    """
    Holds function information.
    """

    # Block adding members unintentionally
    __slots__ = ('original_name', 'api_name', 'args', 'retval')

    def __init__(self):
        self.original_name = ""
        self.api_name = ""
        self.args = []
        self.retval = None

    def __repr__(self):
        return str(vars(self))

class ParseContext(object):
    """
    Holds current parsing context.
    """

    # Collection Mode
    Decl_Unknown  = 0
    Decl_Macro    = 1
    Decl_Typedef  = 2
    Decl_Enum     = 3
    Decl_Struct   = 4
    Decl_Function = 5

    def __init__(self, fn = ""):
        self.collection_mode = ParseContext.Decl_Unknown
        self.depth = 0
        self.decl_enums = {}
        self.decl_macros = {}
        self.decl_structs = {}
        self.decl_typedefs = {}
        self.decl_functions = {}
        self.parse_file = fn

    def push(self):
        self.depth += 1

    def pop(self):
        self.depth -= 1

    def add_decl_enum(self, name=None, values=[]):
        if name == None or name == "":
            name = "anonymous_enum_"  + str(len(self.decl_enums))
        self.decl_enums[name] = values

    def add_decl_macro(self, macro_name, macro_values):
        self.decl_macros[macro_name] = macro_values

    def add_decl_struct(self, struct_name, struct_value):
        self.decl_structs[struct_name] = struct_value

    def add_decl_typedef(self, typedef_name, typedef_value):
        self.decl_typedefs[typedef_name] = typedef_value

    def add_decl_function(self, function_name, function_value):
        self.decl_functions[function_name] = function_value

    def has_decl_enum(self, name=None):
        if name == None or name == "":
            name = "anonymous_enum_"  + str(len(self.decl_enums))
        return name in self.decl_enums.keys()

    def has_decl_macro(self, macro_name):
        return macro_name in self.decl_macros.keys()

    def has_decl_struct(self, struct_name):
        return struct_name in self.decl_structs.keys()

    def has_decl_typedef(self, typedef_name):
        return typedef_name in self.decl_typedefs.keys()

    def has_decl_function(self, function_name):
        return function_name in self.decl_functions.keys()

####################################################################################################

def collect_decl_macro(ctx, cursor):

    if str(cursor.location.file) != ctx.parse_file:
        return # pass

    ctx.collection_mode = ParseContext.Decl_Macro
    tokens = list(cursor.get_tokens())
    macro_name = str(tokens[0].spelling)
    macro_values = list(map((lambda t: str(t.spelling)), tokens[1:len(tokens)]))
    if len(macro_values) == 1 and re.search(r'^".+"$', macro_values[0]):
        # Add backslashes to escape double quotations
        # e.g.) "SDL_FRAMEBUFFER_ACCELERATION" -> "\"SDL_FRAMEBUFFER_ACCELERATION"\"
        macro_values[0] = macro_values[0].replace('"', '\\"')
        macro_values[0] = '"' + macro_values[0] + '"'

    # pick out values with these prefixes:
    # - SDL_
    # - AUDIO_ (for SDL_audio)
    # - SDL2_ (for SDL2_gfx)
    # - MIX_ (for SDL_mixer)
    # - TTF_ (for SDL_ttf)
    # - SOUND_ (for SDL_sound)
    if re.match(r"^SDL_|^AUDIO_|^SDL2_|^MIX_|^TTF_|^SOUND", macro_name):
        ctx.add_decl_macro(macro_name, macro_values)
    ctx.collection_mode = ParseContext.Decl_Unknown

def collect_decl_typedef(ctx, cursor):

    if str(cursor.location.file) != ctx.parse_file:
        return # pass

    ctx.collection_mode = ParseContext.Decl_Typedef
    ctx.push()

    underlying_type = cursor.underlying_typedef_type

    typedef_info = TypedefInfo()
    typedef_info.original_name = cursor.displayname
    match_obj = re.match(r"^SDL_(.+)", typedef_info.original_name)
    if match_obj:
        # Remove prefix 'SDL_' from name
        typedef_info.api_name = match_obj.group(1)
    else:
        typedef_info.api_name = typedef_info.original_name
    typedef_info.type_kind = underlying_type.get_canonical().kind
    typedef_info.element_count = 1

    if underlying_type.kind in {TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY, TypeKind.VARIABLEARRAY, TypeKind.DEPENDENTSIZEDARRAY}:
        typedef_info.type_kind = underlying_type.get_array_element_type().get_canonical().kind
        typedef_info.element_count = underlying_type.get_array_size()
    elif underlying_type.kind == TypeKind.POINTER:
        canonical_type = underlying_type.get_pointee().get_canonical()
        if canonical_type.kind == TypeKind.FUNCTIONPROTO:
            typedef_info.type_kind = canonical_type.kind

            typedef_info.func_proto = FunctionInfo()

            result_type = canonical_type.get_result()
            retval_info = RetvalInfo()
            retval_info.type_original_name = result_type.spelling
            match_obj = re.match(r"^SDL_(.+)", retval_info.type_original_name)
            if match_obj:
                # Remove prefix 'SDL_' from name
                retval_info.type_api_name = match_obj.group(1)
            else:
                retval_info.type_api_name = retval_info.type_original_name
            retval_info.type_kind = result_type.kind

            typedef_info.func_proto.retval = retval_info

            arg_types = canonical_type.argument_types()
            for arg_type in arg_types:
                arg_info = ArgumentInfo()
                arg_info.type_name = arg_type.spelling
                arg_info.type_kind = arg_type.get_canonical().kind
                typedef_info.func_proto.args.append(arg_info)
    elif underlying_type.kind == TypeKind.ELABORATED:
        cursor_decl = underlying_type.get_declaration()
        if cursor_decl.kind == CursorKind.STRUCT_DECL or cursor_decl.kind == CursorKind.UNION_DECL:
            ctx.push()
            collect_decl_struct(ctx, cursor_decl, cursor_decl.spelling, typedef_info.original_name)
            ctx.pop()
    else:
        pass

    ctx.pop()
    ctx.add_decl_typedef(typedef_info.original_name, typedef_info)
    ctx.collection_mode = ParseContext.Decl_Unknown

def collect_decl_enum(ctx, cursor):

    if str(cursor.location.file) != ctx.parse_file:
        return # pass

    ctx.collection_mode = ParseContext.Decl_Enum
    val = []
    ctx.push()
    for child in cursor.get_children():
        if child.kind == CursorKind.ENUM_CONSTANT_DECL:
            pair = (child.displayname, child.enum_value)
            val.append(pair)
    ctx.pop()
    ctx.add_decl_enum(name=cursor.displayname, values=val)
    ctx.collection_mode = ParseContext.Decl_Unknown

#
# TODO : Merge anonymous structs into one union (e.g. SDL_RWops)
#
def collect_decl_struct(ctx, cursor, struct_name=None, typedef_name=None):

    if str(cursor.location.file) != ctx.parse_file:
        return # pass

    ctx.collection_mode = ParseContext.Decl_Struct

    n_children = len(list(cursor.get_children()))
    if (not cursor.kind in {CursorKind.STRUCT_DECL, CursorKind.UNION_DECL}) or n_children <= 0:
        return

    struct_name = struct_name if struct_name != None else cursor.displayname
    if ctx.has_decl_struct(struct_name):
        return

    struct_info = StructInfo()
    struct_info.kind = cursor.kind # CursorKind.STRUCT_DECL or CursorKind.UNION_DECL
    struct_info.original_name = struct_name

    #print(struct_name)
    #print(typedef_name)
    #print(struct_info.original_name)
    #print(struct_info.api_name)

    # NOTE : unnamed struct/union will be collected at 'collect_decl_typedef'.
    # ex.) typedef union {void *ptr; int id;} nk_handle; (exposed as an unnamed struct/union here)
    # NOTE : [2023-04-09] unnamed structs/unions are also reported like:
    # ex.) unnamed at ./SDL3/SDL_guid.h:55:9
    unnamed_struct = struct_info.original_name == "" or "unnamed at" in struct_info.original_name

    if unnamed_struct:
        # Definitions like 'typede struct (anonymous) {...} StructName' may cause to come here.
        # e.g.)
        # typedef struct
        # {
        #     Uint8 r, g, b;
        # } SDL_MessageBoxColor;
        if typedef_name == None:
            return
        struct_info.original_name = typedef_name

    # fields = cursor.type.get_fields()
    #
    # for field in fields:
    for field in cursor.get_children():

        if not field.is_definition(): # e.g.) struct SDL_BlitMap *map;
            continue

        canonical_kind = field.type.get_canonical().kind

        field_info = FieldInfo()
        field_info.element_count = 1
        field_info.element_name = field.displayname
        field_info.type_kind = canonical_kind
        field_info.type_original_name = field.type.spelling

        match_obj = re.match(r"^SDL_(.+)", field_info.type_original_name)
        if match_obj:
            # Remove prefix 'SDL_' from struct name and capitalize first character
            field_info.type_api_name = match_obj.group(1)[0].upper() + match_obj.group(1)[1:]
        else:
            field_info.type_api_name = field_info.type_original_name

        if canonical_kind in {TypeKind.CONSTANTARRAY, TypeKind.INCOMPLETEARRAY, TypeKind.VARIABLEARRAY, TypeKind.DEPENDENTSIZEDARRAY}:
            # ex.) char text[SDL_TEXTEDITINGEVENT_TEXT_SIZE];
            # ex.) Uint8 padding[56];
            element_kind = field.type.get_array_element_type().get_canonical().kind
            element_detail = ""
            if element_kind in {TypeKind.ELABORATED, TypeKind.RECORD}:
                element_detail = " (" + field.type.spelling + ")"
            field_info.element_count = field.type.get_array_size()
            field_info.type_kind = element_kind
            field_info.type_original_name = field.type.get_array_element_type().spelling
            match_obj = re.match(r"^SDL_(.+)", field_info.type_original_name)
            if match_obj:
                # Remove prefix 'SDL_' from struct name and capitalize first character
                field_info.type_api_name = match_obj.group(1)[0].upper() + match_obj.group(1)[1:]
            else:
                field_info.type_api_name = field_info.type_original_name
        elif canonical_kind in {TypeKind.ELABORATED, TypeKind.RECORD}:
            cursor_decl = field.type.get_canonical()
            if cursor_decl.kind == CursorKind.STRUCT_DECL or cursor_decl.kind == CursorKind.UNION_DECL:
                ctx.push()
                collect_decl_struct(ctx, cursor_decl, cursor_decl.spelling)
                ctx.pop()
        else:
            # [2018-03-21] A wrong member 'packed' is mixed in the parsed result of 'SDL_AudioCVT'.
            # "#define SDL_AUDIOCVT_PACKED __attribute__((packed))" and "SDL_AUDIOCVT_PACKED SDL_AudioCVT;" might cause this problem.
            # The condition below seems useful for preventing wrong members to be added.
            if field_info.type_kind == TypeKind.INVALID and field.get_field_offsetof() == -1:
                continue

        struct_info.push(field_info)

    match_obj = re.match(r"^SDL_(.+)", struct_info.original_name)
    if match_obj:
        # Remove prefix 'SDL_' from struct name and capitalize first character
        struct_info.api_name = match_obj.group(1)[0].upper() + match_obj.group(1)[1:]
    else:
        struct_info.api_name = struct_info.original_name

    ctx.add_decl_struct(struct_info.original_name, struct_info)

    ctx.collection_mode = ParseContext.Decl_Unknown

def collect_decl_function(ctx, cursor):

    if str(cursor.location.file) != ctx.parse_file:
        return # pass

    ctx.collection_mode = ParseContext.Decl_Function
    ctx.push()

    func_info = FunctionInfo()
    func_info.original_name = cursor.spelling

    match_obj = re.match(r"^SDL_(.+)", func_info.original_name)
    if match_obj:
        # Remove prefix 'SDL_' from name
        func_info.api_name = match_obj.group(1)
    else:
        func_info.api_name = func_info.original_name

    retval_info = RetvalInfo()
    retval_info.type_original_name = cursor.result_type.spelling
    match_obj = re.match(r"^SDL_(.+)", retval_info.type_original_name)
    if match_obj:
        # Remove prefix 'SDL_' from name
        retval_info.type_api_name = match_obj.group(1)
    else:
        retval_info.type_api_name = retval_info.type_original_name
    retval_info.type_kind = cursor.result_type.get_canonical().kind

    func_info.retval = retval_info

    args = cursor.get_arguments()
    for arg in args:
        arg_info = ArgumentInfo()
        arg_info.original_name = arg.spelling
        match_obj = re.match(r"^SDL_(.+)", arg_info.original_name)
        if match_obj:
            # Remove prefix 'SDL_' from name
            arg_info.api_name = match_obj.group(1)
        else:
            arg_info.api_name = arg_info.original_name
        arg_info.type_name = arg.type.spelling
        arg_info.type_kind = arg.type.get_canonical().kind
        func_info.args.append(arg_info)

    ctx.add_decl_function(func_info.original_name, func_info)

    ctx.pop()
    ctx.collection_mode = ParseContext.Decl_Unknown

def collect_decl(ctx, cursor):
    ctx.push()

    for child in cursor.get_children():
        if child.kind == CursorKind.MACRO_DEFINITION:
            collect_decl_macro(ctx, child)
    for child in cursor.get_children():
        if child.kind == CursorKind.TYPEDEF_DECL:
             collect_decl_typedef(ctx, child)
    for child in cursor.get_children():
        if child.kind == CursorKind.ENUM_DECL:
            collect_decl_enum(ctx, child)
    for child in cursor.get_children():
        if child.kind in {CursorKind.STRUCT_DECL, CursorKind.UNION_DECL}:
            collect_decl_struct(ctx, child)
    for child in cursor.get_children():
        if child.kind == CursorKind.FUNCTION_DECL:
            collect_decl_function(ctx, child)
    for child in cursor.get_children():
        parse_recursively = child.kind not in {CursorKind.MACRO_DEFINITION, CursorKind.TYPEDEF_DECL, CursorKind.ENUM_DECL, CursorKind.STRUCT_DECL, CursorKind.UNION_DECL, CursorKind.FUNCTION_DECL}
        if parse_recursively:
            collect_decl(ctx, child)

    ctx.pop()


parser_arg = [
    "-fsyntax-only", #, "-DDOXYGEN_SHOULD_IGNORE_THIS"
    "-DDECLSPEC=",
    "-DSDLCALL=",
    "-I./",
]

parser_opt = TranslationUnit.PARSE_SKIP_FUNCTION_BODIES | TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD | TranslationUnit.PARSE_INCOMPLETE

def execute(ctx):
    idx = Index.create()

    try:
        tu = idx.parse(ctx.parse_file, args=parser_arg, unsaved_files=None, options=parser_opt)
        ctx.depth = 0
        collect_decl(ctx, tu.cursor)

        for typedef_name, typedef_info in ctx.decl_typedefs.items():
            register_sdl2_cindex_mapping(str(typedef_info.type_kind), typedef_info.api_name)

    except TranslationUnitLoadError as err:
        print(err)

    assert ctx.depth == 0
