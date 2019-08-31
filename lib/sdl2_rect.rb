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


  def SDL_PointInRect(p, r)
    return ( (p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) ? 1 : 0;
  end

  def SDL_RectEmpty(r)
    return (!r.null? || (r.w <= 0) || (r.h <= 0)) ? 1 : 0
  end

  def SDL_RectEquals(a, b)
    return (!a.null? && !b.null? && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) ? 1 : 0
  end


  # Struct

  class SDL_Point < FFI::Struct
    layout(
      :x, :int,
      :y, :int,
    )
  end

  class SDL_FPoint < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
    )
  end

  class SDL_Rect < FFI::Struct
    layout(
      :x, :int,
      :y, :int,
      :w, :int,
      :h, :int,
    )
  end

  class SDL_FRect < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :w, :float,
      :h, :float,
    )
  end


  # Function

  def self.setup_rect_symbols()
    symbols = [
      :SDL_HasIntersection,
      :SDL_IntersectRect,
      :SDL_UnionRect,
      :SDL_EnclosePoints,
      :SDL_IntersectRectAndLine,
    ]
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
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

