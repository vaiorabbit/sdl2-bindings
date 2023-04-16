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


  # Typedef


  def self.PointInRectFloat(p, r)
    return ( (p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) ? 1 : 0;
  end

  def self.RectEmpty(r)
    return (!r.null? || (r.w <= 0) || (r.h <= 0)) ? 1 : 0
  end

  def self.RectsEqual(a, b)
    return (!a.null? && !b.null? && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) ? 1 : 0
  end


  # Struct

  class Point < FFI::Struct
    layout(
      :x, :int,
      :y, :int,
    )
  end

  class FPoint < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
    )
  end

  class Rect < FFI::Struct
    layout(
      :x, :int,
      :y, :int,
      :w, :int,
      :h, :int,
    )
  end

  class FRect < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :w, :float,
      :h, :float,
    )
  end


  # Function

  def self.setup_rect_symbols(output_error = false)
    symbols = [
      :SDL_HasRectIntersection,
      :SDL_GetRectIntersection,
      :SDL_GetRectUnion,
      :SDL_GetRectEnclosingPoints,
      :SDL_GetRectAndLineIntersection,
      :SDL_HasRectIntersectionFloat,
      :SDL_GetRectIntersectionFloat,
      :SDL_GetRectUnionFloat,
      :SDL_GetRectEnclosingPointsFloat,
      :SDL_GetRectAndLineIntersectionFloat,
    ]
    apis = {
      :SDL_HasRectIntersection => :HasRectIntersection,
      :SDL_GetRectIntersection => :GetRectIntersection,
      :SDL_GetRectUnion => :GetRectUnion,
      :SDL_GetRectEnclosingPoints => :GetRectEnclosingPoints,
      :SDL_GetRectAndLineIntersection => :GetRectAndLineIntersection,
      :SDL_HasRectIntersectionFloat => :HasRectIntersectionFloat,
      :SDL_GetRectIntersectionFloat => :GetRectIntersectionFloat,
      :SDL_GetRectUnionFloat => :GetRectUnionFloat,
      :SDL_GetRectEnclosingPointsFloat => :GetRectEnclosingPointsFloat,
      :SDL_GetRectAndLineIntersectionFloat => :GetRectAndLineIntersectionFloat,
    }
    args = {
      :SDL_HasRectIntersection => [:pointer, :pointer],
      :SDL_GetRectIntersection => [:pointer, :pointer, :pointer],
      :SDL_GetRectUnion => [:pointer, :pointer, :pointer],
      :SDL_GetRectEnclosingPoints => [:pointer, :int, :pointer, :pointer],
      :SDL_GetRectAndLineIntersection => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_HasRectIntersectionFloat => [:pointer, :pointer],
      :SDL_GetRectIntersectionFloat => [:pointer, :pointer, :pointer],
      :SDL_GetRectUnionFloat => [:pointer, :pointer, :pointer],
      :SDL_GetRectEnclosingPointsFloat => [:pointer, :int, :pointer, :pointer],
      :SDL_GetRectAndLineIntersectionFloat => [:pointer, :pointer, :pointer, :pointer, :pointer],
    }
    retvals = {
      :SDL_HasRectIntersection => :int,
      :SDL_GetRectIntersection => :int,
      :SDL_GetRectUnion => :int,
      :SDL_GetRectEnclosingPoints => :int,
      :SDL_GetRectAndLineIntersection => :int,
      :SDL_HasRectIntersectionFloat => :int,
      :SDL_GetRectIntersectionFloat => :int,
      :SDL_GetRectUnionFloat => :int,
      :SDL_GetRectEnclosingPointsFloat => :int,
      :SDL_GetRectAndLineIntersectionFloat => :int,
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

