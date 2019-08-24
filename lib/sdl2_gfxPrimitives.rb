# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL2_GFXPRIMITIVES_MAJOR = 1
  SDL2_GFXPRIMITIVES_MINOR = 0
  SDL2_GFXPRIMITIVES_MICRO = 4

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_gfx_primitives_symbols()
      attach_function :pixelColor, [:pointer, :short, :short, :uint], :int
      attach_function :pixelRGBA, [:pointer, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :hlineColor, [:pointer, :short, :short, :short, :uint], :int
      attach_function :hlineRGBA, [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :vlineColor, [:pointer, :short, :short, :short, :uint], :int
      attach_function :vlineRGBA, [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :rectangleColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :rectangleRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :roundedRectangleColor, [:pointer, :short, :short, :short, :short, :short, :uint], :int
      attach_function :roundedRectangleRGBA, [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :boxColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :boxRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :roundedBoxColor, [:pointer, :short, :short, :short, :short, :short, :uint], :int
      attach_function :roundedBoxRGBA, [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :lineColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :lineRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :aalineColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :aalineRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :thickLineColor, [:pointer, :short, :short, :short, :short, :uchar, :uint], :int
      attach_function :thickLineRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :circleColor, [:pointer, :short, :short, :short, :uint], :int
      attach_function :circleRGBA, [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :arcColor, [:pointer, :short, :short, :short, :short, :short, :uint], :int
      attach_function :arcRGBA, [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :aacircleColor, [:pointer, :short, :short, :short, :uint], :int
      attach_function :aacircleRGBA, [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :filledCircleColor, [:pointer, :short, :short, :short, :uint], :int
      attach_function :filledCircleRGBA, [:pointer, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :ellipseColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :ellipseRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :aaellipseColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :aaellipseRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :filledEllipseColor, [:pointer, :short, :short, :short, :short, :uint], :int
      attach_function :filledEllipseRGBA, [:pointer, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :pieColor, [:pointer, :short, :short, :short, :short, :short, :uint], :int
      attach_function :pieRGBA, [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :filledPieColor, [:pointer, :short, :short, :short, :short, :short, :uint], :int
      attach_function :filledPieRGBA, [:pointer, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :trigonColor, [:pointer, :short, :short, :short, :short, :short, :short, :uint], :int
      attach_function :trigonRGBA, [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :aatrigonColor, [:pointer, :short, :short, :short, :short, :short, :short, :uint], :int
      attach_function :aatrigonRGBA, [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :filledTrigonColor, [:pointer, :short, :short, :short, :short, :short, :short, :uint], :int
      attach_function :filledTrigonRGBA, [:pointer, :short, :short, :short, :short, :short, :short, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :polygonColor, [:pointer, :pointer, :pointer, :int, :uint], :int
      attach_function :polygonRGBA, [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :aapolygonColor, [:pointer, :pointer, :pointer, :int, :uint], :int
      attach_function :aapolygonRGBA, [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :filledPolygonColor, [:pointer, :pointer, :pointer, :int, :uint], :int
      attach_function :filledPolygonRGBA, [:pointer, :pointer, :pointer, :int, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :texturedPolygon, [:pointer, :pointer, :pointer, :int, :pointer, :int, :int], :int
      attach_function :bezierColor, [:pointer, :pointer, :pointer, :int, :int, :uint], :int
      attach_function :bezierRGBA, [:pointer, :pointer, :pointer, :int, :int, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :gfxPrimitivesSetFont, [:pointer, :uint, :uint], :void
      attach_function :gfxPrimitivesSetFontRotation, [:uint], :void
      attach_function :characterColor, [:pointer, :short, :short, :char, :uint], :int
      attach_function :characterRGBA, [:pointer, :short, :short, :char, :uchar, :uchar, :uchar, :uchar], :int
      attach_function :stringColor, [:pointer, :short, :short, :pointer, :uint], :int
      attach_function :stringRGBA, [:pointer, :short, :short, :pointer, :uchar, :uchar, :uchar, :uchar], :int
  end

end

