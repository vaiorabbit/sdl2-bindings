<!-- -*- mode:markdown; coding:utf-8; -*- -->

# sdl2-bindings : Yet another SDL2 wrapper for Ruby #

[Notice] This project is experimental and really premature.

*   Created : 2015-09-19
*   Last modified : 2015-09-22

## Features ##

*   Based on Fiddle (Ruby standard library)
    *   There's no need to build C extension library


## Limitations ##

*   Some APIs cannot be imported.
	*   Fiddle is unable to handle functions that return a struct instance by value.
		1.  Joystick APIs relating GUID (SDL_JoystickGetDeviceGUID, SDL_GameControllerMappingForGUID, etc.)
	*   Fiddle cannot handle variadic functions like printf.
		1.  SDL_SetError

*   Some struct/union members are decomposed into primitive types. Fiddle::Importer.struct disallows to write struct member directly.
	1.  SDL_Event#key (SDL_Keysym)
	2.  SDL_Surface#clip_rect (SDL_Rect)

*   SDL's callback functions are not imported. Using them often cause interpreter crash.
	1.  SDL_AddTimer, SDL_RemoveTimer, etc.


## License ##

The zlib/libpng License ( http://opensource.org/licenses/Zlib ).

    sdl2-bindings : Yet another SDL2 wrapper for Ruby
    Copyright (c) 2015 vaiorabbit <http://twitter.com/vaiorabbit>

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
