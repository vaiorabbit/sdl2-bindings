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

  typedef :long_long, :SDL_GestureID

  # Struct


  # Function

  def self.setup_gesture_symbols(output_error = false)
    symbols = [
      :SDL_RecordGesture,
      :SDL_SaveAllDollarTemplates,
      :SDL_SaveDollarTemplate,
      :SDL_LoadDollarTemplates,
    ]
    apis = {
      :SDL_RecordGesture => :RecordGesture,
      :SDL_SaveAllDollarTemplates => :SaveAllDollarTemplates,
      :SDL_SaveDollarTemplate => :SaveDollarTemplate,
      :SDL_LoadDollarTemplates => :LoadDollarTemplates,
    }
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
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

