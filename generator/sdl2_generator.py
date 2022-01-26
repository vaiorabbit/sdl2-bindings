import ctypes, re, sys
import sdl2_parser

PREFIX = """# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
"""

POSTFIX = """
end
"""

####################################################################################################

def sanitize_enum(ctx):
    pass

def sanitize_macro(ctx):
    # 0x____u -> 0x____
    pattern = re.compile(r'(0x[0-9a-fA-F]+)u')
    for macro_name, macro_value in ctx.decl_macros.items():
        if len(macro_value) != 1:
            continue
        m = re.search(pattern, macro_value[0])
        if m:
            ctx.decl_macros[macro_name][0] = m.group(1)

    # refer mapping
    for macro_name, macro_value in ctx.decl_macros.items():
        define_mapping = sdl2_parser.get_define_mapping(macro_name)
        if define_mapping:
            ctx.decl_macros[macro_name] = define_mapping
        else:
            ctx.decl_macros[macro_name] = None

    # contatinate (SDL_INIT_EVERYTHING, etc.)
    for macro_name, macro_value in ctx.decl_macros.items():
        if macro_value == None or len(macro_value) <= 1:
            continue
        ctx.decl_macros[macro_name] = [''.join(macro_value)]

def sanitize_struct(ctx):
    for struct_name, struct_info in ctx.decl_structs.items():
        if struct_info == None:
            continue
        underlying_ctypes_type = "FFI::Union" if str(struct_info.kind) == "CursorKind.UNION_DECL" else "FFI::Struct"
        struct_info.kind = underlying_ctypes_type
        for field in struct_info.fields:
            field.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(field.type_kind), field.type_api_name)

def sanitize_typedef(ctx):
    # refer mapping
    for typedef_name, typedef_info in ctx.decl_typedefs.items():
        if typedef_info.func_proto != None:
            for arg in typedef_info.func_proto.args:
                arg.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(arg.type_kind), arg.type_name)
            typedef_info.func_proto.retval.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(typedef_info.func_proto.retval.type_kind), typedef_info.func_proto.retval.type_original_name)
        else:
            if str(typedef_info.type_kind) == "TypeKind.RECORD":
                typedef_info.type_kind = None
            else:
                typedef_info.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(typedef_info.type_kind), typedef_info.original_name)

def sanitize_function(ctx):
    for func_name, func_info in ctx.decl_functions.items():
        if func_info == None:
            continue
        for arg in func_info.args:
            if sdl2_parser.is_sdl2_callback_type(arg.type_kind, arg.type_name):
                arg.type_kind = ":" + arg.type_name
            else:
                arg.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(arg.type_kind), arg.type_name)
        func_info.retval.type_kind = sdl2_parser.get_cindex_ctypes_mapping(str(func_info.retval.type_kind), func_info.retval.type_original_name)

def sanitize(ctx):
    sanitize_enum(ctx)
    sanitize_macro(ctx)
    sanitize_struct(ctx)
    sanitize_typedef(ctx)
    sanitize_function(ctx)

####################################################################################################

def generate_macrodefine(ctx, indent = ""):
    for macro_name, macro_value in ctx.decl_macros.items():
        if macro_value != None:
            macro_api_name = ""
            match_obj = re.match(r"^SDL_(.+)", macro_name)
            if match_obj:
                # Remove prefix 'SDL_' from name
                macro_api_name = match_obj.group(1)
            else:
                macro_api_name = macro_name
            print(indent + "%s = %s" % (macro_api_name, macro_value[0]), file = sys.stdout)

def generate_enum(ctx, indent = ""):
    for enum_name, enum_value in ctx.decl_enums.items():
        for enum in enum_value:
            enum_api_name = ""
            match_obj = re.match(r"^SDL_(.+)", enum[0])
            if match_obj:
                # Remove prefix 'SDL_' from name
                enum_api_name = match_obj.group(1)
            else:
                enum_api_name = enum[0]
            print(indent + "%s = %s" % (enum_api_name, enum[1]), file = sys.stdout)

def generate_typedef(ctx, indent = "", typedef_prefix="", typedef_postfix=""):
    if typedef_prefix != "":
        print(typedef_prefix, file = sys.stdout)
    for typedef_name, typedef_info in ctx.decl_typedefs.items():
        if typedef_info.type_kind == None:
            continue
        if typedef_info.func_proto != None:
            typedef_line = "callback :%s, ["  % typedef_name
            for i, arg in enumerate(typedef_info.func_proto.args):
                typedef_line += "%s%s" % ("" if i == 0 else ", ",  arg.type_kind)
            typedef_line += "], %s" % typedef_info.func_proto.retval.type_kind
        else:
            typedef_line = "typedef %s, :%s" % (typedef_info.type_kind, typedef_name)
        print(indent + typedef_line, file = sys.stdout)
    if typedef_postfix != "":
        print(typedef_postfix, file = sys.stdout)

