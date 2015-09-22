module SDL2

  extend Fiddle::Importer

  SDL_DisplayMode = struct(["unsigned int format",
                            "int w",
                            "int h",
                            "int refresh_rate",
                            "void* driverdata"])

  # SDL_WindowFlags
  SDL_WINDOW_FULLSCREEN         = 0x00000001
  SDL_WINDOW_OPENGL             = 0x00000002
  SDL_WINDOW_SHOWN              = 0x00000004
  SDL_WINDOW_HIDDEN             = 0x00000008
  SDL_WINDOW_BORDERLESS         = 0x00000010
  SDL_WINDOW_RESIZABLE          = 0x00000020
  SDL_WINDOW_MINIMIZED          = 0x00000040
  SDL_WINDOW_MAXIMIZED          = 0x00000080
  SDL_WINDOW_INPUT_GRABBED      = 0x00000100
  SDL_WINDOW_INPUT_FOCUS        = 0x00000200
  SDL_WINDOW_MOUSE_FOCUS        = 0x00000400
  SDL_WINDOW_FULLSCREEN_DESKTOP = ( SDL_WINDOW_FULLSCREEN | 0x00001000 )
  SDL_WINDOW_FOREIGN            = 0x00000800
  SDL_WINDOW_ALLOW_HIGHDPI      = 0x00002000

  SDL_WINDOWPOS_UNDEFINED_MASK  =  0x1FFF0000
  def self.SDL_WINDOWPOS_UNDEFINED_DISPLAY(x);  (SDL_WINDOWPOS_UNDEFINED_MASK|(x)); end
  SDL_WINDOWPOS_UNDEFINED       =  SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
  def self.SDL_WINDOWPOS_ISUNDEFINED(x); (((x)&0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK); end

  SDL_WINDOWPOS_CENTERED_MASK   = 0x2FFF0000
  def self.SDL_WINDOWPOS_CENTERED_DISPLAY(x);  (SDL_WINDOWPOS_CENTERED_MASK|(x)); end
  SDL_WINDOWPOS_CENTERED        = SDL_WINDOWPOS_CENTERED_DISPLAY(0)
  def self.SDL_WINDOWPOS_ISCENTERED(x); (((x)&0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK); end

  # SDL_WindowEventID
  SDL_WINDOWEVENT_NONE         = 0
  SDL_WINDOWEVENT_SHOWN        = 1
  SDL_WINDOWEVENT_HIDDEN       = 2
  SDL_WINDOWEVENT_EXPOSED      = 3
  SDL_WINDOWEVENT_MOVED        = 4
  SDL_WINDOWEVENT_RESIZED      = 5
  SDL_WINDOWEVENT_SIZE_CHANGED = 6
  SDL_WINDOWEVENT_MINIMIZED    = 7
  SDL_WINDOWEVENT_MAXIMIZED    = 8
  SDL_WINDOWEVENT_RESTORED     = 9
  SDL_WINDOWEVENT_ENTER        = 10
  SDL_WINDOWEVENT_LEAVE        = 11
  SDL_WINDOWEVENT_FOCUS_GAINED = 12
  SDL_WINDOWEVENT_FOCUS_LOST   = 13
  SDL_WINDOWEVENT_CLOSE        = 14

  # SDL_GLattr
  SDL_GL_RED_SIZE                   = 0
  SDL_GL_GREEN_SIZE                 = 1
  SDL_GL_BLUE_SIZE                  = 2
  SDL_GL_ALPHA_SIZE                 = 3
  SDL_GL_BUFFER_SIZE                = 4
  SDL_GL_DOUBLEBUFFER               = 5
  SDL_GL_DEPTH_SIZE                 = 6
  SDL_GL_STENCIL_SIZE               = 7
  SDL_GL_ACCUM_RED_SIZE             = 8
  SDL_GL_ACCUM_GREEN_SIZE           = 9
  SDL_GL_ACCUM_BLUE_SIZE            = 10
  SDL_GL_ACCUM_ALPHA_SIZE           = 11
  SDL_GL_STEREO                     = 12
  SDL_GL_MULTISAMPLEBUFFERS         = 13
  SDL_GL_MULTISAMPLESAMPLES         = 14
  SDL_GL_ACCELERATED_VISUAL         = 15
  SDL_GL_RETAINED_BACKING           = 16
  SDL_GL_CONTEXT_MAJOR_VERSION      = 17
  SDL_GL_CONTEXT_MINOR_VERSION      = 18
  SDL_GL_CONTEXT_EGL                = 19
  SDL_GL_CONTEXT_FLAGS              = 20
  SDL_GL_CONTEXT_PROFILE_MASK       = 21
  SDL_GL_SHARE_WITH_CURRENT_CONTEXT = 22
  SDL_GL_FRAMEBUFFER_SRGB_CAPABLE   = 23

  # SDL_GLprofile
  SDL_GL_CONTEXT_PROFILE_CORE           = 0x0001
  SDL_GL_CONTEXT_PROFILE_COMPATIBILITY  = 0x0002
  SDL_GL_CONTEXT_PROFILE_ES             = 0x0004

  # SDL_GLcontextFlag
  SDL_GL_CONTEXT_DEBUG_FLAG              = 0x0001
  SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002
  SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004
  SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    = 0x0008


  def self.import_video_symbols
    typealias("SDL_GLContext", "void *")
    typealias("SDL_GLattr", "int")

    # function
    extern 'int SDL_GetNumVideoDrivers()'
    extern 'const char *SDL_GetVideoDriver(int)'
    extern 'int SDL_VideoInit(const char*)'
    extern 'void SDL_VideoQuit()'
    extern 'const char *SDL_GetCurrentVideoDriver()'
    extern 'int SDL_GetNumVideoDisplays()'
    extern 'const char* SDL_GetDisplayName(int)'
    extern 'int SDL_GetDisplayBounds(int, SDL_Rect*)'
    extern 'int SDL_GetNumDisplayModes(int)'
    extern 'int SDL_GetDisplayMode(int, int, SDL_DisplayMode*)'
    extern 'int SDL_GetDesktopDisplayMode(int, SDL_DisplayMode*)'
    extern 'int SDL_GetCurrentDisplayMode(int, SDL_DisplayMode*)'
    extern 'SDL_DisplayMode* SDL_GetClosestDisplayMode(int, const SDL_DisplayMode*, SDL_DisplayMode*)'
    extern 'int SDL_GetWindowDisplayIndex(SDL_Window*)'
    extern 'int SDL_SetWindowDisplayMode(SDL_Window*, const SDL_DisplayMode*)'
    extern 'int SDL_GetWindowDisplayMode(SDL_Window*, SDL_DisplayMode*)'
    extern 'unsigned int SDL_GetWindowPixelFormat(SDL_Window*)'
    extern 'SDL_Window* SDL_CreateWindow(const char *title, int, int, int, int, unsigned int)'
    extern 'SDL_Window* SDL_CreateWindowFrom(const void*)'
    extern 'unsigned int SDL_GetWindowID(SDL_Window*)'
    extern 'SDL_Window* SDL_GetWindowFromID(unsigned int)'
    extern 'unsigned int SDL_GetWindowFlags(SDL_Window*)'
    extern 'void SDL_SetWindowTitle(SDL_Window*, const char*)'
    extern 'const char *SDL_GetWindowTitle(SDL_Window*)'
    extern 'void SDL_SetWindowIcon(SDL_Window*, SDL_Surface*)'
    extern 'void* SDL_SetWindowData(SDL_Window*, const char*, void*)'
    extern 'void *SDL_GetWindowData(SDL_Window*, const char*)'
    extern 'void SDL_SetWindowPosition(SDL_Window*, int, int)'
    extern 'void SDL_GetWindowPosition(SDL_Window*, int*, int*)'
    extern 'void SDL_SetWindowSize(SDL_Window*, int, int)'
    extern 'void SDL_GetWindowSize(SDL_Window*, int*, int*)'
    extern 'void SDL_SetWindowMinimumSize(SDL_Window*, int, int)'
    extern 'void SDL_GetWindowMinimumSize(SDL_Window*, int*, int*)'
    extern 'void SDL_SetWindowMaximumSize(SDL_Window*, int, int)'
    extern 'void SDL_GetWindowMaximumSize(SDL_Window*, int*, int*)'
    extern 'void SDL_SetWindowBordered(SDL_Window*, int)'
    extern 'void SDL_ShowWindow(SDL_Window*)'
    extern 'void SDL_HideWindow(SDL_Window*)'
    extern 'void SDL_RaiseWindow(SDL_Window*)'
    extern 'void SDL_MaximizeWindow(SDL_Window*)'
    extern 'void SDL_MinimizeWindow(SDL_Window*)'
    extern 'void SDL_RestoreWindow(SDL_Window*)'
    extern 'int SDL_SetWindowFullscreen(SDL_Window*, unsigned int)'
    extern 'SDL_Surface* SDL_GetWindowSurface(SDL_Window*)'
    extern 'int SDL_UpdateWindowSurface(SDL_Window*)'
    extern 'int SDL_UpdateWindowSurfaceRects(SDL_Window*, const SDL_Rect*, int)'
    extern 'void SDL_SetWindowGrab(SDL_Window*, int)'
    extern 'int SDL_GetWindowGrab(SDL_Window*)'
    extern 'int SDL_SetWindowBrightness(SDL_Window*, float)'
    extern 'float SDL_GetWindowBrightness(SDL_Window*)'
    extern 'int SDL_SetWindowGammaRamp(SDL_Window*, const unsigned short*, const unsigned short*, const unsigned short*)'
    extern 'int SDL_GetWindowGammaRamp(SDL_Window*, unsigned short*, unsigned short*, unsigned short*)'
    extern 'void SDL_DestroyWindow(SDL_Window*)'
    extern 'int SDL_IsScreenSaverEnabled()'
    extern 'void SDL_EnableScreenSaver()'
    extern 'void SDL_DisableScreenSaver()'

    extern 'int SDL_GL_LoadLibrary(const char*)'
    extern 'void *SDL_GL_GetProcAddress(const char*)'
    extern 'void SDL_GL_UnloadLibrary()'
    extern 'int SDL_GL_ExtensionSupported(const char*)'
    extern 'void SDL_GL_ResetAttributes()'
    extern 'int SDL_GL_SetAttribute(SDL_GLattr, int)'
    extern 'int SDL_GL_GetAttribute(SDL_GLattr, int*)'
    extern 'SDL_GLContext SDL_GL_CreateContext(SDL_Window*)'
    extern 'int SDL_GL_MakeCurrent(SDL_Window*, SDL_GLContext)'
    extern 'SDL_Window* SDL_GL_GetCurrentWindow()'
    extern 'SDL_GLContext SDL_GL_GetCurrentContext()'
    extern 'void SDL_GL_GetDrawableSize(SDL_Window*, int*, int*)'
    extern 'int SDL_GL_SetSwapInterval(int)'
    extern 'int SDL_GL_GetSwapInterval()'
    extern 'void SDL_GL_SwapWindow(SDL_Window*)'
    extern 'void SDL_GL_DeleteContext(SDL_GLContext)'
  end

end

