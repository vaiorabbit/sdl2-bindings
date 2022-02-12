# sdl2-bindings port of testaudioinfo.c
require 'sdl2'
# require_relative '../lib/sdl2'
require_relative 'util'

def print_devices(iscapture)
  typestr = iscapture ? "capture" : "output"
  n = SDL.GetNumAudioDevices(iscapture)

  puts("#{typestr} devices:")

  if n == -1
    printf("  Driver can't detect specific %s devices.\n\n", typestr)
  elsif n == 0
    printf("  No %s devices found.\n\n", typestr)
  else
    n.times do |i|
      printf("  %s\n", SDL.GetAudioDeviceName(i, iscapture).read_string)
    end
    printf("\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_AUDIO)
  exit if success < 0
  n = SDL.GetNumAudioDrivers()
  if n == 0
    printf("No built-in audio drivers\n\n")
  else
    print("Built-in audio drivers:\n")
    n.times do |i|
      printf("  %s\n", SDL.GetAudioDriver(i).read_string)
    end
  end

  printf("Using audio driver: %s\n\n", SDL.GetCurrentAudioDriver().read_string)

  print_devices(0)
  print_devices(1)

  SDL.Quit()
end

=begin

  # Original Copyright Notice:

  Copyright (C) 1997-2014 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely.
=end
