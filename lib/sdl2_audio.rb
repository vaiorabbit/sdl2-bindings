# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_AUDIO_MASK_BITSIZE = ( 0xFF )
  SDL_AUDIO_MASK_DATATYPE = ( 1 << 8 )
  SDL_AUDIO_MASK_ENDIAN = ( 1 << 12 )
  SDL_AUDIO_MASK_SIGNED = ( 1 << 15 )
  SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
  SDL_AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002
  SDL_AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004
  SDL_AUDIO_ALLOW_SAMPLES_CHANGE = 0x00000008
  SDL_AUDIO_ALLOW_ANY_CHANGE = ( SDL_AUDIO_ALLOW_FREQUENCY_CHANGE | SDL_AUDIO_ALLOW_FORMAT_CHANGE | SDL_AUDIO_ALLOW_CHANNELS_CHANGE | SDL_AUDIO_ALLOW_SAMPLES_CHANGE )
  SDL_AUDIOCVT_MAX_FILTERS = 9
  SDL_MIX_MAXVOLUME = 128

  # Enum

  SDL_AUDIO_STOPPED = 0
  SDL_AUDIO_PLAYING = 1
  SDL_AUDIO_PAUSED = 2

  # Typedef

  typedef :ushort, :SDL_AudioFormat
  callback :SDL_AudioCallback, [:pointer, :pointer, :int], :void
  callback :SDL_AudioFilter, [:pointer, :ushort], :void
  typedef :uint, :SDL_AudioDeviceID
  typedef :int, :SDL_AudioStatus

  # Struct

  class SDL_AudioSpec < FFI::Struct
    layout(
      :freq, :int,
      :format, :ushort,
      :channels, :uchar,
      :silence, :uchar,
      :samples, :ushort,
      :padding, :ushort,
      :size, :uint,
      :callback, :pointer,
      :userdata, :pointer,
    )
  end

  class SDL_AudioCVT < FFI::Struct
    layout(
      :needed, :int,
      :src_format, :ushort,
      :dst_format, :ushort,
      :rate_incr, :double,
      :buf, :pointer,
      :len, :int,
      :len_cvt, :int,
      :len_mult, :int,
      :len_ratio, :double,
      :filters, [:pointer, 10],
      :filter_index, :int,
    )
  end


  # Function

  def self.setup_audio_symbols()
      attach_function :SDL_GetNumAudioDrivers, [], :int
      attach_function :SDL_GetAudioDriver, [:int], :pointer
      attach_function :SDL_AudioInit, [:pointer], :int
      attach_function :SDL_AudioQuit, [], :void
      attach_function :SDL_GetCurrentAudioDriver, [], :pointer
      attach_function :SDL_OpenAudio, [:pointer, :pointer], :int
      attach_function :SDL_GetNumAudioDevices, [:int], :int
      attach_function :SDL_GetAudioDeviceName, [:int, :int], :pointer
      attach_function :SDL_OpenAudioDevice, [:pointer, :int, :pointer, :pointer, :int], :uint
      attach_function :SDL_GetAudioStatus, [], :int
      attach_function :SDL_GetAudioDeviceStatus, [:uint], :int
      attach_function :SDL_PauseAudio, [:int], :void
      attach_function :SDL_PauseAudioDevice, [:uint, :int], :void
      attach_function :SDL_LoadWAV_RW, [:pointer, :int, :pointer, :pointer, :pointer], :pointer
      attach_function :SDL_FreeWAV, [:pointer], :void
      attach_function :SDL_BuildAudioCVT, [:pointer, :ushort, :uchar, :int, :ushort, :uchar, :int], :int
      attach_function :SDL_ConvertAudio, [:pointer], :int
      attach_function :SDL_NewAudioStream, [:ushort, :uchar, :int, :ushort, :uchar, :int], :pointer
      attach_function :SDL_AudioStreamPut, [:pointer, :pointer, :int], :int
      attach_function :SDL_AudioStreamGet, [:pointer, :pointer, :int], :int
      attach_function :SDL_AudioStreamAvailable, [:pointer], :int
      attach_function :SDL_AudioStreamFlush, [:pointer], :int
      attach_function :SDL_AudioStreamClear, [:pointer], :void
      attach_function :SDL_FreeAudioStream, [:pointer], :void
      attach_function :SDL_MixAudio, [:pointer, :pointer, :uint, :int], :void
      attach_function :SDL_MixAudioFormat, [:pointer, :pointer, :ushort, :uint, :int], :void
      attach_function :SDL_QueueAudio, [:uint, :pointer, :uint], :int
      attach_function :SDL_DequeueAudio, [:uint, :pointer, :uint], :uint
      attach_function :SDL_GetQueuedAudioSize, [:uint], :uint
      attach_function :SDL_ClearQueuedAudio, [:uint], :void
      attach_function :SDL_LockAudio, [], :void
      attach_function :SDL_LockAudioDevice, [:uint], :void
      attach_function :SDL_UnlockAudio, [], :void
      attach_function :SDL_UnlockAudioDevice, [:uint], :void
      attach_function :SDL_CloseAudio, [], :void
      attach_function :SDL_CloseAudioDevice, [:uint], :void
  end

end

# TODO : def SDL_LoadWAV

