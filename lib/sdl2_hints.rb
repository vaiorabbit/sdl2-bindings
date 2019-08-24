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
      attach_function :SDL_SetHintWithPriority, [:pointer, :pointer, :int], :int
      attach_function :SDL_SetHint, [:pointer, :pointer], :int
      attach_function :SDL_GetHint, [:pointer], :pointer
      attach_function :SDL_GetHintBoolean, [:pointer, :int], :int
      attach_function :SDL_AddHintCallback, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_DelHintCallback, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_ClearHints, [], :void
  end

end

