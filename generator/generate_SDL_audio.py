import sdl2_parser, sdl2_generator

POSTFIX_AUDIO = """
# TODO : def SDL_LoadWAV
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_audio.h')
    sdl2_parser.execute(ctx)

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx, postfix = sdl2_generator.POSTFIX + POSTFIX_AUDIO,
                            setup_method_name = 'audio',
    )
