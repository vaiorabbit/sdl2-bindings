<!-- -*- mode:markdown; coding:utf-8; -*- -->

# sdl2-bindings : Yet another SDL2 wrapper for Ruby #

[Notice] This project is experimental and really premature.

*   Created : 2015-09-19
*   Last modified : 2016-04-03

## Features ##

*   Based on Fiddle (Ruby standard library)
    *   There's no need to build C extension library


## Limitations ##

*   Some APIs cannot be imported.
	*   Fiddle is unable to handle functions that return a struct instance by value.
		1.  Joystick APIs relating GUID (SDL_JoystickGetDeviceGUID, SDL_GameControllerMappingForGUID, etc.)
	*   Fiddle cannot handle variadic functions like printf.
		1.  SDL_SetError

*   Some struct/union members are decomposed/aggregated into other primitive types. Fiddle::Importer.struct disallows to write struct member directly.
	1.  SDL_Event#key (SDL_Keysym)
	2.  SDL_Surface#clip_rect (SDL_Rect)
	3.  SDL_GameControllerButtonBind#value.button, axis, etc. are aggregated into 'int value[2]'.

*   SDL's callback functions are not imported. Using them often cause interpreter crash.
	1.  SDL_AddTimer, SDL_RemoveTimer, etc.


## Tested Environment ##

*   [2015-09-19] SDL 2.0.3 (Installed via Homebrew)
    *   Mac OS X 10.10.5, ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
*   [2016-04-03] SDL 2.0.4 (Installed via Homebrew)
    *   Mac OS X 10.11.4, ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
    *   sdl2_gfx : 1.0.1
    *   sdl2_image : 2.0.1
    *   sdl2_mixer : 2.0.1
    *   sdl2_ttf : 2.0.13


## License ##

The zlib/libpng License ( http://opensource.org/licenses/Zlib ).

    sdl2-bindings : Yet another SDL2 wrapper for Ruby
    Copyright (c) 2015-2016 vaiorabbit <http://twitter.com/vaiorabbit>

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
