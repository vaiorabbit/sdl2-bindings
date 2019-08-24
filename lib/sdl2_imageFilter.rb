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

  def self.setup_gfx_imagefilter_symbols()
      attach_function :SDL_imageFilterMMXdetect, [], :int
      attach_function :SDL_imageFilterMMXoff, [], :void
      attach_function :SDL_imageFilterMMXon, [], :void
      attach_function :SDL_imageFilterAdd, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterMean, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterSub, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterAbsDiff, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterMult, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterMultNor, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterMultDivby2, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterMultDivby4, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterBitAnd, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterBitOr, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterDiv, [:pointer, :pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterBitNegation, [:pointer, :pointer, :uint], :int
      attach_function :SDL_imageFilterAddByte, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterAddUint, [:pointer, :pointer, :uint, :uint], :int
      attach_function :SDL_imageFilterAddByteToHalf, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterSubByte, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterSubUint, [:pointer, :pointer, :uint, :uint], :int
      attach_function :SDL_imageFilterShiftRight, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterShiftRightUint, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterMultByByte, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterShiftRightAndMultByByte, [:pointer, :pointer, :uint, :uchar, :uchar], :int
      attach_function :SDL_imageFilterShiftLeftByte, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterShiftLeftUint, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterShiftLeft, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterBinarizeUsingThreshold, [:pointer, :pointer, :uint, :uchar], :int
      attach_function :SDL_imageFilterClipToRange, [:pointer, :pointer, :uint, :uchar, :uchar], :int
      attach_function :SDL_imageFilterNormalizeLinear, [:pointer, :pointer, :uint, :int, :int, :int, :int], :int
  end

end

