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

  SYSTEM_THEME_UNKNOWN = 0
  SYSTEM_THEME_LIGHT = 1
  SYSTEM_THEME_DARK = 2
  ORIENTATION_UNKNOWN = 0
  ORIENTATION_LANDSCAPE = 1
  ORIENTATION_LANDSCAPE_FLIPPED = 2
  ORIENTATION_PORTRAIT = 3
  ORIENTATION_PORTRAIT_FLIPPED = 4
  WINDOW_FULLSCREEN = 1
  WINDOW_OPENGL = 2
  WINDOW_OCCLUDED = 4
  WINDOW_HIDDEN = 8
  WINDOW_BORDERLESS = 16
  WINDOW_RESIZABLE = 32
  WINDOW_MINIMIZED = 64
  WINDOW_MAXIMIZED = 128
  WINDOW_MOUSE_GRABBED = 256
  WINDOW_INPUT_FOCUS = 512
  WINDOW_MOUSE_FOCUS = 1024
  WINDOW_FOREIGN = 2048
  WINDOW_HIGH_PIXEL_DENSITY = 8192
  WINDOW_MOUSE_CAPTURE = 16384
  WINDOW_ALWAYS_ON_TOP = 32768
  WINDOW_UTILITY = 131072
  WINDOW_TOOLTIP = 262144
  WINDOW_POPUP_MENU = 524288
  WINDOW_KEYBOARD_GRABBED = 1048576
  WINDOW_VULKAN = 268435456
  WINDOW_METAL = 536870912
  WINDOW_TRANSPARENT = 1073741824
  WINDOW_NOT_FOCUSABLE = 2147483648
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
  GL_CONTEXT_FLAGS = 19
  GL_CONTEXT_PROFILE_MASK = 20
  GL_SHARE_WITH_CURRENT_CONTEXT = 21
  GL_FRAMEBUFFER_SRGB_CAPABLE = 22
  GL_CONTEXT_RELEASE_BEHAVIOR = 23
  GL_CONTEXT_RESET_NOTIFICATION = 24
  GL_CONTEXT_NO_ERROR = 25
  GL_FLOATBUFFERS = 26
  GL_EGL_PLATFORM = 27
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

  typedef :uint, :SDL_DisplayID
  typedef :uint, :SDL_WindowID
  typedef :int, :SDL_SystemTheme
  typedef :int, :SDL_DisplayOrientation
  typedef :int, :SDL_WindowFlags
  typedef :int, :SDL_FlashOperation
  typedef :pointer, :SDL_GLContext
  typedef :pointer, :SDL_EGLDisplay
  typedef :pointer, :SDL_EGLConfig
  typedef :pointer, :SDL_EGLSurface
  typedef :long, :SDL_EGLAttrib
  typedef :int, :SDL_EGLint
  callback :SDL_EGLAttribArrayCallback, [], :pointer
  callback :SDL_EGLIntArrayCallback, [], :pointer
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
      :displayID, :uint,
      :format, :uint,
      :w, :int,
      :h, :int,
      :pixel_density, :float,
      :refresh_rate, :float,
      :driverdata, :pointer,
    )
  end


  # Function

  def self.setup_video_symbols(output_error = false)
    symbols = [
      :SDL_GetNumVideoDrivers,
      :SDL_GetVideoDriver,
      :SDL_GetCurrentVideoDriver,
      :SDL_GetSystemTheme,
      :SDL_GetDisplays,
      :SDL_GetPrimaryDisplay,
      :SDL_GetDisplayName,
      :SDL_GetDisplayBounds,
      :SDL_GetDisplayUsableBounds,
      :SDL_GetNaturalDisplayOrientation,
      :SDL_GetCurrentDisplayOrientation,
      :SDL_GetDisplayContentScale,
      :SDL_GetFullscreenDisplayModes,
      :SDL_GetClosestFullscreenDisplayMode,
      :SDL_GetDesktopDisplayMode,
      :SDL_GetCurrentDisplayMode,
      :SDL_GetDisplayForPoint,
      :SDL_GetDisplayForRect,
      :SDL_GetDisplayForWindow,
      :SDL_GetWindowPixelDensity,
      :SDL_GetWindowDisplayScale,
      :SDL_SetWindowFullscreenMode,
      :SDL_GetWindowFullscreenMode,
      :SDL_GetWindowICCProfile,
      :SDL_GetWindowPixelFormat,
      :SDL_CreateWindow,
      :SDL_CreateWindowWithPosition,
      :SDL_CreatePopupWindow,
      :SDL_CreateWindowFrom,
      :SDL_GetWindowID,
      :SDL_GetWindowFromID,
      :SDL_GetWindowParent,
      :SDL_GetWindowProperties,
      :SDL_GetWindowFlags,
      :SDL_SetWindowTitle,
      :SDL_GetWindowTitle,
      :SDL_SetWindowIcon,
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
      :SDL_SetWindowOpacity,
      :SDL_GetWindowOpacity,
      :SDL_SetWindowModalFor,
      :SDL_SetWindowInputFocus,
      :SDL_SetWindowFocusable,
      :SDL_ShowWindowSystemMenu,
      :SDL_SetWindowHitTest,
      :SDL_FlashWindow,
      :SDL_DestroyWindow,
      :SDL_ScreenSaverEnabled,
      :SDL_EnableScreenSaver,
      :SDL_DisableScreenSaver,
      :SDL_GL_LoadLibrary,
      :SDL_GL_GetProcAddress,
      :SDL_EGL_GetProcAddress,
      :SDL_GL_UnloadLibrary,
      :SDL_GL_ExtensionSupported,
      :SDL_GL_ResetAttributes,
      :SDL_GL_SetAttribute,
      :SDL_GL_GetAttribute,
      :SDL_GL_CreateContext,
      :SDL_GL_MakeCurrent,
      :SDL_GL_GetCurrentWindow,
      :SDL_GL_GetCurrentContext,
      :SDL_EGL_GetCurrentEGLDisplay,
      :SDL_EGL_GetCurrentEGLConfig,
      :SDL_EGL_GetWindowEGLSurface,
      :SDL_EGL_SetEGLAttributeCallbacks,
      :SDL_GL_SetSwapInterval,
      :SDL_GL_GetSwapInterval,
      :SDL_GL_SwapWindow,
      :SDL_GL_DeleteContext,
    ]
    apis = {
      :SDL_GetNumVideoDrivers => :GetNumVideoDrivers,
      :SDL_GetVideoDriver => :GetVideoDriver,
      :SDL_GetCurrentVideoDriver => :GetCurrentVideoDriver,
      :SDL_GetSystemTheme => :GetSystemTheme,
      :SDL_GetDisplays => :GetDisplays,
      :SDL_GetPrimaryDisplay => :GetPrimaryDisplay,
      :SDL_GetDisplayName => :GetDisplayName,
      :SDL_GetDisplayBounds => :GetDisplayBounds,
      :SDL_GetDisplayUsableBounds => :GetDisplayUsableBounds,
      :SDL_GetNaturalDisplayOrientation => :GetNaturalDisplayOrientation,
      :SDL_GetCurrentDisplayOrientation => :GetCurrentDisplayOrientation,
      :SDL_GetDisplayContentScale => :GetDisplayContentScale,
      :SDL_GetFullscreenDisplayModes => :GetFullscreenDisplayModes,
      :SDL_GetClosestFullscreenDisplayMode => :GetClosestFullscreenDisplayMode,
      :SDL_GetDesktopDisplayMode => :GetDesktopDisplayMode,
      :SDL_GetCurrentDisplayMode => :GetCurrentDisplayMode,
      :SDL_GetDisplayForPoint => :GetDisplayForPoint,
      :SDL_GetDisplayForRect => :GetDisplayForRect,
      :SDL_GetDisplayForWindow => :GetDisplayForWindow,
      :SDL_GetWindowPixelDensity => :GetWindowPixelDensity,
      :SDL_GetWindowDisplayScale => :GetWindowDisplayScale,
      :SDL_SetWindowFullscreenMode => :SetWindowFullscreenMode,
      :SDL_GetWindowFullscreenMode => :GetWindowFullscreenMode,
      :SDL_GetWindowICCProfile => :GetWindowICCProfile,
      :SDL_GetWindowPixelFormat => :GetWindowPixelFormat,
      :SDL_CreateWindow => :CreateWindow,
      :SDL_CreateWindowWithPosition => :CreateWindowWithPosition,
      :SDL_CreatePopupWindow => :CreatePopupWindow,
      :SDL_CreateWindowFrom => :CreateWindowFrom,
      :SDL_GetWindowID => :GetWindowID,
      :SDL_GetWindowFromID => :GetWindowFromID,
      :SDL_GetWindowParent => :GetWindowParent,
      :SDL_GetWindowProperties => :GetWindowProperties,
      :SDL_GetWindowFlags => :GetWindowFlags,
      :SDL_SetWindowTitle => :SetWindowTitle,
      :SDL_GetWindowTitle => :GetWindowTitle,
      :SDL_SetWindowIcon => :SetWindowIcon,
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
      :SDL_SetWindowOpacity => :SetWindowOpacity,
      :SDL_GetWindowOpacity => :GetWindowOpacity,
      :SDL_SetWindowModalFor => :SetWindowModalFor,
      :SDL_SetWindowInputFocus => :SetWindowInputFocus,
      :SDL_SetWindowFocusable => :SetWindowFocusable,
      :SDL_ShowWindowSystemMenu => :ShowWindowSystemMenu,
      :SDL_SetWindowHitTest => :SetWindowHitTest,
      :SDL_FlashWindow => :FlashWindow,
      :SDL_DestroyWindow => :DestroyWindow,
      :SDL_ScreenSaverEnabled => :ScreenSaverEnabled,
      :SDL_EnableScreenSaver => :EnableScreenSaver,
      :SDL_DisableScreenSaver => :DisableScreenSaver,
      :SDL_GL_LoadLibrary => :GL_LoadLibrary,
      :SDL_GL_GetProcAddress => :GL_GetProcAddress,
      :SDL_EGL_GetProcAddress => :EGL_GetProcAddress,
      :SDL_GL_UnloadLibrary => :GL_UnloadLibrary,
      :SDL_GL_ExtensionSupported => :GL_ExtensionSupported,
      :SDL_GL_ResetAttributes => :GL_ResetAttributes,
      :SDL_GL_SetAttribute => :GL_SetAttribute,
      :SDL_GL_GetAttribute => :GL_GetAttribute,
      :SDL_GL_CreateContext => :GL_CreateContext,
      :SDL_GL_MakeCurrent => :GL_MakeCurrent,
      :SDL_GL_GetCurrentWindow => :GL_GetCurrentWindow,
      :SDL_GL_GetCurrentContext => :GL_GetCurrentContext,
      :SDL_EGL_GetCurrentEGLDisplay => :EGL_GetCurrentEGLDisplay,
      :SDL_EGL_GetCurrentEGLConfig => :EGL_GetCurrentEGLConfig,
      :SDL_EGL_GetWindowEGLSurface => :EGL_GetWindowEGLSurface,
      :SDL_EGL_SetEGLAttributeCallbacks => :EGL_SetEGLAttributeCallbacks,
      :SDL_GL_SetSwapInterval => :GL_SetSwapInterval,
      :SDL_GL_GetSwapInterval => :GL_GetSwapInterval,
      :SDL_GL_SwapWindow => :GL_SwapWindow,
      :SDL_GL_DeleteContext => :GL_DeleteContext,
    }
    args = {
      :SDL_GetNumVideoDrivers => [],
      :SDL_GetVideoDriver => [:int],
      :SDL_GetCurrentVideoDriver => [],
      :SDL_GetSystemTheme => [],
      :SDL_GetDisplays => [:pointer],
      :SDL_GetPrimaryDisplay => [],
      :SDL_GetDisplayName => [:uint],
      :SDL_GetDisplayBounds => [:uint, :pointer],
      :SDL_GetDisplayUsableBounds => [:uint, :pointer],
      :SDL_GetNaturalDisplayOrientation => [:uint],
      :SDL_GetCurrentDisplayOrientation => [:uint],
      :SDL_GetDisplayContentScale => [:uint],
      :SDL_GetFullscreenDisplayModes => [:uint, :pointer],
      :SDL_GetClosestFullscreenDisplayMode => [:uint, :int, :int, :float, :int],
      :SDL_GetDesktopDisplayMode => [:uint],
      :SDL_GetCurrentDisplayMode => [:uint],
      :SDL_GetDisplayForPoint => [:pointer],
      :SDL_GetDisplayForRect => [:pointer],
      :SDL_GetDisplayForWindow => [:pointer],
      :SDL_GetWindowPixelDensity => [:pointer],
      :SDL_GetWindowDisplayScale => [:pointer],
      :SDL_SetWindowFullscreenMode => [:pointer, :pointer],
      :SDL_GetWindowFullscreenMode => [:pointer],
      :SDL_GetWindowICCProfile => [:pointer, :pointer],
      :SDL_GetWindowPixelFormat => [:pointer],
      :SDL_CreateWindow => [:pointer, :int, :int, :uint],
      :SDL_CreateWindowWithPosition => [:pointer, :int, :int, :int, :int, :uint],
      :SDL_CreatePopupWindow => [:pointer, :int, :int, :int, :int, :uint],
      :SDL_CreateWindowFrom => [:pointer],
      :SDL_GetWindowID => [:pointer],
      :SDL_GetWindowFromID => [:uint],
      :SDL_GetWindowParent => [:pointer],
      :SDL_GetWindowProperties => [:pointer],
      :SDL_GetWindowFlags => [:pointer],
      :SDL_SetWindowTitle => [:pointer, :pointer],
      :SDL_GetWindowTitle => [:pointer],
      :SDL_SetWindowIcon => [:pointer, :pointer],
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
      :SDL_SetWindowFullscreen => [:pointer, :int],
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
      :SDL_SetWindowOpacity => [:pointer, :float],
      :SDL_GetWindowOpacity => [:pointer, :pointer],
      :SDL_SetWindowModalFor => [:pointer, :pointer],
      :SDL_SetWindowInputFocus => [:pointer],
      :SDL_SetWindowFocusable => [:pointer, :int],
      :SDL_ShowWindowSystemMenu => [:pointer, :int, :int],
      :SDL_SetWindowHitTest => [:pointer, :SDL_HitTest, :pointer],
      :SDL_FlashWindow => [:pointer, :int],
      :SDL_DestroyWindow => [:pointer],
      :SDL_ScreenSaverEnabled => [],
      :SDL_EnableScreenSaver => [],
      :SDL_DisableScreenSaver => [],
      :SDL_GL_LoadLibrary => [:pointer],
      :SDL_GL_GetProcAddress => [:pointer],
      :SDL_EGL_GetProcAddress => [:pointer],
      :SDL_GL_UnloadLibrary => [],
      :SDL_GL_ExtensionSupported => [:pointer],
      :SDL_GL_ResetAttributes => [],
      :SDL_GL_SetAttribute => [:int, :int],
      :SDL_GL_GetAttribute => [:int, :pointer],
      :SDL_GL_CreateContext => [:pointer],
      :SDL_GL_MakeCurrent => [:pointer, :pointer],
      :SDL_GL_GetCurrentWindow => [],
      :SDL_GL_GetCurrentContext => [],
      :SDL_EGL_GetCurrentEGLDisplay => [],
      :SDL_EGL_GetCurrentEGLConfig => [],
      :SDL_EGL_GetWindowEGLSurface => [:pointer],
      :SDL_EGL_SetEGLAttributeCallbacks => [:SDL_EGLAttribArrayCallback, :SDL_EGLIntArrayCallback, :SDL_EGLIntArrayCallback],
      :SDL_GL_SetSwapInterval => [:int],
      :SDL_GL_GetSwapInterval => [:pointer],
      :SDL_GL_SwapWindow => [:pointer],
      :SDL_GL_DeleteContext => [:pointer],
    }
    retvals = {
      :SDL_GetNumVideoDrivers => :int,
      :SDL_GetVideoDriver => :pointer,
      :SDL_GetCurrentVideoDriver => :pointer,
      :SDL_GetSystemTheme => :int,
      :SDL_GetDisplays => :pointer,
      :SDL_GetPrimaryDisplay => :uint,
      :SDL_GetDisplayName => :pointer,
      :SDL_GetDisplayBounds => :int,
      :SDL_GetDisplayUsableBounds => :int,
      :SDL_GetNaturalDisplayOrientation => :int,
      :SDL_GetCurrentDisplayOrientation => :int,
      :SDL_GetDisplayContentScale => :float,
      :SDL_GetFullscreenDisplayModes => :pointer,
      :SDL_GetClosestFullscreenDisplayMode => :pointer,
      :SDL_GetDesktopDisplayMode => :pointer,
      :SDL_GetCurrentDisplayMode => :pointer,
      :SDL_GetDisplayForPoint => :uint,
      :SDL_GetDisplayForRect => :uint,
      :SDL_GetDisplayForWindow => :uint,
      :SDL_GetWindowPixelDensity => :float,
      :SDL_GetWindowDisplayScale => :float,
      :SDL_SetWindowFullscreenMode => :int,
      :SDL_GetWindowFullscreenMode => :pointer,
      :SDL_GetWindowICCProfile => :pointer,
      :SDL_GetWindowPixelFormat => :uint,
      :SDL_CreateWindow => :pointer,
      :SDL_CreateWindowWithPosition => :pointer,
      :SDL_CreatePopupWindow => :pointer,
      :SDL_CreateWindowFrom => :pointer,
      :SDL_GetWindowID => :uint,
      :SDL_GetWindowFromID => :pointer,
      :SDL_GetWindowParent => :pointer,
      :SDL_GetWindowProperties => :uint,
      :SDL_GetWindowFlags => :uint,
      :SDL_SetWindowTitle => :int,
      :SDL_GetWindowTitle => :pointer,
      :SDL_SetWindowIcon => :int,
      :SDL_SetWindowPosition => :int,
      :SDL_GetWindowPosition => :int,
      :SDL_SetWindowSize => :int,
      :SDL_GetWindowSize => :int,
      :SDL_GetWindowBordersSize => :int,
      :SDL_GetWindowSizeInPixels => :int,
      :SDL_SetWindowMinimumSize => :int,
      :SDL_GetWindowMinimumSize => :int,
      :SDL_SetWindowMaximumSize => :int,
      :SDL_GetWindowMaximumSize => :int,
      :SDL_SetWindowBordered => :int,
      :SDL_SetWindowResizable => :int,
      :SDL_SetWindowAlwaysOnTop => :int,
      :SDL_ShowWindow => :int,
      :SDL_HideWindow => :int,
      :SDL_RaiseWindow => :int,
      :SDL_MaximizeWindow => :int,
      :SDL_MinimizeWindow => :int,
      :SDL_RestoreWindow => :int,
      :SDL_SetWindowFullscreen => :int,
      :SDL_HasWindowSurface => :int,
      :SDL_GetWindowSurface => :pointer,
      :SDL_UpdateWindowSurface => :int,
      :SDL_UpdateWindowSurfaceRects => :int,
      :SDL_DestroyWindowSurface => :int,
      :SDL_SetWindowGrab => :int,
      :SDL_SetWindowKeyboardGrab => :int,
      :SDL_SetWindowMouseGrab => :int,
      :SDL_GetWindowGrab => :int,
      :SDL_GetWindowKeyboardGrab => :int,
      :SDL_GetWindowMouseGrab => :int,
      :SDL_GetGrabbedWindow => :pointer,
      :SDL_SetWindowMouseRect => :int,
      :SDL_GetWindowMouseRect => :pointer,
      :SDL_SetWindowOpacity => :int,
      :SDL_GetWindowOpacity => :int,
      :SDL_SetWindowModalFor => :int,
      :SDL_SetWindowInputFocus => :int,
      :SDL_SetWindowFocusable => :int,
      :SDL_ShowWindowSystemMenu => :int,
      :SDL_SetWindowHitTest => :int,
      :SDL_FlashWindow => :int,
      :SDL_DestroyWindow => :void,
      :SDL_ScreenSaverEnabled => :int,
      :SDL_EnableScreenSaver => :int,
      :SDL_DisableScreenSaver => :int,
      :SDL_GL_LoadLibrary => :int,
      :SDL_GL_GetProcAddress => :pointer,
      :SDL_EGL_GetProcAddress => :pointer,
      :SDL_GL_UnloadLibrary => :void,
      :SDL_GL_ExtensionSupported => :int,
      :SDL_GL_ResetAttributes => :void,
      :SDL_GL_SetAttribute => :int,
      :SDL_GL_GetAttribute => :int,
      :SDL_GL_CreateContext => :pointer,
      :SDL_GL_MakeCurrent => :int,
      :SDL_GL_GetCurrentWindow => :pointer,
      :SDL_GL_GetCurrentContext => :pointer,
      :SDL_EGL_GetCurrentEGLDisplay => :pointer,
      :SDL_EGL_GetCurrentEGLConfig => :pointer,
      :SDL_EGL_GetWindowEGLSurface => :pointer,
      :SDL_EGL_SetEGLAttributeCallbacks => :void,
      :SDL_GL_SetSwapInterval => :int,
      :SDL_GL_GetSwapInterval => :int,
      :SDL_GL_SwapWindow => :int,
      :SDL_GL_DeleteContext => :int,
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

