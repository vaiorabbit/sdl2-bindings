module SDL2

  extend Fiddle::Importer

  SDL_Point = struct(["int x",
                      "int y"])

  SDL_Rect = struct(["int x",
                     "int y",
                     "int w",
                     "int h"])

  def SDL_RectEmpty(r) # r : SDL_Rect* (Fiddle::Pointer)
    return (!r.null? || (r.w <= 0) || (r.h <= 0)) ? 1 : 0
  end

  def SDL_RectEquals(a, b) # a, b : SDL_Rect* (Fiddle::Pointer)
    return (!a.null? && !b.null? && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) ? 1 : 0
  end

  def self.import_rect_symbols
    # function
    extern 'int SDL_HasIntersection(const SDL_Rect*, const SDL_Rect*)'
    extern 'int SDL_IntersectRect(const SDL_Rect*, const SDL_Rect*, SDL_Rect*)'
    extern 'void SDL_UnionRect(const SDL_Rect*, const SDL_Rect*, SDL_Rect*)'
    extern 'int SDL_EnclosePoints(const SDL_Point*, int, const SDL_Rect*, SDL_Rect*)'
    extern 'int SDL_IntersectRectAndLine(const SDL_Rect*, int*, int*, int*, int*)'
  end

end

