# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_filesystem_symbols()
      attach_function :SDL_GetBasePath, [], :pointer
      attach_function :SDL_GetPrefPath, [:pointer, :pointer], :pointer
  end

end

