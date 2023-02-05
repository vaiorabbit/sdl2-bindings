import sdl2_parser, sdl2_generator

TYPEDEF_POSTFIX_SYSWM = """
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
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL_syswm.h')
    sdl2_parser.execute(ctx)

    # TODO : generate union automatically
    ctx.decl_structs['SDL_SysWMmsg'] = None
    ctx.decl_structs['SDL_SysWMinfo'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            prefix = sdl2_generator.PREFIX + "require_relative 'sdl2_version'\n",
                            typedef_postfix = TYPEDEF_POSTFIX_SYSWM,
                            setup_method_name = 'syswm')
