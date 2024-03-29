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

  BLENDMODE_NONE = 0
  BLENDMODE_BLEND = 1
  BLENDMODE_ADD = 2
  BLENDMODE_MOD = 4
  BLENDMODE_MUL = 8
  BLENDMODE_INVALID = 2147483647
  BLENDOPERATION_ADD = 1
  BLENDOPERATION_SUBTRACT = 2
  BLENDOPERATION_REV_SUBTRACT = 3
  BLENDOPERATION_MINIMUM = 4
  BLENDOPERATION_MAXIMUM = 5
  BLENDFACTOR_ZERO = 1
  BLENDFACTOR_ONE = 2
  BLENDFACTOR_SRC_COLOR = 3
  BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4
  BLENDFACTOR_SRC_ALPHA = 5
  BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6
  BLENDFACTOR_DST_COLOR = 7
  BLENDFACTOR_ONE_MINUS_DST_COLOR = 8
  BLENDFACTOR_DST_ALPHA = 9
  BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10

  # Typedef

  typedef :int, :SDL_BlendMode
  typedef :int, :SDL_BlendOperation
  typedef :int, :SDL_BlendFactor

  # Struct


  # Function

  def self.setup_blendmode_symbols(output_error = false)
    symbols = [
      :SDL_ComposeCustomBlendMode,
    ]
    apis = {
      :SDL_ComposeCustomBlendMode => :ComposeCustomBlendMode,
    }
    args = {
      :SDL_ComposeCustomBlendMode => [:int, :int, :int, :int, :int, :int],
    }
    retvals = {
      :SDL_ComposeCustomBlendMode => :int,
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

