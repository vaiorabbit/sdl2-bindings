# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
  WINDOWPOS_CENTERED_MASK = 0x2FFF0000

  # Enum

  WINDOW_FULLSCREEN = 1
  WINDOW_OPENGL = 2
  WINDOW_SHOWN = 4
  WINDOW_HIDDEN = 8
  WINDOW_BORDERLESS = 16
  WINDOW_RESIZABLE = 32
  WINDOW_MINIMIZED = 64
  WINDOW_MAXIMIZED = 128
  WINDOW_MOUSE_GRABBED = 256
  WINDOW_INPUT_FOCUS = 512
  WINDOW_MOUSE_FOCUS = 1024
  WINDOW_FULLSCREEN_DESKTOP = 4097
  WINDOW_FOREIGN = 2048
  WINDOW_ALLOW_HIGHDPI = 8192
  WINDOW_MOUSE_CAPTURE = 16384
  WINDOW_ALWAYS_ON_TOP = 32768
  WINDOW_SKIP_TASKBAR = 65536
  WINDOW_UTILITY = 131072
  WINDOW_TOOLTIP = 262144
  WINDOW_POPUP_MENU = 524288
  WINDOW_KEYBOARD_GRABBED = 1048576
  WINDOW_VULKAN = 268435456
  WINDOW_METAL = 536870912
  WINDOW_INPUT_GRABBED = 256
  WINDOWEVENT_NONE = 0
  WINDOWEVENT_SHOWN = 1
  WINDOWEVENT_HIDDEN = 2
  WINDOWEVENT_EXPOSED = 3
  WINDOWEVENT_MOVED = 4
  WINDOWEVENT_RESIZED = 5
  WINDOWEVENT_SIZE_CHANGED = 6
  WINDOWEVENT_MINIMIZED = 7
  WINDOWEVENT_MAXIMIZED = 8
  WINDOWEVENT_RESTORED = 9
  WINDOWEVENT_ENTER = 10
  WINDOWEVENT_LEAVE = 11
  WINDOWEVENT_FOCUS_GAINED = 12
  WINDOWEVENT_FOCUS_LOST = 13
  WINDOWEVENT_CLOSE = 14
  WINDOWEVENT_TAKE_FOCUS = 15
  WINDOWEVENT_HIT_TEST = 16
  WINDOWEVENT_ICCPROF_CHANGED = 17
  WINDOWEVENT_DISPLAY_CHANGED = 18
  DISPLAYEVENT_NONE = 0
  DISPLAYEVENT_ORIENTATION = 1
  DISPLAYEVENT_CONNECTED = 2
  DISPLAYEVENT_DISCONNECTED = 3
  DISPLAYEVENT_MOVED = 4
  ORIENTATION_UNKNOWN = 0
  ORIENTATION_LANDSCAPE = 1
  ORIENTATION_LANDSCAPE_FLIPPED = 2
  ORIENTATION_PORTRAIT = 3
  ORIENTATION_PORTRAIT_FLIPPED = 4
  FLASH_CANCEL = 0
  FLASH_BRIEFLY = 1
  FLASH_UNTIL_FOCUSED = 2
  GL_RED_SIZE = 0
  GL_GREEN_SIZE = 1
  GL_BLUE_SIZE = 2
  GL_ALPHA_SIZE = 3
  GL_BUFFER_SIZE = 4
  GL_DOUBLEBUFFER = 5
  GL_DEPTH_SIZE = 6
  GL_STENCIL_SIZE = 7
  GL_ACCUM_RED_SIZE = 8
  GL_ACCUM_GREEN_SIZE = 9
  GL_ACCUM_BLUE_SIZE = 10
  GL_ACCUM_ALPHA_SIZE = 11
  GL_STEREO = 12
  GL_MULTISAMPLEBUFFERS = 13
  GL_MULTISAMPLESAMPLES = 14
  GL_ACCELERATED_VISUAL = 15
  GL_RETAINED_BACKING = 16
  GL_CONTEXT_MAJOR_VERSION = 17
  GL_CONTEXT_MINOR_VERSION = 18
  GL_CONTEXT_EGL = 19
  GL_CONTEXT_FLAGS = 20
  GL_CONTEXT_PROFILE_MASK = 21
  GL_SHARE_WITH_CURRENT_CONTEXT = 22
  GL_FRAMEBUFFER_SRGB_CAPABLE = 23
  GL_CONTEXT_RELEASE_BEHAVIOR = 24
  GL_CONTEXT_RESET_NOTIFICATION = 25
  GL_CONTEXT_NO_ERROR = 26
  GL_FLOATBUFFERS = 27
  GL_CONTEXT_PROFILE_CORE = 1
  GL_CONTEXT_PROFILE_COMPATIBILITY = 2
  GL_CONTEXT_PROFILE_ES = 4
  GL_CONTEXT_DEBUG_FLAG = 1
  GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 2
  GL_CONTEXT_ROBUST_ACCESS_FLAG = 4
  GL_CONTEXT_RESET_ISOLATION_FLAG = 8
  GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0
  GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 1
  GL_CONTEXT_RESET_NO_NOTIFICATION = 0
  GL_CONTEXT_RESET_LOSE_CONTEXT = 1
  HITTEST_NORMAL = 0
  HITTEST_DRAGGABLE = 1
  HITTEST_RESIZE_TOPLEFT = 2
  HITTEST_RESIZE_TOP = 3
  HITTEST_RESIZE_TOPRIGHT = 4
  HITTEST_RESIZE_RIGHT = 5
  HITTEST_RESIZE_BOTTOMRIGHT = 6
  HITTEST_RESIZE_BOTTOM = 7
  HITTEST_RESIZE_BOTTOMLEFT = 8
  HITTEST_RESIZE_LEFT = 9

  # Typedef

  typedef :int, :SDL_WindowFlags
  typedef :int, :SDL_WindowEventID
  typedef :int, :SDL_DisplayEventID
  typedef :int, :SDL_DisplayOrientation
  typedef :int, :SDL_FlashOperation
  typedef :pointer, :SDL_GLContext
  typedef :int, :SDL_GLattr
  typedef :int, :SDL_GLprofile
  typedef :int, :SDL_GLcontextFlag
  typedef :int, :SDL_GLcontextReleaseFlag
  typedef :int, :SDL_GLContextResetNotification
  typedef :int, :SDL_HitTestResult
  callback :SDL_HitTest, [:pointer, :pointer, :pointer], :int

  # Struct

  class DisplayMode < FFI::Struct
    layout(
      :format, :uint,
      :w, :int,
      :h, :int,
      :refresh_rate, :int,
      :driverdata, :pointer,
    )
  end


  # Function

  def self.setup_video_symbols(output_error = false)
    symbols = [
      :SDL_GetNumVideoDrivers,
      :SDL_GetVideoDriver,
      :SDL_VideoInit,
      :SDL_VideoQuit,
      :SDL_GetCurrentVideoDriver,
      :SDL_GetNumVideoDisplays,
      :SDL_GetDisplayName,
      :SDL_GetDisplayBounds,
      :SDL_GetDisplayUsableBounds,
      :SDL_GetDisplayDPI,
      :SDL_GetDisplayOrientation,
      :SDL_GetNumDisplayModes,
      :SDL_GetDisplayMode,
      :SDL_GetDesktopDisplayMode,
      :SDL_GetCurrentDisplayMode,
      :SDL_GetClosestDisplayMode,
      :SDL_GetPointDisplayIndex,
      :SDL_GetRectDisplayIndex,
      :SDL_GetWindowDisplayIndex,
      :SDL_SetWindowDisplayMode,
      :SDL_GetWindowDisplayMode,
      :SDL_GetWindowICCProfile,
      :SDL_GetWindowPixelFormat,
      :SDL_CreateWindow,
      :SDL_CreateWindowFrom,
      :SDL_GetWindowID,
      :SDL_GetWindowFromID,
      :SDL_GetWindowFlags,
      :SDL_SetWindowTitle,
      :SDL_GetWindowTitle,
      :SDL_SetWindowIcon,
      :SDL_SetWindowData,
      :SDL_GetWindowData,
      :SDL_SetWindowPosition,
      :SDL_GetWindowPosition,
      :SDL_SetWindowSize,
      :SDL_GetWindowSize,
      :SDL_GetWindowBordersSize,
      :SDL_GetWindowSizeInPixels,
      :SDL_SetWindowMinimumSize,
      :SDL_GetWindowMinimumSize,
      :SDL_SetWindowMaximumSize,
      :SDL_GetWindowMaximumSize,
      :SDL_SetWindowBordered,
      :SDL_SetWindowResizable,
      :SDL_SetWindowAlwaysOnTop,
      :SDL_ShowWindow,
      :SDL_HideWindow,
      :SDL_RaiseWindow,
      :SDL_MaximizeWindow,
      :SDL_MinimizeWindow,
      :SDL_RestoreWindow,
      :SDL_SetWindowFullscreen,
      :SDL_HasWindowSurface,
      :SDL_GetWindowSurface,
      :SDL_UpdateWindowSurface,
      :SDL_UpdateWindowSurfaceRects,
      :SDL_DestroyWindowSurface,
      :SDL_SetWindowGrab,
      :SDL_SetWindowKeyboardGrab,
      :SDL_SetWindowMouseGrab,
      :SDL_GetWindowGrab,
      :SDL_GetWindowKeyboardGrab,
      :SDL_GetWindowMouseGrab,
      :SDL_GetGrabbedWindow,
      :SDL_SetWindowMouseRect,
      :SDL_GetWindowMouseRect,
      :SDL_SetWindowBrightness,
      :SDL_GetWindowBrightness,
      :SDL_SetWindowOpacity,
      :SDL_GetWindowOpacity,
      :SDL_SetWindowModalFor,
      :SDL_SetWindowInputFocus,
      :SDL_SetWindowGammaRamp,
      :SDL_GetWindowGammaRamp,
      :SDL_SetWindowHitTest,
      :SDL_FlashWindow,
      :SDL_DestroyWindow,
      :SDL_IsScreenSaverEnabled,
      :SDL_EnableScreenSaver,
      :SDL_DisableScreenSaver,
      :SDL_GL_LoadLibrary,
      :SDL_GL_GetProcAddress,
      :SDL_GL_UnloadLibrary,
      :SDL_GL_ExtensionSupported,
      :SDL_GL_ResetAttributes,
      :SDL_GL_SetAttribute,
      :SDL_GL_GetAttribute,
      :SDL_GL_CreateContext,
      :SDL_GL_MakeCurrent,
      :SDL_GL_GetCurrentWindow,
      :SDL_GL_GetCurrentContext,
      :SDL_GL_GetDrawableSize,
      :SDL_GL_SetSwapInterval,
      :SDL_GL_GetSwapInterval,
      :SDL_GL_SwapWindow,
      :SDL_GL_DeleteContext,
    ]
    apis = {
      :SDL_GetNumVideoDrivers => :GetNumVideoDrivers,
      :SDL_GetVideoDriver => :GetVideoDriver,
      :SDL_VideoInit => :VideoInit,
      :SDL_VideoQuit => :VideoQuit,
      :SDL_GetCurrentVideoDriver => :GetCurrentVideoDriver,
      :SDL_GetNumVideoDisplays => :GetNumVideoDisplays,
      :SDL_GetDisplayName => :GetDisplayName,
      :SDL_GetDisplayBounds => :GetDisplayBounds,
      :SDL_GetDisplayUsableBounds => :GetDisplayUsableBounds,
      :SDL_GetDisplayDPI => :GetDisplayDPI,
      :SDL_GetDisplayOrientation => :GetDisplayOrientation,
      :SDL_GetNumDisplayModes => :GetNumDisplayModes,
      :SDL_GetDisplayMode => :GetDisplayMode,
      :SDL_GetDesktopDisplayMode => :GetDesktopDisplayMode,
      :SDL_GetCurrentDisplayMode => :GetCurrentDisplayMode,
      :SDL_GetClosestDisplayMode => :GetClosestDisplayMode,
      :SDL_GetPointDisplayIndex => :GetPointDisplayIndex,
      :SDL_GetRectDisplayIndex => :GetRectDisplayIndex,
      :SDL_GetWindowDisplayIndex => :GetWindowDisplayIndex,
      :SDL_SetWindowDisplayMode => :SetWindowDisplayMode,
      :SDL_GetWindowDisplayMode => :GetWindowDisplayMode,
      :SDL_GetWindowICCProfile => :GetWindowICCProfile,
      :SDL_GetWindowPixelFormat => :GetWindowPixelFormat,
      :SDL_CreateWindow => :CreateWindow,
      :SDL_CreateWindowFrom => :CreateWindowFrom,
      :SDL_GetWindowID => :GetWindowID,
      :SDL_GetWindowFromID => :GetWindowFromID,
      :SDL_GetWindowFlags => :GetWindowFlags,
      :SDL_SetWindowTitle => :SetWindowTitle,
      :SDL_GetWindowTitle => :GetWindowTitle,
      :SDL_SetWindowIcon => :SetWindowIcon,
      :SDL_SetWindowData => :SetWindowData,
      :SDL_GetWindowData => :GetWindowData,
      :SDL_SetWindowPosition => :SetWindowPosition,
      :SDL_GetWindowPosition => :GetWindowPosition,
      :SDL_SetWindowSize => :SetWindowSize,
      :SDL_GetWindowSize => :GetWindowSize,
      :SDL_GetWindowBordersSize => :GetWindowBordersSize,
      :SDL_GetWindowSizeInPixels => :GetWindowSizeInPixels,
      :SDL_SetWindowMinimumSize => :SetWindowMinimumSize,
      :SDL_GetWindowMinimumSize => :GetWindowMinimumSize,
      :SDL_SetWindowMaximumSize => :SetWindowMaximumSize,
      :SDL_GetWindowMaximumSize => :GetWindowMaximumSize,
      :SDL_SetWindowBordered => :SetWindowBordered,
      :SDL_SetWindowResizable => :SetWindowResizable,
      :SDL_SetWindowAlwaysOnTop => :SetWindowAlwaysOnTop,
      :SDL_ShowWindow => :ShowWindow,
      :SDL_HideWindow => :HideWindow,
      :SDL_RaiseWindow => :RaiseWindow,
      :SDL_MaximizeWindow => :MaximizeWindow,
      :SDL_MinimizeWindow => :MinimizeWindow,
      :SDL_RestoreWindow => :RestoreWindow,
      :SDL_SetWindowFullscreen => :SetWindowFullscreen,
      :SDL_HasWindowSurface => :HasWindowSurface,
      :SDL_GetWindowSurface => :GetWindowSurface,
      :SDL_UpdateWindowSurface => :UpdateWindowSurface,
      :SDL_UpdateWindowSurfaceRects => :UpdateWindowSurfaceRects,
      :SDL_DestroyWindowSurface => :DestroyWindowSurface,
      :SDL_SetWindowGrab => :SetWindowGrab,
      :SDL_SetWindowKeyboardGrab => :SetWindowKeyboardGrab,
      :SDL_SetWindowMouseGrab => :SetWindowMouseGrab,
      :SDL_GetWindowGrab => :GetWindowGrab,
      :SDL_GetWindowKeyboardGrab => :GetWindowKeyboardGrab,
      :SDL_GetWindowMouseGrab => :GetWindowMouseGrab,
      :SDL_GetGrabbedWindow => :GetGrabbedWindow,
      :SDL_SetWindowMouseRect => :SetWindowMouseRect,
      :SDL_GetWindowMouseRect => :GetWindowMouseRect,
      :SDL_SetWindowBrightness => :SetWindowBrightness,
      :SDL_GetWindowBrightness => :GetWindowBrightness,
      :SDL_SetWindowOpacity => :SetWindowOpacity,
      :SDL_GetWindowOpacity => :GetWindowOpacity,
      :SDL_SetWindowModalFor => :SetWindowModalFor,
      :SDL_SetWindowInputFocus => :SetWindowInputFocus,
      :SDL_SetWindowGammaRamp => :SetWindowGammaRamp,
      :SDL_GetWindowGammaRamp => :GetWindowGammaRamp,
      :SDL_SetWindowHitTest => :SetWindowHitTest,
      :SDL_FlashWindow => :FlashWindow,
      :SDL_DestroyWindow => :DestroyWindow,
      :SDL_IsScreenSaverEnabled => :IsScreenSaverEnabled,
      :SDL_EnableScreenSaver => :EnableScreenSaver,
      :SDL_DisableScreenSaver => :DisableScreenSaver,
      :SDL_GL_LoadLibrary => :GL_LoadLibrary,
      :SDL_GL_GetProcAddress => :GL_GetProcAddress,
      :SDL_GL_UnloadLibrary => :GL_UnloadLibrary,
      :SDL_GL_ExtensionSupported => :GL_ExtensionSupported,
      :SDL_GL_ResetAttributes => :GL_ResetAttributes,
      :SDL_GL_SetAttribute => :GL_SetAttribute,
      :SDL_GL_GetAttribute => :GL_GetAttribute,
      :SDL_GL_CreateContext => :GL_CreateContext,
      :SDL_GL_MakeCurrent => :GL_MakeCurrent,
      :SDL_GL_GetCurrentWindow => :GL_GetCurrentWindow,
      :SDL_GL_GetCurrentContext => :GL_GetCurrentContext,
      :SDL_GL_GetDrawableSize => :GL_GetDrawableSize,
      :SDL_GL_SetSwapInterval => :GL_SetSwapInterval,
      :SDL_GL_GetSwapInterval => :GL_GetSwapInterval,
      :SDL_GL_SwapWindow => :GL_SwapWindow,
      :SDL_GL_DeleteContext => :GL_DeleteContext,
    }
    args = {
      :SDL_GetNumVideoDrivers => [],
      :SDL_GetVideoDriver => [:int],
      :SDL_VideoInit => [:pointer],
      :SDL_VideoQuit => [],
      :SDL_GetCurrentVideoDriver => [],
      :SDL_GetNumVideoDisplays => [],
      :SDL_GetDisplayName => [:int],
      :SDL_GetDisplayBounds => [:int, :pointer],
      :SDL_GetDisplayUsableBounds => [:int, :pointer],
      :SDL_GetDisplayDPI => [:int, :pointer, :pointer, :pointer],
      :SDL_GetDisplayOrientation => [:int],
      :SDL_GetNumDisplayModes => [:int],
      :SDL_GetDisplayMode => [:int, :int, :pointer],
      :SDL_GetDesktopDisplayMode => [:int, :pointer],
      :SDL_GetCurrentDisplayMode => [:int, :pointer],
      :SDL_GetClosestDisplayMode => [:int, :pointer, :pointer],
      :SDL_GetPointDisplayIndex => [:pointer],
      :SDL_GetRectDisplayIndex => [:pointer],
      :SDL_GetWindowDisplayIndex => [:pointer],
      :SDL_SetWindowDisplayMode => [:pointer, :pointer],
      :SDL_GetWindowDisplayMode => [:pointer, :pointer],
      :SDL_GetWindowICCProfile => [:pointer, :pointer],
      :SDL_GetWindowPixelFormat => [:pointer],
      :SDL_CreateWindow => [:pointer, :int, :int, :int, :int, :uint],
      :SDL_CreateWindowFrom => [:pointer],
      :SDL_GetWindowID => [:pointer],
      :SDL_GetWindowFromID => [:uint],
      :SDL_GetWindowFlags => [:pointer],
      :SDL_SetWindowTitle => [:pointer, :pointer],
      :SDL_GetWindowTitle => [:pointer],
      :SDL_SetWindowIcon => [:pointer, :pointer],
      :SDL_SetWindowData => [:pointer, :pointer, :pointer],
      :SDL_GetWindowData => [:pointer, :pointer],
      :SDL_SetWindowPosition => [:pointer, :int, :int],
      :SDL_GetWindowPosition => [:pointer, :pointer, :pointer],
      :SDL_SetWindowSize => [:pointer, :int, :int],
      :SDL_GetWindowSize => [:pointer, :pointer, :pointer],
      :SDL_GetWindowBordersSize => [:pointer, :pointer, :pointer, :pointer, :pointer],
      :SDL_GetWindowSizeInPixels => [:pointer, :pointer, :pointer],
      :SDL_SetWindowMinimumSize => [:pointer, :int, :int],
      :SDL_GetWindowMinimumSize => [:pointer, :pointer, :pointer],
      :SDL_SetWindowMaximumSize => [:pointer, :int, :int],
      :SDL_GetWindowMaximumSize => [:pointer, :pointer, :pointer],
      :SDL_SetWindowBordered => [:pointer, :int],
      :SDL_SetWindowResizable => [:pointer, :int],
      :SDL_SetWindowAlwaysOnTop => [:pointer, :int],
      :SDL_ShowWindow => [:pointer],
      :SDL_HideWindow => [:pointer],
      :SDL_RaiseWindow => [:pointer],
      :SDL_MaximizeWindow => [:pointer],
      :SDL_MinimizeWindow => [:pointer],
      :SDL_RestoreWindow => [:pointer],
      :SDL_SetWindowFullscreen => [:pointer, :uint],
      :SDL_HasWindowSurface => [:pointer],
      :SDL_GetWindowSurface => [:pointer],
      :SDL_UpdateWindowSurface => [:pointer],
      :SDL_UpdateWindowSurfaceRects => [:pointer, :pointer, :int],
      :SDL_DestroyWindowSurface => [:pointer],
      :SDL_SetWindowGrab => [:pointer, :int],
      :SDL_SetWindowKeyboardGrab => [:pointer, :int],
      :SDL_SetWindowMouseGrab => [:pointer, :int],
      :SDL_GetWindowGrab => [:pointer],
      :SDL_GetWindowKeyboardGrab => [:pointer],
      :SDL_GetWindowMouseGrab => [:pointer],
      :SDL_GetGrabbedWindow => [],
      :SDL_SetWindowMouseRect => [:pointer, :pointer],
      :SDL_GetWindowMouseRect => [:pointer],
      :SDL_SetWindowBrightness => [:pointer, :float],
      :SDL_GetWindowBrightness => [:pointer],
      :SDL_SetWindowOpacity => [:pointer, :float],
      :SDL_GetWindowOpacity => [:pointer, :pointer],
      :SDL_SetWindowModalFor => [:pointer, :pointer],
      :SDL_SetWindowInputFocus => [:pointer],
      :SDL_SetWindowGammaRamp => [:pointer, :pointer, :pointer, :pointer],
      :SDL_GetWindowGammaRamp => [:pointer, :pointer, :pointer, :pointer],
      :SDL_SetWindowHitTest => [:pointer, :SDL_HitTest, :pointer],
      :SDL_FlashWindow => [:pointer, :int],
      :SDL_DestroyWindow => [:pointer],
      :SDL_IsScreenSaverEnabled => [],
      :SDL_EnableScreenSaver => [],
      :SDL_DisableScreenSaver => [],
      :SDL_GL_LoadLibrary => [:pointer],
      :SDL_GL_GetProcAddress => [:pointer],
      :SDL_GL_UnloadLibrary => [],
      :SDL_GL_ExtensionSupported => [:pointer],
      :SDL_GL_ResetAttributes => [],
      :SDL_GL_SetAttribute => [:int, :int],
      :SDL_GL_GetAttribute => [:int, :pointer],
      :SDL_GL_CreateContext => [:pointer],
      :SDL_GL_MakeCurrent => [:pointer, :pointer],
      :SDL_GL_GetCurrentWindow => [],
      :SDL_GL_GetCurrentContext => [],
      :SDL_GL_GetDrawableSize => [:pointer, :pointer, :pointer],
      :SDL_GL_SetSwapInterval => [:int],
      :SDL_GL_GetSwapInterval => [],
      :SDL_GL_SwapWindow => [:pointer],
      :SDL_GL_DeleteContext => [:pointer],
    }
    retvals = {
      :SDL_GetNumVideoDrivers => :int,
      :SDL_GetVideoDriver => :pointer,
      :SDL_VideoInit => :int,
      :SDL_VideoQuit => :void,
      :SDL_GetCurrentVideoDriver => :pointer,
      :SDL_GetNumVideoDisplays => :int,
      :SDL_GetDisplayName => :pointer,
      :SDL_GetDisplayBounds => :int,
      :SDL_GetDisplayUsableBounds => :int,
      :SDL_GetDisplayDPI => :int,
      :SDL_GetDisplayOrientation => :int,
      :SDL_GetNumDisplayModes => :int,
      :SDL_GetDisplayMode => :int,
      :SDL_GetDesktopDisplayMode => :int,
      :SDL_GetCurrentDisplayMode => :int,
      :SDL_GetClosestDisplayMode => :pointer,
      :SDL_GetPointDisplayIndex => :int,
      :SDL_GetRectDisplayIndex => :int,
      :SDL_GetWindowDisplayIndex => :int,
      :SDL_SetWindowDisplayMode => :int,
      :SDL_GetWindowDisplayMode => :int,
      :SDL_GetWindowICCProfile => :pointer,
      :SDL_GetWindowPixelFormat => :uint,
      :SDL_CreateWindow => :pointer,
      :SDL_CreateWindowFrom => :pointer,
      :SDL_GetWindowID => :uint,
      :SDL_GetWindowFromID => :pointer,
      :SDL_GetWindowFlags => :uint,
      :SDL_SetWindowTitle => :void,
      :SDL_GetWindowTitle => :pointer,
      :SDL_SetWindowIcon => :void,
      :SDL_SetWindowData => :pointer,
      :SDL_GetWindowData => :pointer,
      :SDL_SetWindowPosition => :void,
      :SDL_GetWindowPosition => :void,
      :SDL_SetWindowSize => :void,
      :SDL_GetWindowSize => :void,
      :SDL_GetWindowBordersSize => :int,
      :SDL_GetWindowSizeInPixels => :void,
      :SDL_SetWindowMinimumSize => :void,
      :SDL_GetWindowMinimumSize => :void,
      :SDL_SetWindowMaximumSize => :void,
      :SDL_GetWindowMaximumSize => :void,
      :SDL_SetWindowBordered => :void,
      :SDL_SetWindowResizable => :void,
      :SDL_SetWindowAlwaysOnTop => :void,
      :SDL_ShowWindow => :void,
      :SDL_HideWindow => :void,
      :SDL_RaiseWindow => :void,
      :SDL_MaximizeWindow => :void,
      :SDL_MinimizeWindow => :void,
      :SDL_RestoreWindow => :void,
      :SDL_SetWindowFullscreen => :int,
      :SDL_HasWindowSurface => :int,
      :SDL_GetWindowSurface => :pointer,
      :SDL_UpdateWindowSurface => :int,
      :SDL_UpdateWindowSurfaceRects => :int,
      :SDL_DestroyWindowSurface => :int,
      :SDL_SetWindowGrab => :void,
      :SDL_SetWindowKeyboardGrab => :void,
      :SDL_SetWindowMouseGrab => :void,
      :SDL_GetWindowGrab => :int,
      :SDL_GetWindowKeyboardGrab => :int,
      :SDL_GetWindowMouseGrab => :int,
      :SDL_GetGrabbedWindow => :pointer,
      :SDL_SetWindowMouseRect => :int,
      :SDL_GetWindowMouseRect => :pointer,
      :SDL_SetWindowBrightness => :int,
      :SDL_GetWindowBrightness => :float,
      :SDL_SetWindowOpacity => :int,
      :SDL_GetWindowOpacity => :int,
      :SDL_SetWindowModalFor => :int,
      :SDL_SetWindowInputFocus => :int,
      :SDL_SetWindowGammaRamp => :int,
      :SDL_GetWindowGammaRamp => :int,
      :SDL_SetWindowHitTest => :int,
      :SDL_FlashWindow => :int,
      :SDL_DestroyWindow => :void,
      :SDL_IsScreenSaverEnabled => :int,
      :SDL_EnableScreenSaver => :void,
      :SDL_DisableScreenSaver => :void,
      :SDL_GL_LoadLibrary => :int,
      :SDL_GL_GetProcAddress => :pointer,
      :SDL_GL_UnloadLibrary => :void,
      :SDL_GL_ExtensionSupported => :int,
      :SDL_GL_ResetAttributes => :void,
      :SDL_GL_SetAttribute => :int,
      :SDL_GL_GetAttribute => :int,
      :SDL_GL_CreateContext => :pointer,
      :SDL_GL_MakeCurrent => :int,
      :SDL_GL_GetCurrentWindow => :pointer,
      :SDL_GL_GetCurrentContext => :pointer,
      :SDL_GL_GetDrawableSize => :void,
      :SDL_GL_SetSwapInterval => :int,
      :SDL_GL_GetSwapInterval => :int,
      :SDL_GL_SwapWindow => :void,
      :SDL_GL_DeleteContext => :void,
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

