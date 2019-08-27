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
    gfx_imagefilter_symbols = [
      :SDL_imageFilterMMXdetect,
      :SDL_imageFilterMMXoff,
      :SDL_imageFilterMMXon,
      :SDL_imageFilterAdd,
      :SDL_imageFilterMean,
      :SDL_imageFilterSub,
      :SDL_imageFilterAbsDiff,
      :SDL_imageFilterMult,
      :SDL_imageFilterMultNor,
      :SDL_imageFilterMultDivby2,
      :SDL_imageFilterMultDivby4,
      :SDL_imageFilterBitAnd,
      :SDL_imageFilterBitOr,
      :SDL_imageFilterDiv,
      :SDL_imageFilterBitNegation,
      :SDL_imageFilterAddByte,
      :SDL_imageFilterAddUint,
      :SDL_imageFilterAddByteToHalf,
      :SDL_imageFilterSubByte,
      :SDL_imageFilterSubUint,
      :SDL_imageFilterShiftRight,
      :SDL_imageFilterShiftRightUint,
      :SDL_imageFilterMultByByte,
      :SDL_imageFilterShiftRightAndMultByByte,
      :SDL_imageFilterShiftLeftByte,
      :SDL_imageFilterShiftLeftUint,
      :SDL_imageFilterShiftLeft,
      :SDL_imageFilterBinarizeUsingThreshold,
      :SDL_imageFilterClipToRange,
      :SDL_imageFilterNormalizeLinear,
    ]
    gfx_imagefilter_args = {
      :SDL_imageFilterMMXdetect => [], 
      :SDL_imageFilterMMXoff => [], 
      :SDL_imageFilterMMXon => [], 
      :SDL_imageFilterAdd => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterMean => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterSub => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterAbsDiff => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterMult => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterMultNor => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterMultDivby2 => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterMultDivby4 => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterBitAnd => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterBitOr => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterDiv => [:pointer, :pointer, :pointer, :uint], 
      :SDL_imageFilterBitNegation => [:pointer, :pointer, :uint], 
      :SDL_imageFilterAddByte => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterAddUint => [:pointer, :pointer, :uint, :uint], 
      :SDL_imageFilterAddByteToHalf => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterSubByte => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterSubUint => [:pointer, :pointer, :uint, :uint], 
      :SDL_imageFilterShiftRight => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterShiftRightUint => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterMultByByte => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterShiftRightAndMultByByte => [:pointer, :pointer, :uint, :uchar, :uchar], 
      :SDL_imageFilterShiftLeftByte => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterShiftLeftUint => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterShiftLeft => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterBinarizeUsingThreshold => [:pointer, :pointer, :uint, :uchar], 
      :SDL_imageFilterClipToRange => [:pointer, :pointer, :uint, :uchar, :uchar], 
      :SDL_imageFilterNormalizeLinear => [:pointer, :pointer, :uint, :int, :int, :int, :int], 
    }
    gfx_imagefilter_retvals = {
      :SDL_imageFilterMMXdetect => :int,
      :SDL_imageFilterMMXoff => :void,
      :SDL_imageFilterMMXon => :void,
      :SDL_imageFilterAdd => :int,
      :SDL_imageFilterMean => :int,
      :SDL_imageFilterSub => :int,
      :SDL_imageFilterAbsDiff => :int,
      :SDL_imageFilterMult => :int,
      :SDL_imageFilterMultNor => :int,
      :SDL_imageFilterMultDivby2 => :int,
      :SDL_imageFilterMultDivby4 => :int,
      :SDL_imageFilterBitAnd => :int,
      :SDL_imageFilterBitOr => :int,
      :SDL_imageFilterDiv => :int,
      :SDL_imageFilterBitNegation => :int,
      :SDL_imageFilterAddByte => :int,
      :SDL_imageFilterAddUint => :int,
      :SDL_imageFilterAddByteToHalf => :int,
      :SDL_imageFilterSubByte => :int,
      :SDL_imageFilterSubUint => :int,
      :SDL_imageFilterShiftRight => :int,
      :SDL_imageFilterShiftRightUint => :int,
      :SDL_imageFilterMultByByte => :int,
      :SDL_imageFilterShiftRightAndMultByByte => :int,
      :SDL_imageFilterShiftLeftByte => :int,
      :SDL_imageFilterShiftLeftUint => :int,
      :SDL_imageFilterShiftLeft => :int,
      :SDL_imageFilterBinarizeUsingThreshold => :int,
      :SDL_imageFilterClipToRange => :int,
      :SDL_imageFilterNormalizeLinear => :int,
    }
    gfx_imagefilter_symbols.each do |sym|
      begin
        attach_function sym, gfx_imagefilter_args[sym], gfx_imagefilter_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

