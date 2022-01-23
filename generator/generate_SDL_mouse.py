import sdl2_parser, sdl2_generator

POSTFIX_MOUSE = """
# TODO : def SDL_BUTTON(X); (1 << ((X)-1)); end;
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL_mouse.h')
    sdl2_parser.execute(ctx)

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, postfix = sdl2_generator.POSTFIX + POSTFIX_MOUSE,
                            setup_method_name = 'mouse')
