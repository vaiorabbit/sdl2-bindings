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


  # Typedef


  # Struct


  # Function

  def self.setup_filesystem_symbols(output_error = false)
    symbols = [
      :SDL_GetBasePath,
      :SDL_GetPrefPath,
    ]
    apis = {
      :SDL_GetBasePath => :GetBasePath,
      :SDL_GetPrefPath => :GetPrefPath,
    }
    args = {
      :SDL_GetBasePath => [],
      :SDL_GetPrefPath => [:pointer, :pointer],
    }
    retvals = {
      :SDL_GetBasePath => :pointer,
      :SDL_GetPrefPath => :pointer,
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

