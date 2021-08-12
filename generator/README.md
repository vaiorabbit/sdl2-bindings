# Usage #

These instructions are tested only on macOS environment.

*   Copy SDL2 headers into ./SDL2
    *   You can also put these headers to make bindings:
        *   SDL_gfx(SDL2_rotozoom.h, SDL2_imageFilter.h, SDL2_gfxPrimitives.h, SDL2_framerate.h)
        *   SDL_image (SDL_image.h)
        *   SDL_mixer (SDL_mixer.h)
        *   SDL_ttf (SDL_ttf.h)

*   Patch 2 header files manually:
    *   SDL2/SDL_config_macosx.h : comment out these lines
        *   '#define HAVE_INTTYPES_H 1' and '#define HAVE_STDINT_H 1'
    *   SDL2/SDL_stdinc.h : put these typedefs by hand:

            #if defined(HAVE_INTTYPES_H)
            # include <inttypes.h>
            #elif defined(HAVE_STDINT_H)
            # include <stdint.h>
            #else // ↓↓↓
            typedef char int8_t;
            typedef short int16_t;
            typedef int int32_t;
            typedef long long int64_t;
            typedef unsigned char uint8_t;
            typedef unsigned short uint16_t;
            typedef unsigned int uint32_t;
            typedef unsigned long long uint64_t;
            #endif // ↑↑↑

    *   By including 'inttypes.h' or 'stdint.h', all SDL integer types (Sint8, etc.) are interpreted as 'TypeKind.INT'. Since macOS Catalina and CIndex of LLVM 9.0.0, my script cannot resolve integer types into CIndex type kinds (e.g. TypeKind.SCHAR) correctly.

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

*   Run batch_generate.sh
