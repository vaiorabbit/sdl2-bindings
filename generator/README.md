# Usage #

*   Copy SDL2 headers into ./SDL2
    *   You can also put these headers to make bindings:
        *   SDL_gfx(SDL2_rotozoom.h, SDL2_imageFilter.h, SDL2_gfxPrimitives.h, SDL2_framerate.h)
        *   SDL_image (SDL_image.h)
        *   SDL_mixer (SDL_mixer.h)
        *   SDL_ttf (SDL_ttf.h)
*   Patch ./SDL2/SDL_config.h by commenting out the line '#define HAVE_INTTYPES_H 1'
    *   By including 'inttypes.h', all SDL integer types (Sint8, etc.) are interpreted as 'TypeKind.INT'.
*   Generate mapping tables with ./generate_initial_mapping.sh to get
    *   sdl2_cindex_mapping.json
    *   sdl2_define_mapping.json
*   Edit sdl2_define_mapping.json
    *   This mapping table contains '#define' macros collected from headers in ./SDL2/ folder.
    *   Each lines represent key-value pair that will be used for generated Python codes.
        *   ex.) The line collected from './SDL2/SDL.h":
                "SDL_INIT_TIMER" : "0x00000001"
            will be appeared in sdl2.py:
                SDL_INIT_TIMER = 0x00000001
        *   So if you find value that is inappropreate for Python syntax,
            you should fix it or make it 'null'. The 'null'ed marcros will not
            appear in the generated Python codes.
