import sdl2_parser, sdl2_generator

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL.h')
    sdl2_parser.execute(ctx)

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, module_name = 'main')
