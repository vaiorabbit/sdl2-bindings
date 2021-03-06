import sdl2_parser, sdl2_generator

TYPEDEF_PREFIX_RWOPS = """
  class SDL_RWops_mem < FFI::Struct
    layout(
      :base, :pointer,
      :here, :pointer,
      :stop, :pointer,
    )
  end

  class SDL_RWops_unknown < FFI::Struct
    layout(
      :data1, :pointer,
      :data2, :pointer,
    )
  end
  class SDL_RWops_windowsio_buffer < FFI::Struct
    layout(
      :data, :pointer,
      :size, :size_t,
      :left, :size_t,
    )
  end

  class SDL_RWops_windowsio < FFI::Struct
    layout(
      :append, :int,
      :h, :pointer,
      :buffer, SDL_RWops_windowsio_buffer.by_value,
    )
  end

  class SDL_Default_RWops_hidden < FFI::Union
    layout(
      :mem, SDL_RWops_mem.by_value,
      :unknown, SDL_RWops_unknown.by_value,
    )
  end

  class SDL_Win32_RWops_hidden < FFI::Union
    layout(
      :mem, SDL_RWops_mem.by_value,
      :unknown, SDL_RWops_unknown.by_value,
      :windowsio, SDL_RWops_windowsio.by_value,
    )
  end

  class SDL_Default_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, SDL_Default_RWops_hidden.by_value,
    )
  end

  class SDL_Win32_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, SDL_Win32_RWops_hidden.by_value
    )
  end

  if RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin/
    SDL_RWops = SDL_Win32_RWops
  else
    SDL_RWops = SDL_Default_RWops
  end
"""

if __name__ == "__main__":

    ctx = sdl2_parser.ParseContext('./SDL2/SDL_rwops.h')
    sdl2_parser.execute(ctx)

    # TODO : Merge anonymous structs into one union (e.g. SDL_RWops)
    #
    # SDL_RWops is a bit complicated so I unfortunately have to
    # substitute the parsed definition with my handwritten one.
    ctx.decl_structs['SDL_RWops'] = None

    sdl2_generator.sanitize(ctx)
    sdl2_generator.generate(ctx,
                            typedef_prefix = TYPEDEF_PREFIX_RWOPS,
                            module_name = 'rwops'
    )
