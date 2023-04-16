import sdl2_parser, sdl2_generator

TYPEDEF_PREFIX_RECT = """
  def self.PointInRectFloat(p, r)
    return ( (p.x >= r.x) && (p.x < (r.x + r.w)) && (p.y >= r.y) && (p.y < (r.y + r.h)) ) ? 1 : 0;
  end

  def self.RectEmpty(r)
    return (!r.null? || (r.w <= 0) || (r.h <= 0)) ? 1 : 0
  end

  def self.RectsEqual(a, b)
    return (!a.null? && !b.null? && (a.x == b.x) && (a.y == b.y) && (a.w == b.w) && (a.h == b.h)) ? 1 : 0
  end
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL3/SDL_rect.h')
    sdl2_parser.execute(ctx)

    ctx.decl_functions['SDL_PointInRect'] = None
    ctx.decl_functions['SDL_RectEmpty'] = None
    ctx.decl_functions['SDL_RectsEqual'] = None
    ctx.decl_functions['SDL_PointInRectFloat'] = None
    ctx.decl_functions['SDL_RectEmptyFloat'] = None
    ctx.decl_functions['SDL_RectsEqualEpsilon'] = None
    ctx.decl_functions['SDL_RectsEqualFloat'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            typedef_prefix = TYPEDEF_PREFIX_RECT,
                            setup_method_name = 'rect')
