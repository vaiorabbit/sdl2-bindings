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

  # Enum


  # Typedef


  RW_SEEK_SET = 0
  RW_SEEK_CUR = 1
  RW_SEEK_END = 2

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
      :SDL_RWFromFP,
      :SDL_RWFromMem,
      :SDL_RWFromConstMem,
      :SDL_AllocRW,
      :SDL_FreeRW,
      :SDL_RWsize,
      :SDL_RWseek,
      :SDL_RWtell,
      :SDL_RWread,
      :SDL_RWwrite,
      :SDL_RWclose,
      :SDL_LoadFile_RW,
      :SDL_LoadFile,
      :SDL_ReadU8,
      :SDL_ReadLE16,
      :SDL_ReadBE16,
      :SDL_ReadLE32,
      :SDL_ReadBE32,
      :SDL_ReadLE64,
      :SDL_ReadBE64,
      :SDL_WriteU8,
      :SDL_WriteLE16,
      :SDL_WriteBE16,
      :SDL_WriteLE32,
      :SDL_WriteBE32,
      :SDL_WriteLE64,
      :SDL_WriteBE64,
    ]
    apis = {
      :SDL_RWFromFile => :RWFromFile,
      :SDL_RWFromFP => :RWFromFP,
      :SDL_RWFromMem => :RWFromMem,
      :SDL_RWFromConstMem => :RWFromConstMem,
      :SDL_AllocRW => :AllocRW,
      :SDL_FreeRW => :FreeRW,
      :SDL_RWsize => :RWsize,
      :SDL_RWseek => :RWseek,
      :SDL_RWtell => :RWtell,
      :SDL_RWread => :RWread,
      :SDL_RWwrite => :RWwrite,
      :SDL_RWclose => :RWclose,
      :SDL_LoadFile_RW => :LoadFile_RW,
      :SDL_LoadFile => :LoadFile,
      :SDL_ReadU8 => :ReadU8,
      :SDL_ReadLE16 => :ReadLE16,
      :SDL_ReadBE16 => :ReadBE16,
      :SDL_ReadLE32 => :ReadLE32,
      :SDL_ReadBE32 => :ReadBE32,
      :SDL_ReadLE64 => :ReadLE64,
      :SDL_ReadBE64 => :ReadBE64,
      :SDL_WriteU8 => :WriteU8,
      :SDL_WriteLE16 => :WriteLE16,
      :SDL_WriteBE16 => :WriteBE16,
      :SDL_WriteLE32 => :WriteLE32,
      :SDL_WriteBE32 => :WriteBE32,
      :SDL_WriteLE64 => :WriteLE64,
      :SDL_WriteBE64 => :WriteBE64,
    }
    args = {
      :SDL_RWFromFile => [:pointer, :pointer],
      :SDL_RWFromFP => [:pointer, :int],
      :SDL_RWFromMem => [:pointer, :int],
      :SDL_RWFromConstMem => [:pointer, :int],
      :SDL_AllocRW => [],
      :SDL_FreeRW => [:pointer],
      :SDL_RWsize => [:pointer],
      :SDL_RWseek => [:pointer, :long_long, :int],
      :SDL_RWtell => [:pointer],
      :SDL_RWread => [:pointer, :pointer, :ulong, :ulong],
      :SDL_RWwrite => [:pointer, :pointer, :ulong, :ulong],
      :SDL_RWclose => [:pointer],
      :SDL_LoadFile_RW => [:pointer, :pointer, :int],
      :SDL_LoadFile => [:pointer, :pointer],
      :SDL_ReadU8 => [:pointer],
      :SDL_ReadLE16 => [:pointer],
      :SDL_ReadBE16 => [:pointer],
      :SDL_ReadLE32 => [:pointer],
      :SDL_ReadBE32 => [:pointer],
      :SDL_ReadLE64 => [:pointer],
      :SDL_ReadBE64 => [:pointer],
      :SDL_WriteU8 => [:pointer, :uchar],
      :SDL_WriteLE16 => [:pointer, :ushort],
      :SDL_WriteBE16 => [:pointer, :ushort],
      :SDL_WriteLE32 => [:pointer, :uint],
      :SDL_WriteBE32 => [:pointer, :uint],
      :SDL_WriteLE64 => [:pointer, :ulong_long],
      :SDL_WriteBE64 => [:pointer, :ulong_long],
    }
    retvals = {
      :SDL_RWFromFile => :pointer,
      :SDL_RWFromFP => :pointer,
      :SDL_RWFromMem => :pointer,
      :SDL_RWFromConstMem => :pointer,
      :SDL_AllocRW => :pointer,
      :SDL_FreeRW => :void,
      :SDL_RWsize => :long_long,
      :SDL_RWseek => :long_long,
      :SDL_RWtell => :long_long,
      :SDL_RWread => :ulong,
      :SDL_RWwrite => :ulong,
      :SDL_RWclose => :int,
      :SDL_LoadFile_RW => :pointer,
      :SDL_LoadFile => :pointer,
      :SDL_ReadU8 => :uchar,
      :SDL_ReadLE16 => :ushort,
      :SDL_ReadBE16 => :ushort,
      :SDL_ReadLE32 => :uint,
      :SDL_ReadBE32 => :uint,
      :SDL_ReadLE64 => :ulong_long,
      :SDL_ReadBE64 => :ulong_long,
      :SDL_WriteU8 => :ulong,
      :SDL_WriteLE16 => :ulong,
      :SDL_WriteBE16 => :ulong,
      :SDL_WriteLE32 => :ulong,
      :SDL_WriteBE32 => :ulong,
      :SDL_WriteLE64 => :ulong,
      :SDL_WriteBE64 => :ulong,
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

