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

  def self.setup_platform_symbols()
    platform_symbols = [
      :SDL_GetPlatform,
    ]
    platform_args = {
      :SDL_GetPlatform => [], 
    }
    platform_retvals = {
      :SDL_GetPlatform => :pointer,
    }
    platform_symbols.each do |sym|
      begin
        attach_function sym, platform_args[sym], platform_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

