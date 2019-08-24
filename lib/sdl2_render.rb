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
      attach_function :SDL_GetNumRenderDrivers, [], :int
      attach_function :SDL_GetRenderDriverInfo, [:int, :pointer], :int
      attach_function :SDL_CreateWindowAndRenderer, [:int, :int, :uint, :pointer, :pointer], :int
      attach_function :SDL_CreateRenderer, [:pointer, :int, :uint], :pointer
      attach_function :SDL_CreateSoftwareRenderer, [:pointer], :pointer
      attach_function :SDL_GetRenderer, [:pointer], :pointer
      attach_function :SDL_GetRendererInfo, [:pointer, :pointer], :int
      attach_function :SDL_GetRendererOutputSize, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_CreateTexture, [:pointer, :uint, :int, :int, :int], :pointer
      attach_function :SDL_CreateTextureFromSurface, [:pointer, :pointer], :pointer
      attach_function :SDL_QueryTexture, [:pointer, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetTextureColorMod, [:pointer, :uchar, :uchar, :uchar], :int
      attach_function :SDL_GetTextureColorMod, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetTextureAlphaMod, [:pointer, :uchar], :int
      attach_function :SDL_GetTextureAlphaMod, [:pointer, :pointer], :int
      attach_function :SDL_SetTextureBlendMode, [:pointer, :int], :int
      attach_function :SDL_GetTextureBlendMode, [:pointer, :pointer], :int
      attach_function :SDL_UpdateTexture, [:pointer, :pointer, :pointer, :int], :int
      attach_function :SDL_UpdateYUVTexture, [:pointer, :pointer, :pointer, :int, :pointer, :int, :pointer, :int], :int
      attach_function :SDL_LockTexture, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_UnlockTexture, [:pointer], :void
      attach_function :SDL_RenderTargetSupported, [:pointer], :int
      attach_function :SDL_SetRenderTarget, [:pointer, :pointer], :int
      attach_function :SDL_GetRenderTarget, [:pointer], :pointer
      attach_function :SDL_RenderSetLogicalSize, [:pointer, :int, :int], :int
      attach_function :SDL_RenderGetLogicalSize, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_RenderSetIntegerScale, [:pointer, :int], :int
      attach_function :SDL_RenderGetIntegerScale, [:pointer], :int
      attach_function :SDL_RenderSetViewport, [:pointer, :pointer], :int
      attach_function :SDL_RenderGetViewport, [:pointer, :pointer], :void
      attach_function :SDL_RenderSetClipRect, [:pointer, :pointer], :int
      attach_function :SDL_RenderGetClipRect, [:pointer, :pointer], :void
      attach_function :SDL_RenderIsClipEnabled, [:pointer], :int
      attach_function :SDL_RenderSetScale, [:pointer, :float, :float], :int
      attach_function :SDL_RenderGetScale, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_SetRenderDrawColor, [:pointer, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :SDL_GetRenderDrawColor, [:pointer, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetRenderDrawBlendMode, [:pointer, :int], :int
      attach_function :SDL_GetRenderDrawBlendMode, [:pointer, :pointer], :int
      attach_function :SDL_RenderClear, [:pointer], :int
      attach_function :SDL_RenderDrawPoint, [:pointer, :int, :int], :int
      attach_function :SDL_RenderDrawPoints, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderDrawLine, [:pointer, :int, :int, :int, :int], :int
      attach_function :SDL_RenderDrawLines, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderDrawRect, [:pointer, :pointer], :int
      attach_function :SDL_RenderDrawRects, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderFillRect, [:pointer, :pointer], :int
      attach_function :SDL_RenderFillRects, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderCopy, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_RenderCopyEx, [:pointer, :pointer, :pointer, :pointer, :double, :pointer, :int], :int
      attach_function :SDL_RenderDrawPointF, [:pointer, :float, :float], :int
      attach_function :SDL_RenderDrawPointsF, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderDrawLineF, [:pointer, :float, :float, :float, :float], :int
      attach_function :SDL_RenderDrawLinesF, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderDrawRectF, [:pointer, :pointer], :int
      attach_function :SDL_RenderDrawRectsF, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderFillRectF, [:pointer, :pointer], :int
      attach_function :SDL_RenderFillRectsF, [:pointer, :pointer, :int], :int
      attach_function :SDL_RenderCopyF, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_RenderCopyExF, [:pointer, :pointer, :pointer, :pointer, :double, :pointer, :int], :int
      attach_function :SDL_RenderReadPixels, [:pointer, :pointer, :uint, :pointer, :int], :int
      attach_function :SDL_RenderPresent, [:pointer], :void
      attach_function :SDL_DestroyTexture, [:pointer], :void
      attach_function :SDL_DestroyRenderer, [:pointer], :void
      attach_function :SDL_RenderFlush, [:pointer], :int
      attach_function :SDL_GL_BindTexture, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_GL_UnbindTexture, [:pointer], :int
      attach_function :SDL_RenderGetMetalLayer, [:pointer], :pointer
      attach_function :SDL_RenderGetMetalCommandEncoder, [:pointer], :pointer
  end

end

