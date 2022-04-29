# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  SOUND_VER_MAJOR = 2
  SOUND_VER_MINOR = 0
  SOUND_VER_PATCH = 1

  # Enum

  SOUND_SAMPLEFLAG_NONE = 0
  SOUND_SAMPLEFLAG_CANSEEK = 1
  SOUND_SAMPLEFLAG_EOF = 536870912
  SOUND_SAMPLEFLAG_ERROR = 1073741824
  SOUND_SAMPLEFLAG_EAGAIN = -2147483648

  # Typedef

  typedef :int, :Sound_SampleFlags

  # Struct

  class Sound_AudioInfo < FFI::Struct
    layout(
      :format, :ushort,
      :channels, :uchar,
      :rate, :uint,
    )
  end

  class Sound_DecoderInfo < FFI::Struct
    layout(
      :extensions, :pointer,
      :description, :pointer,
      :author, :pointer,
      :url, :pointer,
    )
  end

  class Sound_Sample < FFI::Struct
    layout(
      :opaque, :pointer,
      :decoder, :pointer,
      :desired, Sound_AudioInfo,
      :actual, Sound_AudioInfo,
      :buffer, :pointer,
      :buffer_size, :uint,
      :flags, :int,
    )
  end

  class Sound_Version < FFI::Struct
    layout(
      :major, :int,
      :minor, :int,
      :patch, :int,
    )
  end


  # Function

  def self.setup_sound_symbols(output_error = false)
    symbols = [
      :Sound_GetLinkedVersion,
      :Sound_Init,
      :Sound_Quit,
      :Sound_AvailableDecoders,
      :Sound_GetError,
      :Sound_ClearError,
      :Sound_NewSample,
      :Sound_NewSampleFromMem,
      :Sound_NewSampleFromFile,
      :Sound_FreeSample,
      :Sound_GetDuration,
      :Sound_SetBufferSize,
      :Sound_Decode,
      :Sound_DecodeAll,
      :Sound_Rewind,
      :Sound_Seek,
    ]
    apis = {
      :Sound_GetLinkedVersion => :Sound_GetLinkedVersion,
      :Sound_Init => :Sound_Init,
      :Sound_Quit => :Sound_Quit,
      :Sound_AvailableDecoders => :Sound_AvailableDecoders,
      :Sound_GetError => :Sound_GetError,
      :Sound_ClearError => :Sound_ClearError,
      :Sound_NewSample => :Sound_NewSample,
      :Sound_NewSampleFromMem => :Sound_NewSampleFromMem,
      :Sound_NewSampleFromFile => :Sound_NewSampleFromFile,
      :Sound_FreeSample => :Sound_FreeSample,
      :Sound_GetDuration => :Sound_GetDuration,
      :Sound_SetBufferSize => :Sound_SetBufferSize,
      :Sound_Decode => :Sound_Decode,
      :Sound_DecodeAll => :Sound_DecodeAll,
      :Sound_Rewind => :Sound_Rewind,
      :Sound_Seek => :Sound_Seek,
    }
    args = {
      :Sound_GetLinkedVersion => [:pointer],
      :Sound_Init => [],
      :Sound_Quit => [],
      :Sound_AvailableDecoders => [],
      :Sound_GetError => [],
      :Sound_ClearError => [],
      :Sound_NewSample => [:pointer, :pointer, :pointer, :uint],
      :Sound_NewSampleFromMem => [:pointer, :uint, :pointer, :pointer, :uint],
      :Sound_NewSampleFromFile => [:pointer, :pointer, :uint],
      :Sound_FreeSample => [:pointer],
      :Sound_GetDuration => [:pointer],
      :Sound_SetBufferSize => [:pointer, :uint],
      :Sound_Decode => [:pointer],
      :Sound_DecodeAll => [:pointer],
      :Sound_Rewind => [:pointer],
      :Sound_Seek => [:pointer, :uint],
    }
    retvals = {
      :Sound_GetLinkedVersion => :void,
      :Sound_Init => :int,
      :Sound_Quit => :int,
      :Sound_AvailableDecoders => :pointer,
      :Sound_GetError => :pointer,
      :Sound_ClearError => :void,
      :Sound_NewSample => :pointer,
      :Sound_NewSampleFromMem => :pointer,
      :Sound_NewSampleFromFile => :pointer,
      :Sound_FreeSample => :void,
      :Sound_GetDuration => :int,
      :Sound_SetBufferSize => :int,
      :Sound_Decode => :uint,
      :Sound_DecodeAll => :uint,
      :Sound_Rewind => :int,
      :Sound_Seek => :int,
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

