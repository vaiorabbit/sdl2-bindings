import sdl2_parser, sdl2_generator

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_log.h')
    sdl2_parser.execute(ctx)

    ctx.decl_functions['SDL_LogMessageV'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, setup_method_name = 'log')
