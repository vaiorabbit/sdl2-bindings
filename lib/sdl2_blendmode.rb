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

  SDL_BLENDMODE_NONE = 0
  SDL_BLENDMODE_BLEND = 1
  SDL_BLENDMODE_ADD = 2
  SDL_BLENDMODE_MOD = 4
  SDL_BLENDMODE_INVALID = 2147483647
  SDL_BLENDOPERATION_ADD = 1
  SDL_BLENDOPERATION_SUBTRACT = 2
  SDL_BLENDOPERATION_REV_SUBTRACT = 3
  SDL_BLENDOPERATION_MINIMUM = 4
  SDL_BLENDOPERATION_MAXIMUM = 5
  SDL_BLENDFACTOR_ZERO = 1
  SDL_BLENDFACTOR_ONE = 2
  SDL_BLENDFACTOR_SRC_COLOR = 3
  SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4
  SDL_BLENDFACTOR_SRC_ALPHA = 5
  SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6
  SDL_BLENDFACTOR_DST_COLOR = 7
  SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 8
  SDL_BLENDFACTOR_DST_ALPHA = 9
  SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10

  # Typedef

  typedef :int, :SDL_BlendMode
  typedef :int, :SDL_BlendOperation
  typedef :int, :SDL_BlendFactor

  # Struct


  # Function

  def self.setup_blendmode_symbols()
      attach_function :SDL_ComposeCustomBlendMode, [:int, :int, :int, :int, :int, :int], :int
  end

end

