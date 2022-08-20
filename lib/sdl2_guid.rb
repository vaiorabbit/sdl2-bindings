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

  class GUID < FFI::Struct
    layout(
      :data, [:uchar, 16],
    )
  end


  # Function

  def self.setup_guid_symbols(output_error = false)
    symbols = [
      :SDL_GUIDToString,
      :SDL_GUIDFromString,
    ]
    apis = {
      :SDL_GUIDToString => :GUIDToString,
      :SDL_GUIDFromString => :GUIDFromString,
    }
    args = {
      :SDL_GUIDToString => [GUID.by_value, :pointer, :int],
      :SDL_GUIDFromString => [:pointer],
    }
    retvals = {
      :SDL_GUIDToString => :void,
      :SDL_GUIDFromString => GUID.by_value,
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

