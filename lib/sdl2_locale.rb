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

  class Locale < FFI::Struct
    layout(
      :language, :pointer,
      :country, :pointer,
    )
  end


  # Function

  def self.setup_locale_symbols(output_error = false)
    symbols = [
      :SDL_GetPreferredLocales,
    ]
    apis = {
      :SDL_GetPreferredLocales => :GetPreferredLocales,
    }
    args = {
      :SDL_GetPreferredLocales => [],
    }
    retvals = {
      :SDL_GetPreferredLocales => :pointer,
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

