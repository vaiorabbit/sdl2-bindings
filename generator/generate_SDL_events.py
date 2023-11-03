import sdl2_parser, sdl2_generator

# # TODO : naming convention
# TYPEDEF_POSTFIX_EVENTS = """
#   class ClipboardEvent < FFI::Struct
#     layout(
#       :type, :uint,
#       :timestamp, :ulong_long,
#       :userdata, :pointer,
#     )
#   end
# """

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_events.h')
    sdl2_parser.execute(ctx)

    # TODO : naming convention
    ctx.decl_structs['ClipboardCancelled'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            prefix = sdl2_generator.PREFIX + "require_relative 'sdl2_keyboard'\n",
                            setup_method_name = 'events'
    )
