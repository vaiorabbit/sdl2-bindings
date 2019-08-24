# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_RWOPS_UNKNOWN = 0
  SDL_RWOPS_WINFILE = 1
  SDL_RWOPS_STDFILE = 2
  SDL_RWOPS_JNIFILE = 3
  SDL_RWOPS_MEMORY = 4
  SDL_RWOPS_MEMORY_RO = 5

  # Enum


  # Typedef


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


  # Struct


  # Function

  def self.setup_rwops_symbols()
      attach_function :SDL_RWFromFile, [:pointer, :pointer], :pointer
      attach_function :SDL_RWFromFP, [:pointer, :int], :pointer
      attach_function :SDL_RWFromMem, [:pointer, :int], :pointer
      attach_function :SDL_RWFromConstMem, [:pointer, :int], :pointer
      attach_function :SDL_AllocRW, [], :pointer
      attach_function :SDL_FreeRW, [:pointer], :void
      attach_function :SDL_RWsize, [:pointer], :long_long
      attach_function :SDL_RWseek, [:pointer, :long_long, :int], :long_long
      attach_function :SDL_RWtell, [:pointer], :long_long
      attach_function :SDL_RWread, [:pointer, :pointer, :ulong, :ulong], :size_t
      attach_function :SDL_RWwrite, [:pointer, :pointer, :ulong, :ulong], :size_t
      attach_function :SDL_RWclose, [:pointer], :int
      attach_function :SDL_LoadFile_RW, [:pointer, :pointer, :int], :pointer
      attach_function :SDL_LoadFile, [:pointer, :pointer], :pointer
      attach_function :SDL_ReadU8, [:pointer], :uchar
      attach_function :SDL_ReadLE16, [:pointer], :ushort
      attach_function :SDL_ReadBE16, [:pointer], :ushort
      attach_function :SDL_ReadLE32, [:pointer], :uint
      attach_function :SDL_ReadBE32, [:pointer], :uint
      attach_function :SDL_ReadLE64, [:pointer], :ulong_long
      attach_function :SDL_ReadBE64, [:pointer], :ulong_long
      attach_function :SDL_WriteU8, [:pointer, :uchar], :size_t
      attach_function :SDL_WriteLE16, [:pointer, :ushort], :size_t
      attach_function :SDL_WriteBE16, [:pointer, :ushort], :size_t
      attach_function :SDL_WriteLE32, [:pointer, :uint], :size_t
      attach_function :SDL_WriteBE32, [:pointer, :uint], :size_t
      attach_function :SDL_WriteLE64, [:pointer, :ulong_long], :size_t
      attach_function :SDL_WriteBE64, [:pointer, :ulong_long], :size_t
  end

end

