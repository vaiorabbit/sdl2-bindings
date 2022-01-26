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


  def self.PointInRect(p, r)
    return ( (p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) ? 1 : 0;
  end

  def self.RectEmpty(r)
    return (!r.null? || (r.w <= 0) || (r.h <= 0)) ? 1 : 0
  end

  def self.RectEquals(a, b)
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
      :SDL_HasIntersection,
      :SDL_IntersectRect,
      :SDL_UnionRect,
      :SDL_EnclosePoints,
      :SDL_IntersectRectAndLine,
    ]
    apis = {
      :SDL_HasIntersection => :HasIntersection,
      :SDL_IntersectRect => :IntersectRect,
      :SDL_UnionRect => :UnionRect,
      :SDL_EnclosePoints => :EnclosePoints,
      :SDL_IntersectRectAndLine => :IntersectRectAndLine,
    }
    args = {
      :SDL_HasIntersection => [:pointer, :pointer],
      :SDL_IntersectRect => [:pointer, :pointer, :pointer],
      :SDL_UnionRect => [:pointer, :pointer, :pointer],
      :SDL_EnclosePoints => [:pointer, :int, :pointer, :pointer],
      :SDL_IntersectRectAndLine => [:pointer, :pointer, :pointer, :pointer, :pointer],
    }
    retvals = {
      :SDL_HasIntersection => :int,
      :SDL_IntersectRect => :int,
      :SDL_UnionRect => :void,
      :SDL_EnclosePoints => :int,
      :SDL_IntersectRectAndLine => :int,
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

