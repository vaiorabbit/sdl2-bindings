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
    rwops_symbols = [
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
    rwops_args = {
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
    rwops_retvals = {
      :SDL_RWFromFile => :pointer,
      :SDL_RWFromFP => :pointer,
      :SDL_RWFromMem => :pointer,
      :SDL_RWFromConstMem => :pointer,
      :SDL_AllocRW => :pointer,
      :SDL_FreeRW => :void,
      :SDL_RWsize => :long_long,
      :SDL_RWseek => :long_long,
      :SDL_RWtell => :long_long,
      :SDL_RWread => :size_t,
      :SDL_RWwrite => :size_t,
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
      :SDL_WriteU8 => :size_t,
      :SDL_WriteLE16 => :size_t,
      :SDL_WriteBE16 => :size_t,
      :SDL_WriteLE32 => :size_t,
      :SDL_WriteBE32 => :size_t,
      :SDL_WriteLE64 => :size_t,
      :SDL_WriteBE64 => :size_t,
    }
    rwops_symbols.each do |sym|
      begin
        attach_function sym, rwops_args[sym], rwops_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

