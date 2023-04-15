import sdl2_parser, sdl2_generator

ENUM_POSTFIX_INIT = """
  INIT_EVERYTHING = INIT_TIMER | INIT_AUDIO | INIT_VIDEO | INIT_EVENTS | INIT_JOYSTICK | INIT_HAPTIC | INIT_GAMEPAD | INIT_SENSOR
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_init.h')
    sdl2_parser.execute(ctx)

    ctx.decl_macros.pop('SDL_INIT_EVERYTHING')

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            enum_postfix = ENUM_POSTFIX_INIT,
                            setup_method_name = 'init')
