import sdl2_parser, sdl2_generator

POSTFIX_KEYCODE = """
# TODO #define KMOD_CTRL, #define KMOD_SHIFT, #define KMOD_ALT and #define KMOD_GUI
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_keycode.h')
    sdl2_parser.execute(ctx)

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, postfix = sdl2_generator.POSTFIX + POSTFIX_KEYCODE,
                            setup_method_name = 'keycode')
