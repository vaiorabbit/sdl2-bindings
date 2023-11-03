# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  RWOPS_UNKNOWN = 0
  RWOPS_WINFILE = 1
  RWOPS_STDFILE = 2
  RWOPS_JNIFILE = 3
  RWOPS_MEMORY = 4
  RWOPS_MEMORY_RO = 5
  RWOPS_STATUS_READY = 0
  RWOPS_STATUS_ERROR = 1
  RWOPS_STATUS_EOF = 2
  RWOPS_STATUS_NOT_READY = 3
  RWOPS_STATUS_READONLY = 4
  RWOPS_STATUS_WRITEONLY = 5
  RW_SEEK_SET = 0
  RW_SEEK_CUR = 1
  RW_SEEK_END = 2

  # Enum


  # Typedef


  class RWops_mem < FFI::Struct
    layout(
      :base, :pointer,
      :here, :pointer,
      :stop, :pointer,
    )
  end

  class RWops_unknown < FFI::Struct
    layout(
      :data1, :pointer,
      :data2, :pointer,
    )
  end
  class RWops_windowsio_buffer < FFI::Struct
    layout(
      :data, :pointer,
      :size, :size_t,
      :left, :size_t,
    )
  end

  class RWops_windowsio < FFI::Struct
    layout(
      :append, :int,
      :h, :pointer,
      :buffer, RWops_windowsio_buffer,
    )
  end

  class Default_RWops_hidden < FFI::Union
    layout(
      :mem, RWops_mem,
      :unknown, RWops_unknown,
    )
  end

  class Win32_RWops_hidden < FFI::Union
    layout(
      :mem, RWops_mem,
      :unknown, RWops_unknown,
      :windowsio, RWops_windowsio,
    )
  end

  class Default_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, Default_RWops_hidden,
    )
  end

  class Win32_RWops < FFI::Struct
    layout(
      :size, :pointer,
      :seek, :pointer,
      :read, :pointer,
      :write, :pointer,
      :close, :pointer,
      :type, :uint,
      :hidden, Win32_RWops_hidden
    )
  end

  if RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin/
    RWops = Win32_RWops
  else
    RWops = Default_RWops
  end


  # Struct


  # Function

  def self.setup_rwops_symbols(output_error = false)
    symbols = [
      :SDL_RWFromFile,
      :SDL_RWFromMem,
      :SDL_RWFromConstMem,
      :SDL_CreateRW,
      :SDL_DestroyRW,
      :SDL_GetRWProperties,
      :SDL_RWsize,
      :SDL_RWseek,
      :SDL_RWtell,
      :SDL_RWread,
      :SDL_RWwrite,
      :SDL_RWclose,
      :SDL_LoadFile_RW,
      :SDL_LoadFile,
      :SDL_ReadU8,
      :SDL_ReadU16LE,
      :SDL_ReadS16LE,
      :SDL_ReadU16BE,
      :SDL_ReadS16BE,
      :SDL_ReadU32LE,
      :SDL_ReadS32LE,
      :SDL_ReadU32BE,
      :SDL_ReadS32BE,
      :SDL_ReadU64LE,
      :SDL_ReadS64LE,
      :SDL_ReadU64BE,
      :SDL_ReadS64BE,
      :SDL_WriteU8,
      :SDL_WriteU16LE,
      :SDL_WriteS16LE,
      :SDL_WriteU16BE,
      :SDL_WriteS16BE,
      :SDL_WriteU32LE,
      :SDL_WriteS32LE,
      :SDL_WriteU32BE,
      :SDL_WriteS32BE,
      :SDL_WriteU64LE,
      :SDL_WriteS64LE,
      :SDL_WriteU64BE,
      :SDL_WriteS64BE,
    ]
    apis = {
      :SDL_RWFromFile => :RWFromFile,
      :SDL_RWFromMem => :RWFromMem,
      :SDL_RWFromConstMem => :RWFromConstMem,
      :SDL_CreateRW => :CreateRW,
      :SDL_DestroyRW => :DestroyRW,
      :SDL_GetRWProperties => :GetRWProperties,
      :SDL_RWsize => :RWsize,
      :SDL_RWseek => :RWseek,
      :SDL_RWtell => :RWtell,
      :SDL_RWread => :RWread,
      :SDL_RWwrite => :RWwrite,
      :SDL_RWclose => :RWclose,
      :SDL_LoadFile_RW => :LoadFile_RW,
      :SDL_LoadFile => :LoadFile,
      :SDL_ReadU8 => :ReadU8,
      :SDL_ReadU16LE => :ReadU16LE,
      :SDL_ReadS16LE => :ReadS16LE,
      :SDL_ReadU16BE => :ReadU16BE,
      :SDL_ReadS16BE => :ReadS16BE,
      :SDL_ReadU32LE => :ReadU32LE,
      :SDL_ReadS32LE => :ReadS32LE,
      :SDL_ReadU32BE => :ReadU32BE,
      :SDL_ReadS32BE => :ReadS32BE,
      :SDL_ReadU64LE => :ReadU64LE,
      :SDL_ReadS64LE => :ReadS64LE,
      :SDL_ReadU64BE => :ReadU64BE,
      :SDL_ReadS64BE => :ReadS64BE,
      :SDL_WriteU8 => :WriteU8,
      :SDL_WriteU16LE => :WriteU16LE,
      :SDL_WriteS16LE => :WriteS16LE,
      :SDL_WriteU16BE => :WriteU16BE,
      :SDL_WriteS16BE => :WriteS16BE,
      :SDL_WriteU32LE => :WriteU32LE,
      :SDL_WriteS32LE => :WriteS32LE,
      :SDL_WriteU32BE => :WriteU32BE,
      :SDL_WriteS32BE => :WriteS32BE,
      :SDL_WriteU64LE => :WriteU64LE,
      :SDL_WriteS64LE => :WriteS64LE,
      :SDL_WriteU64BE => :WriteU64BE,
      :SDL_WriteS64BE => :WriteS64BE,
    }
    args = {
      :SDL_RWFromFile => [:pointer, :pointer],
      :SDL_RWFromMem => [:pointer, :ulong],
      :SDL_RWFromConstMem => [:pointer, :ulong],
      :SDL_CreateRW => [],
      :SDL_DestroyRW => [:pointer],
      :SDL_GetRWProperties => [:pointer],
      :SDL_RWsize => [:pointer],
      :SDL_RWseek => [:pointer, :long_long, :int],
      :SDL_RWtell => [:pointer],
      :SDL_RWread => [:pointer, :pointer, :ulong],
      :SDL_RWwrite => [:pointer, :pointer, :ulong],
      :SDL_RWclose => [:pointer],
      :SDL_LoadFile_RW => [:pointer, :pointer, :int],
      :SDL_LoadFile => [:pointer, :pointer],
      :SDL_ReadU8 => [:pointer, :pointer],
      :SDL_ReadU16LE => [:pointer, :pointer],
      :SDL_ReadS16LE => [:pointer, :pointer],
      :SDL_ReadU16BE => [:pointer, :pointer],
      :SDL_ReadS16BE => [:pointer, :pointer],
      :SDL_ReadU32LE => [:pointer, :pointer],
      :SDL_ReadS32LE => [:pointer, :pointer],
      :SDL_ReadU32BE => [:pointer, :pointer],
      :SDL_ReadS32BE => [:pointer, :pointer],
      :SDL_ReadU64LE => [:pointer, :pointer],
      :SDL_ReadS64LE => [:pointer, :pointer],
      :SDL_ReadU64BE => [:pointer, :pointer],
      :SDL_ReadS64BE => [:pointer, :pointer],
      :SDL_WriteU8 => [:pointer, :uchar],
      :SDL_WriteU16LE => [:pointer, :ushort],
      :SDL_WriteS16LE => [:pointer, :short],
      :SDL_WriteU16BE => [:pointer, :ushort],
      :SDL_WriteS16BE => [:pointer, :short],
      :SDL_WriteU32LE => [:pointer, :uint],
      :SDL_WriteS32LE => [:pointer, :int],
      :SDL_WriteU32BE => [:pointer, :uint],
      :SDL_WriteS32BE => [:pointer, :int],
      :SDL_WriteU64LE => [:pointer, :ulong_long],
      :SDL_WriteS64LE => [:pointer, :long_long],
      :SDL_WriteU64BE => [:pointer, :ulong_long],
      :SDL_WriteS64BE => [:pointer, :long_long],
    }
    retvals = {
      :SDL_RWFromFile => :pointer,
      :SDL_RWFromMem => :pointer,
      :SDL_RWFromConstMem => :pointer,
      :SDL_CreateRW => :pointer,
      :SDL_DestroyRW => :void,
      :SDL_GetRWProperties => :uint,
      :SDL_RWsize => :long_long,
      :SDL_RWseek => :long_long,
      :SDL_RWtell => :long_long,
      :SDL_RWread => :ulong,
      :SDL_RWwrite => :ulong,
      :SDL_RWclose => :int,
      :SDL_LoadFile_RW => :pointer,
      :SDL_LoadFile => :pointer,
      :SDL_ReadU8 => :int,
      :SDL_ReadU16LE => :int,
      :SDL_ReadS16LE => :int,
      :SDL_ReadU16BE => :int,
      :SDL_ReadS16BE => :int,
      :SDL_ReadU32LE => :int,
      :SDL_ReadS32LE => :int,
      :SDL_ReadU32BE => :int,
      :SDL_ReadS32BE => :int,
      :SDL_ReadU64LE => :int,
      :SDL_ReadS64LE => :int,
      :SDL_ReadU64BE => :int,
      :SDL_ReadS64BE => :int,
      :SDL_WriteU8 => :int,
      :SDL_WriteU16LE => :int,
      :SDL_WriteS16LE => :int,
      :SDL_WriteU16BE => :int,
      :SDL_WriteS16BE => :int,
      :SDL_WriteU32LE => :int,
      :SDL_WriteS32LE => :int,
      :SDL_WriteU32BE => :int,
      :SDL_WriteS32BE => :int,
      :SDL_WriteU64LE => :int,
      :SDL_WriteS64LE => :int,
      :SDL_WriteU64BE => :int,
      :SDL_WriteS64BE => :int,
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