def generate_structunion(ctx, indent = ""):
    for struct_name, struct_info in ctx.decl_structs.items():
        if struct_info == None:
            continue
        print(indent + "class %s < %s" % (struct_info.api_name, struct_info.kind), file = sys.stdout)
        print(indent + "  layout(", file = sys.stdout)
        for field in struct_info.fields:
            if field.element_count <= 1:
                print(indent + "    :%s, %s," % (field.element_name, field.type_kind), file = sys.stdout)
            else:
                print(indent + "    :%s, [%s, %s]," % (field.element_name, field.type_kind, field.element_count), file = sys.stdout)
        print(indent + "  )", file = sys.stdout)
        print(indent + "end\n", file = sys.stdout)

def generate_function(ctx, indent = "", setup_method_name = ""):
    print(indent + "def self.setup_%s_symbols(output_error = false)" % setup_method_name , file = sys.stdout)
    indent = "  "
    print(indent + "  symbols = [", file = sys.stdout)
    for func_name, func_info in ctx.decl_functions.items():
        if func_info == None:
            continue
        print(indent + "    :%s," % func_info.original_name, file = sys.stdout)
    print(indent + "  ]", file = sys.stdout)

    print(indent + "  apis = {", file = sys.stdout)
    for func_name, func_info in ctx.decl_functions.items():
        if func_info == None:
            continue
        print(indent + "    :%s => :%s," % (func_info.original_name, func_info.api_name), file = sys.stdout)
    print(indent + "  }", file = sys.stdout)

    print(indent + "  args = {", file = sys.stdout)
    for func_name, func_info in ctx.decl_functions.items():
        if func_info == None:
            continue
        print(indent + "    :%s => [" % func_info.original_name, file = sys.stdout, end='')
        if len(func_info.args) > 0:
            # Get Ruby FFI arguments
            args_ctype_list = list(map((lambda t: str(t.type_kind)), func_info.args))

            # Remove leading 'SDL_' string and add ".by_value" to struct arguments (e.g.: Color -> Color.by_value)
            arg_is_record = lambda arg: sdl2_parser.query_sdl2_cindex_mapping_entry_exists(arg) and sdl2_parser.get_sdl2_cindex_mapping_value(arg) == "TypeKind.RECORD"
            args_ctype_list = list(map((lambda arg: re.sub('^SDL_', '', arg) + ".by_value" if arg_is_record(arg) else arg), args_ctype_list))

            print(', '.join(args_ctype_list), file = sys.stdout, end='')
        print("],", file = sys.stdout)
    print(indent + "  }", file = sys.stdout)

    print(indent + "  retvals = {", file = sys.stdout)
    for func_name, func_info in ctx.decl_functions.items():
        if func_info == None:
            continue
        retval_str = str(func_info.retval.type_kind)
        if re.match(r"^SDL_", retval_str): # For functions that return SDL structs by value
            retval_str = func_info.retval.type_api_name + ".by_value"
        print(indent + "    :%s => %s," % (func_info.original_name, retval_str), file = sys.stdout)
    print(indent + "  }", file = sys.stdout)

    print(indent +
      """  symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{s}.") if output_error
      end""".format(s="{sym} (#{error})"))
    print(indent + "  end", file = sys.stdout)

    indent = "  "
    print(indent + "end", file = sys.stdout)


def generate(ctx, prefix = PREFIX, postfix = POSTFIX, *, setup_method_name = "", typedef_prefix="", typedef_postfix=""):

    print(prefix, file = sys.stdout)

    print("module SDL")

    indent = "  "

    print(indent + "extend FFI::Library")

    # macro
    print(indent + "# Define/Macro\n", file = sys.stdout)
    generate_macrodefine(ctx, indent)
    print("", file = sys.stdout)

    # enum
    print(indent + "# Enum\n", file = sys.stdout)
    generate_enum(ctx, indent)
    print("", file = sys.stdout)

    # typedef
    print(indent + "# Typedef\n", file = sys.stdout)
    generate_typedef(ctx, indent, typedef_prefix, typedef_postfix)
    print("", file = sys.stdout)

    # struct/union
    print(indent + "# Struct\n", file = sys.stdout)
    generate_structunion(ctx, indent)
    print("", file = sys.stdout)

    # function
    print(indent + "# Function\n", file = sys.stdout)
    generate_function(ctx, indent, setup_method_name)
    print(postfix, file = sys.stdout)

if __name__ == "__main__":
    pass
