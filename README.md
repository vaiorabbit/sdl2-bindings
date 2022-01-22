<!-- -*- mode:markdown; coding:utf-8; -*- -->

# sdl2-bindings : Yet another SDL2 wrapper for Ruby #

*   Created : 2015-09-19
*   Last modified : 2022-01-22

## Features ##

*   Generated semi-automatically
*   Based on Ruby/FFI
    *   No need to build C extension library

## Limitations ##

*   Several original APIs originally defined with pre-processor macro are unavailable in this library (e.g. `SDL_LoadBMP`)

## Target version ##

*   [2022-01-21]
    *   SDL : 2.0.20
    *   SDL_image : 2.0.5
    *   SDL_mixer : 2.0.4
    *   SDL_ttf : 2.0.18
    *   SDL2_gfx : 1.0.4

<details>
<summary>Older versions</summary>

*   [2015-09-19] SDL 2.0.3
*   [2016-04-03] SDL 2.0.4
*   [2019-08-31] SDL 2.0.10
*   [2020-03-22] SDL 2.0.12
*   [2020-12-27] SDL 2.0.14
*   [2021-08-12] SDL 2.0.16
*   [2021-12-02] SDL 2.0.18

</details>

## Supported Environments ##

*   [2022-01-11] macOS Monterey (12.1), ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [arm64-darwin20]

<details>
<summary>Older Environments</summary>

*   [2021-12-02] macOS Big Sur (11.6), ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]
*   [2021-08-12] macOS Big Sur (11.5), ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [arm64-darwin20]
*   [2020-12-27] macOS Big Sur (11.0.1), ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [arm64-darwin20]
*   [2016-04-03] Mac OS X 10.11.4, ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
*   [2015-09-19] Mac OS X 10.10.5, ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]

</details>

## License ##

The zlib/libpng License ( http://opensource.org/licenses/Zlib ).

    sdl2-bindings : Yet another SDL2 wrapper for Ruby
    Copyright (c) 2015-2022 vaiorabbit <http://twitter.com/vaiorabbit>

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the authors be held liable for any damages
    arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
