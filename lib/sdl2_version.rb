# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_MAJOR_VERSION = 2
  SDL_MINOR_VERSION = 0
  SDL_PATCHLEVEL = 10

  # Enum


  # Typedef


  # Struct

  class SDL_version < FFI::Struct
    layout(
      :major, :uchar,
      :minor, :uchar,
      :patch, :uchar,
    )
  end


  # Function

  def self.setup_version_symbols()
      attach_function :SDL_GetVersion, [:pointer], :void
      attach_function :SDL_GetRevision, [], :pointer
      attach_function :SDL_GetRevisionNumber, [], :int
  end

end

