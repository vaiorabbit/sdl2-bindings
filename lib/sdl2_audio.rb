# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  AUDIO_MASK_BITSIZE = 0xFF
  AUDIO_MASK_DATATYPE = (1 << 8)
  AUDIO_MASK_ENDIAN = (1 << 12)
  AUDIO_MASK_SIGNED = (1 << 15)
  AUDIO_U8 = 0x0008
  AUDIO_S8 = 0x8008
  AUDIO_U16LSB = 0x0010
  AUDIO_S16LSB = 0x8010
  AUDIO_U16MSB = 0x1010
  AUDIO_S16MSB = 0x9010
  AUDIO_U16 = AUDIO_U16LSB
  AUDIO_S16 = AUDIO_S16LSB
  AUDIO_S32LSB = 0x8020
  AUDIO_S32MSB = 0x9020
  AUDIO_S32 = AUDIO_S32LSB
  AUDIO_F32LSB = 0x8120
  AUDIO_F32MSB = 0x9120
  AUDIO_F32 = AUDIO_F32LSB
  AUDIO_U16SYS = AUDIO_U16LSB
  AUDIO_S16SYS = AUDIO_S16LSB
  AUDIO_S32SYS = AUDIO_S32LSB
  AUDIO_F32SYS = AUDIO_F32LSB
  AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
  AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002
  AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004
  AUDIO_ALLOW_SAMPLES_CHANGE = 0x00000008
  AUDIO_ALLOW_ANY_CHANGE = (AUDIO_ALLOW_FREQUENCY_CHANGE | AUDIO_ALLOW_FORMAT_CHANGE | AUDIO_ALLOW_CHANNELS_CHANGE | AUDIO_ALLOW_SAMPLES_CHANGE)
  AUDIOCVT_MAX_FILTERS = 9
  MIX_MAXVOLUME = 128

  # Enum

  AUDIO_STOPPED = 0
  AUDIO_PLAYING = 1
  AUDIO_PAUSED = 2

  # Typedef

  typedef :ushort, :SDL_AudioFormat
  callback :SDL_AudioCallback, [:pointer, :pointer, :int], :void
  callback :SDL_AudioFilter, [:pointer, :ushort], :void
  typedef :uint, :SDL_AudioDeviceID
  typedef :int, :SDL_AudioStatus

  # Struct

  class AudioSpec < FFI::Struct
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

  class AudioCVT < FFI::Struct
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
    symbols = [
      :SDL_GetNumAudioDrivers,
      :SDL_GetAudioDriver,
      :SDL_AudioInit,
      :SDL_AudioQuit,
      :SDL_GetCurrentAudioDriver,
      :SDL_OpenAudio,
      :SDL_GetNumAudioDevices,
      :SDL_GetAudioDeviceName,
      :SDL_GetAudioDeviceSpec,
      :SDL_OpenAudioDevice,
      :SDL_GetAudioStatus,
      :SDL_GetAudioDeviceStatus,
      :SDL_PauseAudio,
      :SDL_PauseAudioDevice,
      :SDL_LoadWAV_RW,
      :SDL_FreeWAV,
      :SDL_BuildAudioCVT,
      :SDL_ConvertAudio,
      :SDL_NewAudioStream,
      :SDL_AudioStreamPut,
      :SDL_AudioStreamGet,
      :SDL_AudioStreamAvailable,
      :SDL_AudioStreamFlush,
      :SDL_AudioStreamClear,
      :SDL_FreeAudioStream,
      :SDL_MixAudio,
      :SDL_MixAudioFormat,
      :SDL_QueueAudio,
      :SDL_DequeueAudio,
      :SDL_GetQueuedAudioSize,
      :SDL_ClearQueuedAudio,
      :SDL_LockAudio,
      :SDL_LockAudioDevice,
      :SDL_UnlockAudio,
      :SDL_UnlockAudioDevice,
      :SDL_CloseAudio,
      :SDL_CloseAudioDevice,
    ]
    apis = {
      :SDL_GetNumAudioDrivers => :GetNumAudioDrivers,
      :SDL_GetAudioDriver => :GetAudioDriver,
      :SDL_AudioInit => :AudioInit,
      :SDL_AudioQuit => :AudioQuit,
      :SDL_GetCurrentAudioDriver => :GetCurrentAudioDriver,
      :SDL_OpenAudio => :OpenAudio,
      :SDL_GetNumAudioDevices => :GetNumAudioDevices,
      :SDL_GetAudioDeviceName => :GetAudioDeviceName,
      :SDL_GetAudioDeviceSpec => :GetAudioDeviceSpec,
      :SDL_OpenAudioDevice => :OpenAudioDevice,
      :SDL_GetAudioStatus => :GetAudioStatus,
      :SDL_GetAudioDeviceStatus => :GetAudioDeviceStatus,
      :SDL_PauseAudio => :PauseAudio,
      :SDL_PauseAudioDevice => :PauseAudioDevice,
      :SDL_LoadWAV_RW => :LoadWAV_RW,
      :SDL_FreeWAV => :FreeWAV,
      :SDL_BuildAudioCVT => :BuildAudioCVT,
      :SDL_ConvertAudio => :ConvertAudio,
      :SDL_NewAudioStream => :NewAudioStream,
      :SDL_AudioStreamPut => :AudioStreamPut,
      :SDL_AudioStreamGet => :AudioStreamGet,
      :SDL_AudioStreamAvailable => :AudioStreamAvailable,
      :SDL_AudioStreamFlush => :AudioStreamFlush,
      :SDL_AudioStreamClear => :AudioStreamClear,
      :SDL_FreeAudioStream => :FreeAudioStream,
      :SDL_MixAudio => :MixAudio,
      :SDL_MixAudioFormat => :MixAudioFormat,
      :SDL_QueueAudio => :QueueAudio,
      :SDL_DequeueAudio => :DequeueAudio,
      :SDL_GetQueuedAudioSize => :GetQueuedAudioSize,
      :SDL_ClearQueuedAudio => :ClearQueuedAudio,
      :SDL_LockAudio => :LockAudio,
      :SDL_LockAudioDevice => :LockAudioDevice,
      :SDL_UnlockAudio => :UnlockAudio,
      :SDL_UnlockAudioDevice => :UnlockAudioDevice,
      :SDL_CloseAudio => :CloseAudio,
      :SDL_CloseAudioDevice => :CloseAudioDevice,
    }
    args = {
      :SDL_GetNumAudioDrivers => [],
      :SDL_GetAudioDriver => [:int],
      :SDL_AudioInit => [:pointer],
      :SDL_AudioQuit => [],
      :SDL_GetCurrentAudioDriver => [],
      :SDL_OpenAudio => [:pointer, :pointer],
      :SDL_GetNumAudioDevices => [:int],
      :SDL_GetAudioDeviceName => [:int, :int],
      :SDL_GetAudioDeviceSpec => [:int, :int, :pointer],
      :SDL_OpenAudioDevice => [:pointer, :int, :pointer, :pointer, :int],
      :SDL_GetAudioStatus => [],
      :SDL_GetAudioDeviceStatus => [:uint],
      :SDL_PauseAudio => [:int],
      :SDL_PauseAudioDevice => [:uint, :int],
      :SDL_LoadWAV_RW => [:pointer, :int, :pointer, :pointer, :pointer],
      :SDL_FreeWAV => [:pointer],
      :SDL_BuildAudioCVT => [:pointer, :ushort, :uchar, :int, :ushort, :uchar, :int],
      :SDL_ConvertAudio => [:pointer],
      :SDL_NewAudioStream => [:ushort, :uchar, :int, :ushort, :uchar, :int],
      :SDL_AudioStreamPut => [:pointer, :pointer, :int],
      :SDL_AudioStreamGet => [:pointer, :pointer, :int],
      :SDL_AudioStreamAvailable => [:pointer],
      :SDL_AudioStreamFlush => [:pointer],
      :SDL_AudioStreamClear => [:pointer],
      :SDL_FreeAudioStream => [:pointer],
      :SDL_MixAudio => [:pointer, :pointer, :uint, :int],
      :SDL_MixAudioFormat => [:pointer, :pointer, :ushort, :uint, :int],
      :SDL_QueueAudio => [:uint, :pointer, :uint],
      :SDL_DequeueAudio => [:uint, :pointer, :uint],
      :SDL_GetQueuedAudioSize => [:uint],
      :SDL_ClearQueuedAudio => [:uint],
      :SDL_LockAudio => [],
      :SDL_LockAudioDevice => [:uint],
      :SDL_UnlockAudio => [],
      :SDL_UnlockAudioDevice => [:uint],
      :SDL_CloseAudio => [],
      :SDL_CloseAudioDevice => [:uint],
    }
    retvals = {
      :SDL_GetNumAudioDrivers => :int,
      :SDL_GetAudioDriver => :pointer,
      :SDL_AudioInit => :int,
      :SDL_AudioQuit => :void,
      :SDL_GetCurrentAudioDriver => :pointer,
      :SDL_OpenAudio => :int,
      :SDL_GetNumAudioDevices => :int,
      :SDL_GetAudioDeviceName => :pointer,
      :SDL_GetAudioDeviceSpec => :int,
      :SDL_OpenAudioDevice => :uint,
      :SDL_GetAudioStatus => :int,
      :SDL_GetAudioDeviceStatus => :int,
      :SDL_PauseAudio => :void,
      :SDL_PauseAudioDevice => :void,
      :SDL_LoadWAV_RW => :pointer,
      :SDL_FreeWAV => :void,
      :SDL_BuildAudioCVT => :int,
      :SDL_ConvertAudio => :int,
      :SDL_NewAudioStream => :pointer,
      :SDL_AudioStreamPut => :int,
      :SDL_AudioStreamGet => :int,
      :SDL_AudioStreamAvailable => :int,
      :SDL_AudioStreamFlush => :int,
      :SDL_AudioStreamClear => :void,
      :SDL_FreeAudioStream => :void,
      :SDL_MixAudio => :void,
      :SDL_MixAudioFormat => :void,
      :SDL_QueueAudio => :int,
      :SDL_DequeueAudio => :uint,
      :SDL_GetQueuedAudioSize => :uint,
      :SDL_ClearQueuedAudio => :void,
      :SDL_LockAudio => :void,
      :SDL_LockAudioDevice => :void,
      :SDL_UnlockAudio => :void,
      :SDL_UnlockAudioDevice => :void,
      :SDL_CloseAudio => :void,
      :SDL_CloseAudioDevice => :void,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

# TODO : def SDL_LoadWAV

