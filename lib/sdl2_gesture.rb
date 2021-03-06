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

  typedef :long_long, :SDL_GestureID

  # Struct


  # Function

  def self.setup_gesture_symbols()
    symbols = [
      :SDL_RecordGesture,
      :SDL_SaveAllDollarTemplates,
      :SDL_SaveDollarTemplate,
      :SDL_LoadDollarTemplates,
    ]
    args = {
      :SDL_RecordGesture => [:long_long],
      :SDL_SaveAllDollarTemplates => [:pointer],
      :SDL_SaveDollarTemplate => [:long_long, :pointer],
      :SDL_LoadDollarTemplates => [:long_long, :pointer],
    }
    retvals = {
      :SDL_RecordGesture => :int,
      :SDL_SaveAllDollarTemplates => :int,
      :SDL_SaveDollarTemplate => :int,
      :SDL_LoadDollarTemplates => :int,
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

