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
    symbols = [
      :SDL_GetNumAudioDrivers,
      :SDL_GetAudioDriver,
      :SDL_AudioInit,
      :SDL_AudioQuit,
      :SDL_GetCurrentAudioDriver,
      :SDL_OpenAudio,
      :SDL_GetNumAudioDevices,
      :SDL_GetAudioDeviceName,
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
    args = {
      :SDL_GetNumAudioDrivers => [],
      :SDL_GetAudioDriver => [:int],
      :SDL_AudioInit => [:pointer],
      :SDL_AudioQuit => [],
      :SDL_GetCurrentAudioDriver => [],
      :SDL_OpenAudio => [:pointer, :pointer],
      :SDL_GetNumAudioDevices => [:int],
      :SDL_GetAudioDeviceName => [:int, :int],
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
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

# TODO : def SDL_LoadWAV

