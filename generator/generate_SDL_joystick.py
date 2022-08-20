import sdl2_parser, sdl2_generator

TYPEDEF_PREFIX_JOYSTICK = """
  JoystickGUID = SDL::GUID
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL_joystick.h')
    sdl2_parser.execute(ctx)

    ctx.decl_structs['JoystickGUID'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            prefix = sdl2_generator.PREFIX + "require_relative 'sdl2_guid'\n",
                            typedef_prefix = TYPEDEF_PREFIX_JOYSTICK,
                            setup_method_name = 'joystick')
