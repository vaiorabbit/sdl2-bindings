# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_version'

module SDL
  extend FFI::Library
  # Define/Macro

  SYSWM_CURRENT_VERSION = 1
  METALVIEW_TAG = 255

  # Enum

  SYSWM_UNKNOWN = 0
  SYSWM_ANDROID = 1
  SYSWM_COCOA = 2
  SYSWM_HAIKU = 3
  SYSWM_KMSDRM = 4
  SYSWM_RISCOS = 5
  SYSWM_UIKIT = 6
  SYSWM_VIVANTE = 7
  SYSWM_WAYLAND = 8
  SYSWM_WINDOWS = 9
  SYSWM_WINRT = 10
  SYSWM_X11 = 11

  # Typedef

  typedef :int, :SDL_SYSWM_TYPE

  class SysWMmsg_def_win < FFI::Struct
    layout(
      :hwnd, :pointer,
      :msg, :uint32,
      :wParam, :uint64,
      :lParam, :int64
    )
  end

  class SysWMmsg_value_win < FFI::Union
    layout(
      :win, SysWMmsg_def_win.by_value,
      :dummy, :int
    )
  end

  class SysWMmsg_win < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :msg, SysWMmsg_value_win.by_value
    )
  end


  class SysWMmsg_def_cocoa < FFI::Struct
    layout(
      :dummy, :int
    )
  end

  class SysWMmsg_value_cocoa < FFI::Union
    layout(
      :cocoa, SysWMmsg_def_cocoa.by_value,
      :dummy, :int
    )
  end

  class SysWMmsg_cocoa < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :msg, SysWMmsg_value_cocoa.by_value
    )
  end


  class SysWMmsg_def_x11 < FFI::Struct
    layout(
      :event, [:long, 24] # /usr/include/X11/Xlib.h
    )
  end

  class SysWMmsg_value_x11 < FFI::Union
    layout(
      :x11, SysWMmsg_def_x11.by_value,
      :dummy, :int
    )
  end

  class SysWMmsg_x11 < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :msg, SysWMmsg_value_x11.by_value
    )
  end

  ################################################################################

  class SysWMinfo_def_win < FFI::Struct
    layout(
      :window, :pointer,
      :hdc, :pointer,
      :hinstance, :pointer
    )
  end

  class SysWMinfo_value_win < FFI::Union
    layout(
      :win, SysWMinfo_def_win.by_value,
      :dummy, [:uint8, 64]
    )
  end

  class SysWMinfo_win < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :info, SysWMinfo_value_win.by_value
    )
  end


  class SysWMinfo_def_cocoa < FFI::Struct
    layout(
      :window, :pointer
    )
  end

  class SysWMinfo_value_cocoa < FFI::Union
    layout(
      :cocoa, SysWMinfo_def_cocoa.by_value,
      :dummy, [:uint8, 64]
    )
  end

  class SysWMinfo_cocoa < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :info, SysWMinfo_value_cocoa.by_value
    )
  end


  class SysWMinfo_def_x11 < FFI::Struct
    layout(
      :display, :pointer,
      :window, :ulong # /usr/include/X11/X.h
    )
  end

  class SysWMinfo_value_x11 < FFI::Union
    layout(
      :x11, SysWMinfo_def_x11.by_value,
      :dummy, [:uint8, 64]
    )
  end

  class SysWMinfo_x11 < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :info, SysWMinfo_value_x11.by_value
    )
  end


  class SysWMinfo_def_wl < FFI::Struct
    layout(
      :display, :pointer,
      :surface, :pointer,
      :shell_surface, :pointer,
      :egl_window, :pointer,
      :xdg_surface, :pointer,
      :xdg_toplevel, :pointer,
      :xdg_popup, :pointer,
      :xdg_positioner, :pointer
    )
  end

  class SysWMinfo_value_wl < FFI::Union
    layout(
      :wl, SysWMinfo_def_wl.by_value,
      :dummy, [:uint8, 64]
    )
  end

  class SysWMinfo_wl < FFI::Struct
    layout(
      :version, Version.by_value,
      :subsystem, :int,
      :info, SysWMinfo_value_wl.by_value
    )
  end


  # Struct


  # Function

  def self.setup_syswm_symbols(output_error = false)
    symbols = [
      :SDL_GetWindowWMInfo,
    ]
    apis = {
      :SDL_GetWindowWMInfo => :GetWindowWMInfo,
    }
    args = {
      :SDL_GetWindowWMInfo => [:pointer, :pointer, :uint],
    }
    retvals = {
      :SDL_GetWindowWMInfo => :int,
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

