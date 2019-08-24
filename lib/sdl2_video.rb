# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
  SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000

  # Enum

  SDL_WINDOW_FULLSCREEN = 1
  SDL_WINDOW_OPENGL = 2
  SDL_WINDOW_SHOWN = 4
  SDL_WINDOW_HIDDEN = 8
  SDL_WINDOW_BORDERLESS = 16
  SDL_WINDOW_RESIZABLE = 32
  SDL_WINDOW_MINIMIZED = 64
  SDL_WINDOW_MAXIMIZED = 128
  SDL_WINDOW_INPUT_GRABBED = 256
  SDL_WINDOW_INPUT_FOCUS = 512
  SDL_WINDOW_MOUSE_FOCUS = 1024
  SDL_WINDOW_FULLSCREEN_DESKTOP = 4097
  SDL_WINDOW_FOREIGN = 2048
  SDL_WINDOW_ALLOW_HIGHDPI = 8192
  SDL_WINDOW_MOUSE_CAPTURE = 16384
  SDL_WINDOW_ALWAYS_ON_TOP = 32768
  SDL_WINDOW_SKIP_TASKBAR = 65536
  SDL_WINDOW_UTILITY = 131072
  SDL_WINDOW_TOOLTIP = 262144
  SDL_WINDOW_POPUP_MENU = 524288
  SDL_WINDOW_VULKAN = 268435456
  SDL_WINDOWEVENT_NONE = 0
  SDL_WINDOWEVENT_SHOWN = 1
  SDL_WINDOWEVENT_HIDDEN = 2
  SDL_WINDOWEVENT_EXPOSED = 3
  SDL_WINDOWEVENT_MOVED = 4
  SDL_WINDOWEVENT_RESIZED = 5
  SDL_WINDOWEVENT_SIZE_CHANGED = 6
  SDL_WINDOWEVENT_MINIMIZED = 7
  SDL_WINDOWEVENT_MAXIMIZED = 8
  SDL_WINDOWEVENT_RESTORED = 9
  SDL_WINDOWEVENT_ENTER = 10
  SDL_WINDOWEVENT_LEAVE = 11
  SDL_WINDOWEVENT_FOCUS_GAINED = 12
  SDL_WINDOWEVENT_FOCUS_LOST = 13
  SDL_WINDOWEVENT_CLOSE = 14
  SDL_WINDOWEVENT_TAKE_FOCUS = 15
  SDL_WINDOWEVENT_HIT_TEST = 16
  SDL_DISPLAYEVENT_NONE = 0
  SDL_DISPLAYEVENT_ORIENTATION = 1
  SDL_ORIENTATION_UNKNOWN = 0
  SDL_ORIENTATION_LANDSCAPE = 1
  SDL_ORIENTATION_LANDSCAPE_FLIPPED = 2
  SDL_ORIENTATION_PORTRAIT = 3
  SDL_ORIENTATION_PORTRAIT_FLIPPED = 4
  SDL_GL_RED_SIZE = 0
  SDL_GL_GREEN_SIZE = 1
  SDL_GL_BLUE_SIZE = 2
  SDL_GL_ALPHA_SIZE = 3
  SDL_GL_BUFFER_SIZE = 4
  SDL_GL_DOUBLEBUFFER = 5
  SDL_GL_DEPTH_SIZE = 6
  SDL_GL_STENCIL_SIZE = 7
  SDL_GL_ACCUM_RED_SIZE = 8
  SDL_GL_ACCUM_GREEN_SIZE = 9
  SDL_GL_ACCUM_BLUE_SIZE = 10
  SDL_GL_ACCUM_ALPHA_SIZE = 11
  SDL_GL_STEREO = 12
  SDL_GL_MULTISAMPLEBUFFERS = 13
  SDL_GL_MULTISAMPLESAMPLES = 14
  SDL_GL_ACCELERATED_VISUAL = 15
  SDL_GL_RETAINED_BACKING = 16
  SDL_GL_CONTEXT_MAJOR_VERSION = 17
  SDL_GL_CONTEXT_MINOR_VERSION = 18
  SDL_GL_CONTEXT_EGL = 19
  SDL_GL_CONTEXT_FLAGS = 20
  SDL_GL_CONTEXT_PROFILE_MASK = 21
  SDL_GL_SHARE_WITH_CURRENT_CONTEXT = 22
  SDL_GL_FRAMEBUFFER_SRGB_CAPABLE = 23
  SDL_GL_CONTEXT_RELEASE_BEHAVIOR = 24
  SDL_GL_CONTEXT_RESET_NOTIFICATION = 25
  SDL_GL_CONTEXT_NO_ERROR = 26
  SDL_GL_CONTEXT_PROFILE_CORE = 1
  SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 2
  SDL_GL_CONTEXT_PROFILE_ES = 4
  SDL_GL_CONTEXT_DEBUG_FLAG = 1
  SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 2
  SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 4
  SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 8
  SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0
  SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 1
  SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0
  SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 1
  SDL_HITTEST_NORMAL = 0
  SDL_HITTEST_DRAGGABLE = 1
  SDL_HITTEST_RESIZE_TOPLEFT = 2
  SDL_HITTEST_RESIZE_TOP = 3
  SDL_HITTEST_RESIZE_TOPRIGHT = 4
  SDL_HITTEST_RESIZE_RIGHT = 5
  SDL_HITTEST_RESIZE_BOTTOMRIGHT = 6
  SDL_HITTEST_RESIZE_BOTTOM = 7
  SDL_HITTEST_RESIZE_BOTTOMLEFT = 8
  SDL_HITTEST_RESIZE_LEFT = 9

  # Typedef

  typedef :int, :SDL_WindowFlags
  typedef :int, :SDL_WindowEventID
  typedef :int, :SDL_DisplayEventID
  typedef :int, :SDL_DisplayOrientation
  typedef :pointer, :SDL_GLContext
  typedef :int, :SDL_GLattr
  typedef :int, :SDL_GLprofile
  typedef :int, :SDL_GLcontextFlag
  typedef :int, :SDL_GLcontextReleaseFlag
  typedef :int, :SDL_GLContextResetNotification
  typedef :int, :SDL_HitTestResult
  callback :SDL_HitTest, [:pointer, :pointer, :pointer], :int

  # Struct

  class SDL_DisplayMode < FFI::Struct
    layout(
      :format, :uint,
      :w, :int,
      :h, :int,
      :refresh_rate, :int,
      :driverdata, :pointer,
    )
  end


  # Function

  def self.setup_video_symbols()
      attach_function :SDL_GetNumVideoDrivers, [], :int
      attach_function :SDL_GetVideoDriver, [:int], :pointer
      attach_function :SDL_VideoInit, [:pointer], :int
      attach_function :SDL_VideoQuit, [], :void
      attach_function :SDL_GetCurrentVideoDriver, [], :pointer
      attach_function :SDL_GetNumVideoDisplays, [], :int
      attach_function :SDL_GetDisplayName, [:int], :pointer
      attach_function :SDL_GetDisplayBounds, [:int, :pointer], :int
      attach_function :SDL_GetDisplayUsableBounds, [:int, :pointer], :int
      attach_function :SDL_GetDisplayDPI, [:int, :pointer, :pointer, :pointer], :int
      attach_function :SDL_GetDisplayOrientation, [:int], :int
      attach_function :SDL_GetNumDisplayModes, [:int], :int
      attach_function :SDL_GetDisplayMode, [:int, :int, :pointer], :int
      attach_function :SDL_GetDesktopDisplayMode, [:int, :pointer], :int
      attach_function :SDL_GetCurrentDisplayMode, [:int, :pointer], :int
      attach_function :SDL_GetClosestDisplayMode, [:int, :pointer, :pointer], :pointer
      attach_function :SDL_GetWindowDisplayIndex, [:pointer], :int
      attach_function :SDL_SetWindowDisplayMode, [:pointer, :pointer], :int
      attach_function :SDL_GetWindowDisplayMode, [:pointer, :pointer], :int
      attach_function :SDL_GetWindowPixelFormat, [:pointer], :uint
      attach_function :SDL_CreateWindow, [:pointer, :int, :int, :int, :int, :uint], :pointer
      attach_function :SDL_CreateWindowFrom, [:pointer], :pointer
      attach_function :SDL_GetWindowID, [:pointer], :uint
      attach_function :SDL_GetWindowFromID, [:uint], :pointer
      attach_function :SDL_GetWindowFlags, [:pointer], :uint
      attach_function :SDL_SetWindowTitle, [:pointer, :pointer], :void
      attach_function :SDL_GetWindowTitle, [:pointer], :pointer
      attach_function :SDL_SetWindowIcon, [:pointer, :pointer], :void
      attach_function :SDL_SetWindowData, [:pointer, :pointer, :pointer], :pointer
      attach_function :SDL_GetWindowData, [:pointer, :pointer], :pointer
      attach_function :SDL_SetWindowPosition, [:pointer, :int, :int], :void
      attach_function :SDL_GetWindowPosition, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_SetWindowSize, [:pointer, :int, :int], :void
      attach_function :SDL_GetWindowSize, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_GetWindowBordersSize, [:pointer, :pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetWindowMinimumSize, [:pointer, :int, :int], :void
      attach_function :SDL_GetWindowMinimumSize, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_SetWindowMaximumSize, [:pointer, :int, :int], :void
      attach_function :SDL_GetWindowMaximumSize, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_SetWindowBordered, [:pointer, :int], :void
      attach_function :SDL_SetWindowResizable, [:pointer, :int], :void
      attach_function :SDL_ShowWindow, [:pointer], :void
      attach_function :SDL_HideWindow, [:pointer], :void
      attach_function :SDL_RaiseWindow, [:pointer], :void
      attach_function :SDL_MaximizeWindow, [:pointer], :void
      attach_function :SDL_MinimizeWindow, [:pointer], :void
      attach_function :SDL_RestoreWindow, [:pointer], :void
      attach_function :SDL_SetWindowFullscreen, [:pointer, :uint], :int
      attach_function :SDL_GetWindowSurface, [:pointer], :pointer
      attach_function :SDL_UpdateWindowSurface, [:pointer], :int
      attach_function :SDL_UpdateWindowSurfaceRects, [:pointer, :pointer, :int], :int
      attach_function :SDL_SetWindowGrab, [:pointer, :int], :void
      attach_function :SDL_GetWindowGrab, [:pointer], :int
      attach_function :SDL_GetGrabbedWindow, [], :pointer
      attach_function :SDL_SetWindowBrightness, [:pointer, :float], :int
      attach_function :SDL_GetWindowBrightness, [:pointer], :float
      attach_function :SDL_SetWindowOpacity, [:pointer, :float], :int
      attach_function :SDL_GetWindowOpacity, [:pointer, :pointer], :int
      attach_function :SDL_SetWindowModalFor, [:pointer, :pointer], :int
      attach_function :SDL_SetWindowInputFocus, [:pointer], :int
      attach_function :SDL_SetWindowGammaRamp, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_GetWindowGammaRamp, [:pointer, :pointer, :pointer, :pointer], :int
      attach_function :SDL_SetWindowHitTest, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_DestroyWindow, [:pointer], :void
      attach_function :SDL_IsScreenSaverEnabled, [], :int
      attach_function :SDL_EnableScreenSaver, [], :void
      attach_function :SDL_DisableScreenSaver, [], :void
      attach_function :SDL_GL_LoadLibrary, [:pointer], :int
      attach_function :SDL_GL_GetProcAddress, [:pointer], :pointer
      attach_function :SDL_GL_UnloadLibrary, [], :void
      attach_function :SDL_GL_ExtensionSupported, [:pointer], :int
      attach_function :SDL_GL_ResetAttributes, [], :void
      attach_function :SDL_GL_SetAttribute, [:int, :int], :int
      attach_function :SDL_GL_GetAttribute, [:int, :pointer], :int
      attach_function :SDL_GL_CreateContext, [:pointer], :pointer
      attach_function :SDL_GL_MakeCurrent, [:pointer, :pointer], :int
      attach_function :SDL_GL_GetCurrentWindow, [], :pointer
      attach_function :SDL_GL_GetCurrentContext, [], :pointer
      attach_function :SDL_GL_GetDrawableSize, [:pointer, :pointer, :pointer], :void
      attach_function :SDL_GL_SetSwapInterval, [:int], :int
      attach_function :SDL_GL_GetSwapInterval, [], :int
      attach_function :SDL_GL_SwapWindow, [:pointer], :void
      attach_function :SDL_GL_DeleteContext, [:pointer], :void
  end

end

