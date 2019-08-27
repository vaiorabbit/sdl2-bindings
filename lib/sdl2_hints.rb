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

  SDL_HINT_DEFAULT = 0
  SDL_HINT_NORMAL = 1
  SDL_HINT_OVERRIDE = 2

  # Typedef

  typedef :int, :SDL_HintPriority
  callback :SDL_HintCallback, [:pointer, :pointer, :pointer, :pointer], :void

  # Struct


  # Function

  def self.setup_hints_symbols()
    hints_symbols = [
      :SDL_SetHintWithPriority,
      :SDL_SetHint,
      :SDL_GetHint,
      :SDL_GetHintBoolean,
      :SDL_AddHintCallback,
      :SDL_DelHintCallback,
      :SDL_ClearHints,
    ]
    hints_args = {
      :SDL_SetHintWithPriority => [:pointer, :pointer, :int], 
      :SDL_SetHint => [:pointer, :pointer], 
      :SDL_GetHint => [:pointer], 
      :SDL_GetHintBoolean => [:pointer, :int], 
      :SDL_AddHintCallback => [:pointer, :pointer, :pointer], 
      :SDL_DelHintCallback => [:pointer, :pointer, :pointer], 
      :SDL_ClearHints => [], 
    }
    hints_retvals = {
      :SDL_SetHintWithPriority => :int,
      :SDL_SetHint => :int,
      :SDL_GetHint => :pointer,
      :SDL_GetHintBoolean => :int,
      :SDL_AddHintCallback => :void,
      :SDL_DelHintCallback => :void,
      :SDL_ClearHints => :void,
    }
    hints_symbols.each do |sym|
      begin
        attach_function sym, hints_args[sym], hints_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

