module SDL2

  extend Fiddle::Importer

  # SDL_RendererFlags
  SDL_RENDERER_SOFTWARE      = 0x00000001
  SDL_RENDERER_ACCELERATED   = 0x00000002
  SDL_RENDERER_PRESENTVSYNC  = 0x00000004
  SDL_RENDERER_TARGETTEXTURE = 0x00000008

  SDL_RendererInfo = struct(["const char *name",
                             "unsigned int flags",
                             "unsigned int num_texture_formats",
                             "unsigned int texture_formats[16]",
                             "int max_texture_width",
                             "int max_texture_heigh"])

  # SDL_TextureAccess
  SDL_TEXTUREACCESS_STATIC    = 0
  SDL_TEXTUREACCESS_STREAMING = 1
  SDL_TEXTUREACCESS_TARGET    = 2

  # SDL_TextureModulate
  SDL_TEXTUREMODULATE_NONE  = 0x00000000
  SDL_TEXTUREMODULATE_COLOR = 0x00000001
  SDL_TEXTUREMODULATE_ALPHA = 0x00000002

  # SDL_RendererFlip
  SDL_FLIP_NONE       = 0x00000000
  SDL_FLIP_HORIZONTAL = 0x00000001
  SDL_FLIP_VERTICAL   = 0x00000002


  def self.import_render_symbols
    # function
    extern 'int SDL_GetNumRenderDrivers()'
    extern 'int SDL_GetRenderDriverInfo(int, SDL_RendererInfo*)'
    extern 'int SDL_CreateWindowAndRenderer(int, int, unsigned int, SDL_Window**, SDL_Renderer**)'
    extern 'SDL_Renderer* SDL_CreateRenderer(SDL_Window*, int, unsigned int)'
    extern 'SDL_Renderer* SDL_CreateSoftwareRenderer(SDL_Surface*)'
    extern 'SDL_Renderer* SDL_GetRenderer(SDL_Window*)'
    extern 'int SDL_GetRendererInfo(SDL_Renderer*, SDL_RendererInfo*)'
    extern 'int SDL_GetRendererOutputSize(SDL_Renderer*, int*, int*)'
    extern 'SDL_Texture* SDL_CreateTexture(SDL_Renderer*, unsigned int, int, int, int)'
    extern 'SDL_Texture* SDL_CreateTextureFromSurface(SDL_Renderer*, SDL_Surface*)'
    extern 'int SDL_QueryTexture(SDL_Texture*, unsigned int*, int*, int*, int*)'
    extern 'int SDL_SetTextureColorMod(SDL_Texture*, unsigned char, unsigned char, unsigned char)'
    extern 'int SDL_GetTextureColorMod(SDL_Texture*, unsigned char*, unsigned char*, unsigned char*)'
    extern 'int SDL_SetTextureAlphaMod(SDL_Texture*, unsigned char)'
    extern 'int SDL_GetTextureAlphaMod(SDL_Texture*, unsigned char*)'
    extern 'int SDL_SetTextureBlendMode(SDL_Texture*, int)' # SDL_BlendMode => int
    extern 'int SDL_GetTextureBlendMode(SDL_Texture*, int*)' # SDL_BlendMode => int
    extern 'int SDL_UpdateTexture(SDL_Texture*, const SDL_Rect*, const void*, int)'
    extern 'int SDL_UpdateYUVTexture(SDL_Texture*, const SDL_Rect*, const unsigned char*, int, const unsigned char*, int, const unsigned char*, int)'
    extern 'int SDL_LockTexture(SDL_Texture*, const SDL_Rect*, void**, int*)'
    extern 'void SDL_UnlockTexture(SDL_Texture*)'
    extern 'int SDL_RenderTargetSupported(SDL_Renderer*)'
    extern 'int SDL_SetRenderTarget(SDL_Renderer*, SDL_Texture*)'
    extern 'SDL_Texture* SDL_GetRenderTarget(SDL_Renderer*)'
    extern 'int SDL_RenderSetLogicalSize(SDL_Renderer*, int, int)'
    extern 'void SDL_RenderGetLogicalSize(SDL_Renderer*, int*, int*)'
    extern 'int SDL_RenderSetViewport(SDL_Renderer*, const SDL_Rect*)'
    extern 'void SDL_RenderGetViewport(SDL_Renderer*, SDL_Rect*)'
    extern 'int SDL_RenderSetClipRect(SDL_Renderer*, const SDL_Rect*)'
    extern 'void SDL_RenderGetClipRect(SDL_Renderer*, SDL_Rect*)'
    extern 'int SDL_RenderSetScale(SDL_Renderer*, float, float)'
    extern 'void SDL_RenderGetScale(SDL_Renderer*, float*, float*)'
    extern 'int SDL_SetRenderDrawColor(SDL_Renderer*, unsigned char, unsigned char, unsigned char, unsigned char)'
    extern 'int SDL_GetRenderDrawColor(SDL_Renderer*, unsigned char*, unsigned char*, unsigned char*, unsigned char*)'
    extern 'int SDL_SetRenderDrawBlendMode(SDL_Renderer*, int)' # SDL_BlendMode => int
    extern 'int SDL_GetRenderDrawBlendMode(SDL_Renderer*, int*)' # SDL_BlendMode => int
    extern 'int SDL_RenderClear(SDL_Renderer*)'
    extern 'int SDL_RenderDrawPoint(SDL_Renderer*, int, int)'
    extern 'int SDL_RenderDrawPoints(SDL_Renderer*, const SDL_Point*, int)'
    extern 'int SDL_RenderDrawLine(SDL_Renderer*, int, int, int, int)'
    extern 'int SDL_RenderDrawLines(SDL_Renderer*, const SDL_Point*, int)'
    extern 'int SDL_RenderDrawRect(SDL_Renderer*, const SDL_Rect*)'
    extern 'int SDL_RenderDrawRects(SDL_Renderer*, const SDL_Rect*, int)'
    extern 'int SDL_RenderFillRect(SDL_Renderer*, const SDL_Rect*)'
    extern 'int SDL_RenderFillRects(SDL_Renderer*, const SDL_Rect*, int)'
    extern 'int SDL_RenderCopy(SDL_Renderer*, SDL_Texture*, const SDL_Rect*, const SDL_Rect*)'
    extern 'int SDL_RenderCopyEx(SDL_Renderer*, SDL_Texture*, const SDL_Rect*, const SDL_Rect*, double, const SDL_Point*, int)' # SDL_RendererFlip => int
    extern 'int SDL_RenderReadPixels(SDL_Renderer*, const SDL_Rect*, unsigned int, void*, int)'
    extern 'void SDL_RenderPresent(SDL_Renderer*)'
    extern 'void SDL_DestroyTexture(SDL_Texture*)'
    extern 'void SDL_DestroyRenderer(SDL_Renderer*)'
    extern 'int SDL_GL_BindTexture(SDL_Texture*, float*, float*)'
    extern 'int SDL_GL_UnbindTexture(SDL_Texture*)'
  end

end

