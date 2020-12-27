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
    symbols = [
      :SDL_SetError,
      :SDL_GetError,
      :SDL_GetErrorMsg,
      :SDL_ClearError,
      :SDL_Error,
    ]
    args = {
      :SDL_SetError => [:pointer],
      :SDL_GetError => [],
      :SDL_GetErrorMsg => [:pointer, :int],
      :SDL_ClearError => [],
      :SDL_Error => [:int],
    }
    retvals = {
      :SDL_SetError => :int,
      :SDL_GetError => :pointer,
      :SDL_GetErrorMsg => :pointer,
      :SDL_ClearError => :void,
      :SDL_Error => :int,
    }
    symbols.each do |sym|
      begin
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

