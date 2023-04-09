import sdl2_parser, sdl2_generator

TYPEDEF_PREFIX_GAMEPAD = """
  class GamepadButtonBind_value_hat < FFI::Struct
    layout(
        :hat, :int,
        :hat_mask, :int,
    )
  end

  class GamepadButtonBind_value < FFI::Struct
    layout(
        :button, :int,
        :axis, :int,
        :hat, GamepadButtonBind_value_hat,
    )
  end

  class GamepadButtonBind < FFI::Struct
    layout(
        :bindType, :int,
        :value, GamepadButtonBind_value,
    )
  end
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL_gamepad.h')
    sdl2_parser.execute(ctx)

    # TODO : Merge anonymous structs into one union (e.g. SDL_RWops)
    #
    # SDL_GamepadButtonBind is a bit complicated so I unfortunately have to
    # substitute the parsed definition with my handwritten one.
    ctx.decl_structs['SDL_GamepadButtonBind'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            prefix = sdl2_generator.PREFIX + "require_relative 'sdl2_joystick'\n",
                            typedef_prefix = TYPEDEF_PREFIX_GAMEPAD,
                            setup_method_name = 'gamepad'
    )