import sdl2_parser, sdl2_generator

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_stdinc.h')
    sdl2_parser.execute(ctx)

    ctx.decl_functions['SDL_memset4'] = None
    ctx.decl_functions['SDL_memcpy4'] = None
    ctx.decl_functions['SDL_size_mul_overflow'] = None
    ctx.decl_functions['SDL_size_add_overflow'] = None
    ctx.decl_functions['SDL_size_mul_overflow_builtin'] = None
    ctx.decl_functions['SDL_size_add_overflow_builtin'] = None
    ctx.decl_functions['SDL_ALLOC_SIZE'] = None
    ctx.decl_functions['SDL_ALLOC_SIZE2'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_uint8'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_sint8'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_uint16'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_sint16'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_uint32'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_sint32'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_uint64'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_sint64'] = None
    ctx.decl_typedefs['SDL_DUMMY_ENUM'] = None
    ctx.decl_typedefs['SDL_compile_time_assert_enum'] = None

    ctx.decl_enums = {k:v for k, v in ctx.decl_enums.items() if v[0][0] != 'DUMMY_ENUM_VALUE'} # Omit 'DUMMY_ENUM_VALUE' from enum declarations

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, setup_method_name = 'stdinc')
