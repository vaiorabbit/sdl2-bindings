# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  ENOMEM = 0
  EFREAD = 1
  EFWRITE = 2
  EFSEEK = 3
  UNSUPPORTED = 4
  LASTERROR = 5

  # Typedef

  typedef :int, :SDL_errorcode

  # Struct


  # Function

  def self.setup_error_symbols(output_error = false)
    symbols = [
      :SDL_SetError,
      :SDL_GetError,
      :SDL_GetErrorMsg,
      :SDL_ClearError,
      :SDL_Error,
    ]
    apis = {
      :SDL_SetError => :SetError,
      :SDL_GetError => :GetError,
      :SDL_GetErrorMsg => :GetErrorMsg,
      :SDL_ClearError => :ClearError,
      :SDL_Error => :Error,
    }
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
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

