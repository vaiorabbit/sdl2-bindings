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

  SDL_RENDERER_SOFTWARE = 1
  SDL_RENDERER_ACCELERATED = 2
  SDL_RENDERER_PRESENTVSYNC = 4
  SDL_RENDERER_TARGETTEXTURE = 8
  SDL_ScaleModeNearest = 0
  SDL_ScaleModeLinear = 1
  SDL_ScaleModeBest = 2
  SDL_TEXTUREACCESS_STATIC = 0
  SDL_TEXTUREACCESS_STREAMING = 1
  SDL_TEXTUREACCESS_TARGET = 2
  SDL_TEXTUREMODULATE_NONE = 0
  SDL_TEXTUREMODULATE_COLOR = 1
  SDL_TEXTUREMODULATE_ALPHA = 2
  SDL_FLIP_NONE = 0
  SDL_FLIP_HORIZONTAL = 1
  SDL_FLIP_VERTICAL = 2

  # Typedef

  typedef :int, :SDL_RendererFlags
  typedef :int, :SDL_ScaleMode
  typedef :int, :SDL_TextureAccess
  typedef :int, :SDL_TextureModulate
  typedef :int, :SDL_RendererFlip

  # Struct

  class SDL_RendererInfo < FFI::Struct
    layout(
      :name, :pointer,
      :flags, :uint,
      :num_texture_formats, :uint,
      :texture_formats, [:uint, 16],
      :max_texture_width, :int,
      :max_texture_height, :int,
    )
  end


  # Function

  def self.setup_render_symbols()
    symbols = [
      :SDL_GetNumRenderDrivers,
      :SDL_GetRenderDriverInfo,
      :SDL_CreateWindowAndRenderer,
      :SDL_CreateRenderer,
      :SDL_CreateSoftwareRenderer,
      :SDL_GetRenderer,
      :SDL_GetRendererInfo,
      :SDL_GetRendererOutputSize,
      :SDL_CreateTexture,
      :SDL_CreateTextureFromSurface,
      :SDL_QueryTexture,
      :SDL_SetTextureColorMod,
      :SDL_GetTextureColorMod,
      :SDL_SetTextureAlphaMod,
      :SDL_GetTextureAlphaMod,
      :SDL_SetTextureBlendMode,
      :SDL_GetTextureBlendMode,
      :SDL_SetTextureScaleMode,
      :SDL_GetTextureScaleMode,
      :SDL_UpdateTexture,
      :SDL_UpdateYUVTexture,
      :SDL_LockTexture,
      :SDL_LockTextureToSurface,
      :SDL_UnlockTexture,
      :SDL_RenderTargetSupported,
      :SDL_SetRenderTarget,
      :SDL_GetRenderTarget,
      :SDL_RenderSetLogicalSize,
      :SDL_RenderGetLogicalSize,
      :SDL_RenderSetIntegerScale,
      :SDL_RenderGetIntegerScale,
      :SDL_RenderSetViewport,
      :SDL_RenderGetViewport,
      :SDL_RenderSetClipRect,
      :SDL_RenderGetClipRect,
      :SDL_RenderIsClipEnabled,
      :SDL_RenderSetScale,
      :SDL_RenderGetScale,
      :SDL_SetRenderDrawColor,
      :SDL_GetRenderDrawColor,
      :SDL_SetRenderDrawBlendMode,
      :SDL_GetRenderDrawBlendMode,
      :SDL_RenderClear,
      :SDL_RenderDrawPoint,
      :SDL_RenderDrawPoints,
      :SDL_RenderDrawLine,
      :SDL_RenderDrawLines,
      :SDL_RenderDrawRect,
      :SDL_RenderDrawRects,
      :SDL_RenderFillRect,
      :SDL_RenderFillRects,
      :SDL_RenderCopy,
      :SDL_RenderCopyEx,
      :SDL_RenderDrawPointF,
      :SDL_RenderDrawPointsF,
      :SDL_RenderDrawLineF,
      :SDL_RenderDrawLinesF,
      :SDL_RenderDrawRectF,
      :SDL_RenderDrawRectsF,
      :SDL_RenderFillRectF,
      :SDL_RenderFillRectsF,
      :SDL_RenderCopyF,
      :SDL_RenderCopyExF,
      :SDL_RenderReadPixels,
      :SDL_RenderPresent,
      :SDL_DestroyTexture,
      :SDL_DestroyRenderer,
      :SDL_RenderFlush,
      :SDL_GL_BindTexture,
      :SDL_GL_UnbindTexture,
      :SDL_RenderGetMetalLayer,
      :SDL_RenderGetMetalCommandEncoder,
    ]
    args = {
      :SDL_GetNumRenderDrivers => [],
      :SDL_GetRenderDriverInfo => [:int, :pointer],
      :SDL_CreateWindowAndRenderer => [:int, :int, :uint, :pointer, :pointer],
      :SDL_CreateRenderer => [:pointer, :int, :uint],
      :SDL_CreateSoftwareRenderer => [:pointer],
      :SDL_GetRenderer => [:pointer],
      :SDL_GetRendererInfo => [:pointer, :pointer],
      :SDL_GetRendererOutputSize => [:pointer, :pointer, :pointer],
      :SDL_CreateTexture => [:pointer, :uint, :int, :int, :int],
      :SDL_CreateTextureFromSurface => [:pointer, :pointer],
      :SDL_QueryTexture => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_SetTextureColorMod => [:pointer, :uchar, :uchar, :uchar],
      :SDL_GetTextureColorMod => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetTextureAlphaMod => [:pointer, :uchar],
      :SDL_GetTextureAlphaMod => [:pointer, :pointer],
      :SDL_SetTextureBlendMode => [:pointer, :int],
      :SDL_GetTextureBlendMode => [:pointer, :pointer],
      :SDL_SetTextureScaleMode => [:pointer, :int],
      :SDL_GetTextureScaleMode => [:pointer, :pointer],
      :SDL_UpdateTexture => [:pointer, :pointer, :pointer, :int],
      :SDL_UpdateYUVTexture => [:pointer, :pointer, :pointer, :int, :pointer, :int, :pointer, :int],
      :SDL_LockTexture => [:pointer, :pointer, :pointer, :pointer],
      :SDL_LockTextureToSurface => [:pointer, :pointer, :pointer],
      :SDL_UnlockTexture => [:pointer],
      :SDL_RenderTargetSupported => [:pointer],
      :SDL_SetRenderTarget => [:pointer, :pointer],
      :SDL_GetRenderTarget => [:pointer],
      :SDL_RenderSetLogicalSize => [:pointer, :int, :int],
      :SDL_RenderGetLogicalSize => [:pointer, :pointer, :pointer],
      :SDL_RenderSetIntegerScale => [:pointer, :int],
      :SDL_RenderGetIntegerScale => [:pointer],
      :SDL_RenderSetViewport => [:pointer, :pointer],
      :SDL_RenderGetViewport => [:pointer, :pointer],
      :SDL_RenderSetClipRect => [:pointer, :pointer],
      :SDL_RenderGetClipRect => [:pointer, :pointer],
      :SDL_RenderIsClipEnabled => [:pointer],
      :SDL_RenderSetScale => [:pointer, :float, :float],
      :SDL_RenderGetScale => [:pointer, :pointer, :pointer],
      :SDL_SetRenderDrawColor => [:pointer, :uchar, :uchar, :uchar, :uchar],
      :SDL_GetRenderDrawColor => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_SetRenderDrawBlendMode => [:pointer, :int],
      :SDL_GetRenderDrawBlendMode => [:pointer, :pointer],
      :SDL_RenderClear => [:pointer],
      :SDL_RenderDrawPoint => [:pointer, :int, :int],
      :SDL_RenderDrawPoints => [:pointer, :pointer, :int],
      :SDL_RenderDrawLine => [:pointer, :int, :int, :int, :int],
      :SDL_RenderDrawLines => [:pointer, :pointer, :int],
      :SDL_RenderDrawRect => [:pointer, :pointer],
      :SDL_RenderDrawRects => [:pointer, :pointer, :int],
      :SDL_RenderFillRect => [:pointer, :pointer],
      :SDL_RenderFillRects => [:pointer, :pointer, :int],
      :SDL_RenderCopy => [:pointer, :pointer, :pointer, :pointer],
      :SDL_RenderCopyEx => [:pointer, :pointer, :pointer, :pointer, :double, :pointer, :int],
      :SDL_RenderDrawPointF => [:pointer, :float, :float],
      :SDL_RenderDrawPointsF => [:pointer, :pointer, :int],
      :SDL_RenderDrawLineF => [:pointer, :float, :float, :float, :float],
      :SDL_RenderDrawLinesF => [:pointer, :pointer, :int],
      :SDL_RenderDrawRectF => [:pointer, :pointer],
      :SDL_RenderDrawRectsF => [:pointer, :pointer, :int],
      :SDL_RenderFillRectF => [:pointer, :pointer],
      :SDL_RenderFillRectsF => [:pointer, :pointer, :int],
      :SDL_RenderCopyF => [:pointer, :pointer, :pointer, :pointer],
      :SDL_RenderCopyExF => [:pointer, :pointer, :pointer, :pointer, :double, :pointer, :int],
      :SDL_RenderReadPixels => [:pointer, :pointer, :uint, :pointer, :int],
      :SDL_RenderPresent => [:pointer],
      :SDL_DestroyTexture => [:pointer],
      :SDL_DestroyRenderer => [:pointer],
      :SDL_RenderFlush => [:pointer],
      :SDL_GL_BindTexture => [:pointer, :pointer, :pointer],
      :SDL_GL_UnbindTexture => [:pointer],
      :SDL_RenderGetMetalLayer => [:pointer],
      :SDL_RenderGetMetalCommandEncoder => [:pointer],
    }
    retvals = {
      :SDL_GetNumRenderDrivers => :int,
      :SDL_GetRenderDriverInfo => :int,
      :SDL_CreateWindowAndRenderer => :int,
      :SDL_CreateRenderer => :pointer,
      :SDL_CreateSoftwareRenderer => :pointer,
      :SDL_GetRenderer => :pointer,
      :SDL_GetRendererInfo => :int,
      :SDL_GetRendererOutputSize => :int,
      :SDL_CreateTexture => :pointer,
      :SDL_CreateTextureFromSurface => :pointer,
      :SDL_QueryTexture => :int,
      :SDL_SetTextureColorMod => :int,
      :SDL_GetTextureColorMod => :int,
      :SDL_SetTextureAlphaMod => :int,
      :SDL_GetTextureAlphaMod => :int,
      :SDL_SetTextureBlendMode => :int,
      :SDL_GetTextureBlendMode => :int,
      :SDL_SetTextureScaleMode => :int,
      :SDL_GetTextureScaleMode => :int,
      :SDL_UpdateTexture => :int,
      :SDL_UpdateYUVTexture => :int,
      :SDL_LockTexture => :int,
      :SDL_LockTextureToSurface => :int,
      :SDL_UnlockTexture => :void,
      :SDL_RenderTargetSupported => :int,
      :SDL_SetRenderTarget => :int,
      :SDL_GetRenderTarget => :pointer,
      :SDL_RenderSetLogicalSize => :int,
      :SDL_RenderGetLogicalSize => :void,
      :SDL_RenderSetIntegerScale => :int,
      :SDL_RenderGetIntegerScale => :int,
      :SDL_RenderSetViewport => :int,
      :SDL_RenderGetViewport => :void,
      :SDL_RenderSetClipRect => :int,
      :SDL_RenderGetClipRect => :void,
      :SDL_RenderIsClipEnabled => :int,
      :SDL_RenderSetScale => :int,
      :SDL_RenderGetScale => :void,
      :SDL_SetRenderDrawColor => :int,
      :SDL_GetRenderDrawColor => :int,
      :SDL_SetRenderDrawBlendMode => :int,
      :SDL_GetRenderDrawBlendMode => :int,
      :SDL_RenderClear => :int,
      :SDL_RenderDrawPoint => :int,
      :SDL_RenderDrawPoints => :int,
      :SDL_RenderDrawLine => :int,
      :SDL_RenderDrawLines => :int,
      :SDL_RenderDrawRect => :int,
      :SDL_RenderDrawRects => :int,
      :SDL_RenderFillRect => :int,
      :SDL_RenderFillRects => :int,
      :SDL_RenderCopy => :int,
      :SDL_RenderCopyEx => :int,
      :SDL_RenderDrawPointF => :int,
      :SDL_RenderDrawPointsF => :int,
      :SDL_RenderDrawLineF => :int,
      :SDL_RenderDrawLinesF => :int,
      :SDL_RenderDrawRectF => :int,
      :SDL_RenderDrawRectsF => :int,
      :SDL_RenderFillRectF => :int,
      :SDL_RenderFillRectsF => :int,
      :SDL_RenderCopyF => :int,
      :SDL_RenderCopyExF => :int,
      :SDL_RenderReadPixels => :int,
      :SDL_RenderPresent => :void,
      :SDL_DestroyTexture => :void,
      :SDL_DestroyRenderer => :void,
      :SDL_RenderFlush => :int,
      :SDL_GL_BindTexture => :int,
      :SDL_GL_UnbindTexture => :int,
      :SDL_RenderGetMetalLayer => :pointer,
      :SDL_RenderGetMetalCommandEncoder => :pointer,
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

