# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_version'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_METALVIEW_TAG = 255

  # Enum

  SDL_SYSWM_UNKNOWN = 0
  SDL_SYSWM_WINDOWS = 1
  SDL_SYSWM_X11 = 2
  SDL_SYSWM_DIRECTFB = 3
  SDL_SYSWM_COCOA = 4
  SDL_SYSWM_UIKIT = 5
  SDL_SYSWM_WAYLAND = 6
  SDL_SYSWM_MIR = 7
  SDL_SYSWM_WINRT = 8
  SDL_SYSWM_ANDROID = 9
  SDL_SYSWM_VIVANTE = 10
  SDL_SYSWM_OS2 = 11
  SDL_SYSWM_HAIKU = 12
  SDL_SYSWM_KMSDRM = 13
  SDL_SYSWM_RISCOS = 14

  # Typedef

  typedef :int, :SDL_SYSWM_TYPE

  class SDL_SysWMmsg_def_win < FFI::Struct
    layout(
        :hwnd, :pointer,
        :msg, :uint32,
        :wParam, :uint64,
        :lParam, :int64
    )
  end

  class SDL_SysWMmsg_value_win < FFI::Union
    layout(
        :win, SDL_SysWMmsg_def_win.by_value,
        :dummy, :int
    )
  end

  class SDL_SysWMmsg_win < FFI::Struct
    layout(
        :version, SDL_version.by_value,
        :subsystem, :int,
        :msg, SDL_SysWMmsg_value_win.by_value
    )
  end


  class SDL_SysWMmsg_def_cocoa < FFI::Struct
    layout(
        :dummy, :int
    )
  end

  class SDL_SysWMmsg_value_cocoa < FFI::Union
    layout(
        :cocoa, SDL_SysWMmsg_def_cocoa.by_value,
        :dummy, :int
    )
  end

  class SDL_SysWMmsg_cocoa < FFI::Struct
    layout(
        :version, SDL_version.by_value,
        :subsystem, :int,
        :msg, SDL_SysWMmsg_value_cocoa.by_value
    )
  end

  ################################################################################

  class SDL_SysWMinfo_def_win < FFI::Struct
    layout(
        :window, :pointer,
        :hdc, :pointer,
        :hinstance, :pointer
    )
  end

  class SDL_SysWMinfo_value_win < FFI::Union
    layout(
        :win, SDL_SysWMinfo_def_win.by_value,
        :dummy, [:uint8, 64]
    )
  end

  class SDL_SysWMinfo_win < FFI::Struct
    layout(
        :version, SDL_version.by_value,
        :subsystem, :int,
        :info, SDL_SysWMinfo_value_win.by_value
    )
  end


  class SDL_SysWMinfo_def_cocoa < FFI::Struct
    layout(
        :window, :pointer
    )
  end

  class SDL_SysWMinfo_value_cocoa < FFI::Union
    layout(
        :cocoa, SDL_SysWMinfo_def_cocoa.by_value,
        :dummy, [:uint8, 64]
    )
  end

  class SDL_SysWMinfo_cocoa < FFI::Struct
    layout(
        :version, SDL_version.by_value,
        :subsystem, :int,
        :info, SDL_SysWMinfo_value_cocoa.by_value
    )
  end


  # Struct


  # Function

  def self.setup_syswm_symbols()
    symbols = [
      :SDL_GetWindowWMInfo,
    ]
    args = {
      :SDL_GetWindowWMInfo => [:pointer, :pointer],
    }
    retvals = {
      :SDL_GetWindowWMInfo => :int,
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

