#include <ffi/ffi.h>
#include <SDL2/SDL.h>
#include <stdio.h>

#define REPORT_SIZEOF(type) printf("Size of %s == %lu\n", #type, sizeof(type))

int main(int argc, char **argv)
{
    REPORT_SIZEOF(void*);
    REPORT_SIZEOF(unsigned long long);
    REPORT_SIZEOF(SDL_Event);
    // SDL_Init(SDL_INIT_EVERYTHING);
    // SDL_Quit();

    // Ref.: /ext/fiddle/conversions.h
    typedef union
    {
        ffi_arg  fffi_arg;     /* rvalue smaller than unsigned long */
        ffi_sarg fffi_sarg;    /* rvalue smaller than signed long */
        unsigned char uchar;   /* ffi_type_uchar */
        signed char   schar;   /* ffi_type_schar */
        unsigned short ushort; /* ffi_type_sshort */
        signed short sshort;   /* ffi_type_ushort */
        unsigned int uint;     /* ffi_type_uint */
        signed int sint;       /* ffi_type_sint */
        unsigned long ulong;   /* ffi_type_ulong */
        signed long slong;     /* ffi_type_slong */
        float ffloat;          /* ffi_type_float */
        double ddouble;        /* ffi_type_double */
#if HAVE_LONG_LONG
        unsigned LONG_LONG ulong_long; /* ffi_type_ulong_long */
        signed LONG_LONG slong_long; /* ffi_type_ulong_long */
#endif
        void * pointer;        /* ffi_type_pointer */
    } fiddle_generic;
    REPORT_SIZEOF(fiddle_generic);

    return 0;
}

// SDL 2.0.3:
//
// $ clang++ -o sizeof sizeof.cpp `sdl2-config --cflags` `sdl2-config --libs` 
// $ ./sizeof
// Size of void* == 8
// Size of unsigned long long == 8
// Size of SDL_Event == 56
// Size of fiddle_generic == 8
