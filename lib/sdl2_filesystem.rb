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
    filesystem_symbols = [
      :SDL_GetBasePath,
      :SDL_GetPrefPath,
    ]
    filesystem_args = {
      :SDL_GetBasePath => [], 
      :SDL_GetPrefPath => [:pointer, :pointer], 
    }
    filesystem_retvals = {
      :SDL_GetBasePath => :pointer,
      :SDL_GetPrefPath => :pointer,
    }
    filesystem_symbols.each do |sym|
      begin
        attach_function sym, filesystem_args[sym], filesystem_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

