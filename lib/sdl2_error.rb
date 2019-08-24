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

  SDL_ENOMEM = 0
  SDL_EFREAD = 1
  SDL_EFWRITE = 2
  SDL_EFSEEK = 3
  SDL_UNSUPPORTED = 4
  SDL_LASTERROR = 5

  # Typedef

  typedef :int, :SDL_errorcode

  # Struct


  # Function

  def self.setup_error_symbols()
      attach_function :SDL_SetError, [:pointer], :int
      attach_function :SDL_GetError, [], :pointer
      attach_function :SDL_ClearError, [], :void
      attach_function :SDL_Error, [:int], :int
  end

end

