module SDL2

  extend Fiddle::Importer

  SDL_SWSURFACE = 0
  SDL_PREALLOC  = 0x00000001
  SDL_RLEACCEL  = 0x00000002
  SDL_DONTFREE  = 0x00000004

  def self.SDL_MUSTLOCK(surface)
    (surface.flags & SDL_RLEACCEL) != 0
  end

  SDL_Surface = struct(["unsigned int flags",
                        "SDL_PixelFormat* format",
                        "int w",
                        "int h",
                        "int pitch",
                        "void* pixels",
                        "void* userdata",
                        "int locked",
                        "void* lock_data",

                        # SDL_Rect clip_rect;
                        # [NOTE] Fiddle::Importer.struct disallows to write struct member directly.
                        #        So the member clip_rect (SDL_Rect) is decomposed into these elements:
                        "int clip_rect_x",
                        "int clip_rect_y",
                        "int clip_rect_w",
                        "int clip_rect_h",
                        "SDL_BlitMap* map",
                        "int refcount"])

  def self.SDL_LoadBMP(file);   SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1); end
  def self.SDL_SaveBMP(surface, file); SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1); end

  def self.SDL_BlitSurface(src, srcrect, dst, dstrect)
    SDL_UpperBlit(src, srcrect, dst, dstrect)
  end

  def self.SDL_BlitScaled(src, srcrect, dst, dstrect)
    SDL_UpperBlitScaled(src, srcrect, dst, dstrect)
  end


  def self.import_surface_symbols
    # function
    extern 'SDL_Surface* SDL_CreateRGBSurface(unsigned int, int, int, int, unsigned int, unsigned int, unsigned int, unsigned int)'
    extern 'SDL_Surface* SDL_CreateRGBSurfaceFrom(void*, int, int, int, int, unsigned int, unsigned int, unsigned int, unsigned int)'
    extern 'void SDL_FreeSurface(SDL_Surface*)'

    extern 'int SDL_SetSurfacePalette(SDL_Surface*, SDL_Palette*)'

    extern 'int SDL_LockSurface(SDL_Surface*)'
    extern 'void SDL_UnlockSurface(SDL_Surface*)'

    extern 'SDL_Surface* SDL_LoadBMP_RW(SDL_RWops*, int)'
    extern 'int SDL_SaveBMP_RW(SDL_Surface*, SDL_RWops*, int)'

    extern 'int SDL_SetSurfaceRLE(SDL_Surface*, int)'

    extern 'int SDL_SetColorKey(SDL_Surface*, int, unsigned int)'
    extern 'int SDL_GetColorKey(SDL_Surface*, unsigned int*)'

    extern 'int SDL_SetSurfaceColorMod(SDL_Surface*, unsigned char, unsigned char, unsigned char)'
    extern 'int SDL_GetSurfaceColorMod(SDL_Surface*, unsigned char*, unsigned char*, unsigned char*)'

    extern 'int SDL_SetSurfaceAlphaMod(SDL_Surface*,  unsigned char)'
    extern 'int SDL_GetSurfaceAlphaMod(SDL_Surface*, unsigned char*)'

    extern 'int SDL_SetSurfaceBlendMode(SDL_Surface*, int)' # SDL_BlendMode => int
    extern 'int SDL_GetSurfaceBlendMode(SDL_Surface*, int*)' # SDL_BlendMode => int

    extern 'int SDL_SetClipRect(SDL_Surface*, const SDL_Rect*)'
    extern 'void SDL_GetClipRect(SDL_Surface*, SDL_Rect*)'

    extern 'SDL_Surface* SDL_ConvertSurface(SDL_Surface*, const SDL_PixelFormat*, unsigned int)'
    extern 'SDL_Surface* SDL_ConvertSurfaceFormat(SDL_Surface*, unsigned int, unsigned int)'

    extern 'int SDL_ConvertPixels(int, int, unsigned int, const void*, int, unsigned int, void*, int)'

    extern 'int SDL_FillRect(SDL_Surface*, const SDL_Rect*, unsigned int)'
    extern 'int SDL_FillRects(SDL_Surface*, const SDL_Rect*, int, unsigned int)'

    extern 'int SDL_UpperBlit(SDL_Surface*, const SDL_Rect*, SDL_Surface*, SDL_Rect*)'
    extern 'int SDL_LowerBlit(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*)'

    extern 'int SDL_SoftStretch(SDL_Surface*, const SDL_Rect*, SDL_Surface*, const SDL_Rect*)'

    extern 'int SDL_UpperBlitScaled(SDL_Surface*, const SDL_Rect*, SDL_Surface*, SDL_Rect*)'
    extern 'int SDL_LowerBlitScaled(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*)'
  end

end

