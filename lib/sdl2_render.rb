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

  RENDERER_SOFTWARE = 1
  RENDERER_ACCELERATED = 2
  RENDERER_PRESENTVSYNC = 4
  SCALEMODE_NEAREST = 0
  SCALEMODE_LINEAR = 1
  SCALEMODE_BEST = 2
  TEXTUREACCESS_STATIC = 0
  TEXTUREACCESS_STREAMING = 1
  TEXTUREACCESS_TARGET = 2
  TEXTUREMODULATE_NONE = 0
  TEXTUREMODULATE_COLOR = 1
  TEXTUREMODULATE_ALPHA = 2
  FLIP_NONE = 0
  FLIP_HORIZONTAL = 1
  FLIP_VERTICAL = 2
  LOGICAL_PRESENTATION_DISABLED = 0
  LOGICAL_PRESENTATION_STRETCH = 1
  LOGICAL_PRESENTATION_LETTERBOX = 2
  LOGICAL_PRESENTATION_OVERSCAN = 3
  LOGICAL_PRESENTATION_INTEGER_SCALE = 4

  # Typedef

  typedef :int, :SDL_RendererFlags
  typedef :int, :SDL_ScaleMode
  typedef :int, :SDL_TextureAccess
  typedef :int, :SDL_TextureModulate
  typedef :int, :SDL_RendererFlip
  typedef :int, :SDL_RendererLogicalPresentation

  # Struct

  class RendererInfo < FFI::Struct
    layout(
      :name, :pointer,
      :flags, :uint,
      :num_texture_formats, :uint,
      :texture_formats, [:uint, 16],
      :max_texture_width, :int,
      :max_texture_height, :int,
    )
  end

  class Vertex < FFI::Struct
    layout(
      :position, FPoint,
      :color, Color,
      :tex_coord, FPoint,
    )
  end


  # Function

  def self.setup_render_symbols(output_error = false)
    symbols = [
      :SDL_GetNumRenderDrivers,
      :SDL_GetRenderDriver,
      :SDL_CreateWindowAndRenderer,
      :SDL_CreateRenderer,
      :SDL_CreateSoftwareRenderer,
      :SDL_GetRenderer,
      :SDL_GetRenderWindow,
      :SDL_GetRendererInfo,
      :SDL_GetRenderOutputSize,
      :SDL_GetCurrentRenderOutputSize,
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
      :SDL_SetTextureUserData,
      :SDL_GetTextureUserData,
      :SDL_UpdateTexture,
      :SDL_UpdateYUVTexture,
      :SDL_UpdateNVTexture,
      :SDL_LockTexture,
      :SDL_LockTextureToSurface,
      :SDL_UnlockTexture,
      :SDL_SetRenderTarget,
      :SDL_GetRenderTarget,
      :SDL_SetRenderLogicalPresentation,
      :SDL_GetRenderLogicalPresentation,
      :SDL_RenderCoordinatesFromWindow,
      :SDL_RenderCoordinatesToWindow,
      :SDL_ConvertEventToRenderCoordinates,
      :SDL_SetRenderViewport,
      :SDL_GetRenderViewport,
      :SDL_SetRenderClipRect,
      :SDL_GetRenderClipRect,
      :SDL_RenderClipEnabled,
      :SDL_SetRenderScale,
      :SDL_GetRenderScale,
      :SDL_SetRenderDrawColor,
      :SDL_GetRenderDrawColor,
      :SDL_SetRenderDrawBlendMode,
      :SDL_GetRenderDrawBlendMode,
      :SDL_RenderClear,
      :SDL_RenderPoint,
      :SDL_RenderPoints,
      :SDL_RenderLine,
      :SDL_RenderLines,
      :SDL_RenderRect,
      :SDL_RenderRects,
      :SDL_RenderFillRect,
      :SDL_RenderFillRects,
      :SDL_RenderTexture,
      :SDL_RenderTextureRotated,
      :SDL_RenderGeometry,
      :SDL_RenderGeometryRaw,
      :SDL_RenderReadPixels,
      :SDL_RenderPresent,
      :SDL_DestroyTexture,
      :SDL_DestroyRenderer,
      :SDL_RenderFlush,
      :SDL_GL_BindTexture,
      :SDL_GL_UnbindTexture,
      :SDL_GetRenderMetalLayer,
      :SDL_GetRenderMetalCommandEncoder,
      :SDL_SetRenderVSync,
      :SDL_GetRenderVSync,
    ]
    apis = {
      :SDL_GetNumRenderDrivers => :GetNumRenderDrivers,
      :SDL_GetRenderDriver => :GetRenderDriver,
      :SDL_CreateWindowAndRenderer => :CreateWindowAndRenderer,
      :SDL_CreateRenderer => :CreateRenderer,
      :SDL_CreateSoftwareRenderer => :CreateSoftwareRenderer,
      :SDL_GetRenderer => :GetRenderer,
      :SDL_GetRenderWindow => :GetRenderWindow,
      :SDL_GetRendererInfo => :GetRendererInfo,
      :SDL_GetRenderOutputSize => :GetRenderOutputSize,
      :SDL_GetCurrentRenderOutputSize => :GetCurrentRenderOutputSize,
      :SDL_CreateTexture => :CreateTexture,
      :SDL_CreateTextureFromSurface => :CreateTextureFromSurface,
      :SDL_QueryTexture => :QueryTexture,
      :SDL_SetTextureColorMod => :SetTextureColorMod,
      :SDL_GetTextureColorMod => :GetTextureColorMod,
      :SDL_SetTextureAlphaMod => :SetTextureAlphaMod,
      :SDL_GetTextureAlphaMod => :GetTextureAlphaMod,
      :SDL_SetTextureBlendMode => :SetTextureBlendMode,
      :SDL_GetTextureBlendMode => :GetTextureBlendMode,
      :SDL_SetTextureScaleMode => :SetTextureScaleMode,
      :SDL_GetTextureScaleMode => :GetTextureScaleMode,
      :SDL_SetTextureUserData => :SetTextureUserData,
      :SDL_GetTextureUserData => :GetTextureUserData,
      :SDL_UpdateTexture => :UpdateTexture,
      :SDL_UpdateYUVTexture => :UpdateYUVTexture,
      :SDL_UpdateNVTexture => :UpdateNVTexture,
      :SDL_LockTexture => :LockTexture,
      :SDL_LockTextureToSurface => :LockTextureToSurface,
      :SDL_UnlockTexture => :UnlockTexture,
      :SDL_SetRenderTarget => :SetRenderTarget,
      :SDL_GetRenderTarget => :GetRenderTarget,
      :SDL_SetRenderLogicalPresentation => :SetRenderLogicalPresentation,
      :SDL_GetRenderLogicalPresentation => :GetRenderLogicalPresentation,
      :SDL_RenderCoordinatesFromWindow => :RenderCoordinatesFromWindow,
      :SDL_RenderCoordinatesToWindow => :RenderCoordinatesToWindow,
      :SDL_ConvertEventToRenderCoordinates => :ConvertEventToRenderCoordinates,
      :SDL_SetRenderViewport => :SetRenderViewport,
      :SDL_GetRenderViewport => :GetRenderViewport,
      :SDL_SetRenderClipRect => :SetRenderClipRect,
      :SDL_GetRenderClipRect => :GetRenderClipRect,
      :SDL_RenderClipEnabled => :RenderClipEnabled,
      :SDL_SetRenderScale => :SetRenderScale,
      :SDL_GetRenderScale => :GetRenderScale,
      :SDL_SetRenderDrawColor => :SetRenderDrawColor,
      :SDL_GetRenderDrawColor => :GetRenderDrawColor,
      :SDL_SetRenderDrawBlendMode => :SetRenderDrawBlendMode,
      :SDL_GetRenderDrawBlendMode => :GetRenderDrawBlendMode,
      :SDL_RenderClear => :RenderClear,
      :SDL_RenderPoint => :RenderPoint,
      :SDL_RenderPoints => :RenderPoints,
      :SDL_RenderLine => :RenderLine,
      :SDL_RenderLines => :RenderLines,
      :SDL_RenderRect => :RenderRect,
      :SDL_RenderRects => :RenderRects,
      :SDL_RenderFillRect => :RenderFillRect,
      :SDL_RenderFillRects => :RenderFillRects,
      :SDL_RenderTexture => :RenderTexture,
      :SDL_RenderTextureRotated => :RenderTextureRotated,
      :SDL_RenderGeometry => :RenderGeometry,
      :SDL_RenderGeometryRaw => :RenderGeometryRaw,
      :SDL_RenderReadPixels => :RenderReadPixels,
      :SDL_RenderPresent => :RenderPresent,
      :SDL_DestroyTexture => :DestroyTexture,
      :SDL_DestroyRenderer => :DestroyRenderer,
      :SDL_RenderFlush => :RenderFlush,
      :SDL_GL_BindTexture => :GL_BindTexture,
      :SDL_GL_UnbindTexture => :GL_UnbindTexture,
      :SDL_GetRenderMetalLayer => :GetRenderMetalLayer,
      :SDL_GetRenderMetalCommandEncoder => :GetRenderMetalCommandEncoder,
      :SDL_SetRenderVSync => :SetRenderVSync,
      :SDL_GetRenderVSync => :GetRenderVSync,
    }
    args = {
      :SDL_GetNumRenderDrivers => [],
      :SDL_GetRenderDriver => [:int],
      :SDL_CreateWindowAndRenderer => [:int, :int, :uint, :pointer, :pointer],
      :SDL_CreateRenderer => [:pointer, :pointer, :uint],
      :SDL_CreateSoftwareRenderer => [:pointer],
      :SDL_GetRenderer => [:pointer],
      :SDL_GetRenderWindow => [:pointer],
      :SDL_GetRendererInfo => [:pointer, :pointer],
      :SDL_GetRenderOutputSize => [:pointer, :pointer, :pointer],
      :SDL_GetCurrentRenderOutputSize => [:pointer, :pointer, :pointer],
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
      :SDL_SetTextureUserData => [:pointer, :pointer],
      :SDL_GetTextureUserData => [:pointer],
      :SDL_UpdateTexture => [:pointer, :pointer, :pointer, :int],
      :SDL_UpdateYUVTexture => [:pointer, :pointer, :pointer, :int, :pointer, :int, :pointer, :int],
      :SDL_UpdateNVTexture => [:pointer, :pointer, :pointer, :int, :pointer, :int],
      :SDL_LockTexture => [:pointer, :pointer, :pointer, :pointer],
      :SDL_LockTextureToSurface => [:pointer, :pointer, :pointer],
      :SDL_UnlockTexture => [:pointer],
      :SDL_SetRenderTarget => [:pointer, :pointer],
      :SDL_GetRenderTarget => [:pointer],
      :SDL_SetRenderLogicalPresentation => [:pointer, :int, :int, :int, :int],
      :SDL_GetRenderLogicalPresentation => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_RenderCoordinatesFromWindow => [:pointer, :float, :float, :pointer, :pointer],
      :SDL_RenderCoordinatesToWindow => [:pointer, :float, :float, :pointer, :pointer],
      :SDL_ConvertEventToRenderCoordinates => [:pointer, :pointer],
      :SDL_SetRenderViewport => [:pointer, :pointer],
      :SDL_GetRenderViewport => [:pointer, :pointer],
      :SDL_SetRenderClipRect => [:pointer, :pointer],
      :SDL_GetRenderClipRect => [:pointer, :pointer],
      :SDL_RenderClipEnabled => [:pointer],
      :SDL_SetRenderScale => [:pointer, :float, :float],
      :SDL_GetRenderScale => [:pointer, :pointer, :pointer],
      :SDL_SetRenderDrawColor => [:pointer, :uchar, :uchar, :uchar, :uchar],
      :SDL_GetRenderDrawColor => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_SetRenderDrawBlendMode => [:pointer, :int],
      :SDL_GetRenderDrawBlendMode => [:pointer, :pointer],
      :SDL_RenderClear => [:pointer],
      :SDL_RenderPoint => [:pointer, :float, :float],
      :SDL_RenderPoints => [:pointer, :pointer, :int],
      :SDL_RenderLine => [:pointer, :float, :float, :float, :float],
      :SDL_RenderLines => [:pointer, :pointer, :int],
      :SDL_RenderRect => [:pointer, :pointer],
      :SDL_RenderRects => [:pointer, :pointer, :int],
      :SDL_RenderFillRect => [:pointer, :pointer],
      :SDL_RenderFillRects => [:pointer, :pointer, :int],
      :SDL_RenderTexture => [:pointer, :pointer, :pointer, :pointer],
      :SDL_RenderTextureRotated => [:pointer, :pointer, :pointer, :pointer, :double, :pointer, :int],
      :SDL_RenderGeometry => [:pointer, :pointer, :pointer, :int, :pointer, :int],
      :SDL_RenderGeometryRaw => [:pointer, :pointer, :pointer, :int, :pointer, :int, :pointer, :int, :int, :pointer, :int, :int],
      :SDL_RenderReadPixels => [:pointer, :pointer, :uint, :pointer, :int],
      :SDL_RenderPresent => [:pointer],
      :SDL_DestroyTexture => [:pointer],
      :SDL_DestroyRenderer => [:pointer],
      :SDL_RenderFlush => [:pointer],
      :SDL_GL_BindTexture => [:pointer, :pointer, :pointer],
      :SDL_GL_UnbindTexture => [:pointer],
      :SDL_GetRenderMetalLayer => [:pointer],
      :SDL_GetRenderMetalCommandEncoder => [:pointer],
      :SDL_SetRenderVSync => [:pointer, :int],
      :SDL_GetRenderVSync => [:pointer, :pointer],
    }
    retvals = {
      :SDL_GetNumRenderDrivers => :int,
      :SDL_GetRenderDriver => :pointer,
      :SDL_CreateWindowAndRenderer => :int,
      :SDL_CreateRenderer => :pointer,
      :SDL_CreateSoftwareRenderer => :pointer,
      :SDL_GetRenderer => :pointer,
      :SDL_GetRenderWindow => :pointer,
      :SDL_GetRendererInfo => :int,
      :SDL_GetRenderOutputSize => :int,
      :SDL_GetCurrentRenderOutputSize => :int,
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
      :SDL_SetTextureUserData => :int,
      :SDL_GetTextureUserData => :pointer,
      :SDL_UpdateTexture => :int,
      :SDL_UpdateYUVTexture => :int,
      :SDL_UpdateNVTexture => :int,
      :SDL_LockTexture => :int,
      :SDL_LockTextureToSurface => :int,
      :SDL_UnlockTexture => :void,
      :SDL_SetRenderTarget => :int,
      :SDL_GetRenderTarget => :pointer,
      :SDL_SetRenderLogicalPresentation => :int,
      :SDL_GetRenderLogicalPresentation => :int,
      :SDL_RenderCoordinatesFromWindow => :int,
      :SDL_RenderCoordinatesToWindow => :int,
      :SDL_ConvertEventToRenderCoordinates => :int,
      :SDL_SetRenderViewport => :int,
      :SDL_GetRenderViewport => :int,
      :SDL_SetRenderClipRect => :int,
      :SDL_GetRenderClipRect => :int,
      :SDL_RenderClipEnabled => :int,
      :SDL_SetRenderScale => :int,
      :SDL_GetRenderScale => :int,
      :SDL_SetRenderDrawColor => :int,
      :SDL_GetRenderDrawColor => :int,
      :SDL_SetRenderDrawBlendMode => :int,
      :SDL_GetRenderDrawBlendMode => :int,
      :SDL_RenderClear => :int,
      :SDL_RenderPoint => :int,
      :SDL_RenderPoints => :int,
      :SDL_RenderLine => :int,
      :SDL_RenderLines => :int,
      :SDL_RenderRect => :int,
      :SDL_RenderRects => :int,
      :SDL_RenderFillRect => :int,
      :SDL_RenderFillRects => :int,
      :SDL_RenderTexture => :int,
      :SDL_RenderTextureRotated => :int,
      :SDL_RenderGeometry => :int,
      :SDL_RenderGeometryRaw => :int,
      :SDL_RenderReadPixels => :int,
      :SDL_RenderPresent => :int,
      :SDL_DestroyTexture => :void,
      :SDL_DestroyRenderer => :void,
      :SDL_RenderFlush => :int,
      :SDL_GL_BindTexture => :int,
      :SDL_GL_UnbindTexture => :int,
      :SDL_GetRenderMetalLayer => :pointer,
      :SDL_GetRenderMetalCommandEncoder => :pointer,
      :SDL_SetRenderVSync => :int,
      :SDL_GetRenderVSync => :int,
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

