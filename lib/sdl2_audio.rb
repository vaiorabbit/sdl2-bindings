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
  AUDIO_MASK_DATATYPE = 1 << 8
  AUDIO_MASK_ENDIAN = 1 << 12
  AUDIO_MASK_SIGNED = 1 << 15
  AUDIO_U8 = 0x0008
  AUDIO_S8 = 0x8008
  AUDIO_S16LSB = 0x8010
  AUDIO_S16MSB = 0x9010
  AUDIO_S16 = AUDIO_S16LSB
  AUDIO_S32LSB = 0x8020
  AUDIO_S32MSB = 0x9020
  AUDIO_S32 = AUDIO_S32LSB
  AUDIO_F32LSB = 0x8120
  AUDIO_F32MSB = 0x9120
  AUDIO_F32 = AUDIO_F32LSB
  AUDIO_S16SYS = AUDIO_S16LSB
  AUDIO_S32SYS = AUDIO_S32LSB
  AUDIO_F32SYS = AUDIO_F32LSB
  AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
  AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002
  AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004
  AUDIO_ALLOW_SAMPLES_CHANGE = 0x00000008
  MIX_MAXVOLUME = 128

  # Enum

  AUDIO_STOPPED = 0
  AUDIO_PLAYING = 1
  AUDIO_PAUSED = 2

  # Typedef

  typedef :ushort, :SDL_AudioFormat
  callback :SDL_AudioCallback, [:pointer, :pointer, :int], :void
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


  # Function

  def self.setup_audio_symbols(output_error = false)
    symbols = [
      :SDL_GetNumAudioDrivers,
      :SDL_GetAudioDriver,
      :SDL_GetCurrentAudioDriver,
      :SDL_GetNumAudioDevices,
      :SDL_GetAudioDeviceName,
      :SDL_GetAudioDeviceSpec,
      :SDL_GetDefaultAudioInfo,
      :SDL_OpenAudioDevice,
      :SDL_GetAudioDeviceStatus,
      :SDL_PlayAudioDevice,
      :SDL_PauseAudioDevice,
      :SDL_LoadWAV_RW,
      :SDL_CreateAudioStream,
      :SDL_PutAudioStreamData,
      :SDL_GetAudioStreamData,
      :SDL_GetAudioStreamAvailable,
      :SDL_FlushAudioStream,
      :SDL_ClearAudioStream,
      :SDL_DestroyAudioStream,
      :SDL_MixAudioFormat,
      :SDL_QueueAudio,
      :SDL_DequeueAudio,
      :SDL_GetQueuedAudioSize,
      :SDL_ClearQueuedAudio,
      :SDL_LockAudioDevice,
      :SDL_UnlockAudioDevice,
      :SDL_CloseAudioDevice,
      :SDL_ConvertAudioSamples,
    ]
    apis = {
      :SDL_GetNumAudioDrivers => :GetNumAudioDrivers,
      :SDL_GetAudioDriver => :GetAudioDriver,
      :SDL_GetCurrentAudioDriver => :GetCurrentAudioDriver,
      :SDL_GetNumAudioDevices => :GetNumAudioDevices,
      :SDL_GetAudioDeviceName => :GetAudioDeviceName,
      :SDL_GetAudioDeviceSpec => :GetAudioDeviceSpec,
      :SDL_GetDefaultAudioInfo => :GetDefaultAudioInfo,
      :SDL_OpenAudioDevice => :OpenAudioDevice,
      :SDL_GetAudioDeviceStatus => :GetAudioDeviceStatus,
      :SDL_PlayAudioDevice => :PlayAudioDevice,
      :SDL_PauseAudioDevice => :PauseAudioDevice,
      :SDL_LoadWAV_RW => :LoadWAV_RW,
      :SDL_CreateAudioStream => :CreateAudioStream,
      :SDL_PutAudioStreamData => :PutAudioStreamData,
      :SDL_GetAudioStreamData => :GetAudioStreamData,
      :SDL_GetAudioStreamAvailable => :GetAudioStreamAvailable,
      :SDL_FlushAudioStream => :FlushAudioStream,
      :SDL_ClearAudioStream => :ClearAudioStream,
      :SDL_DestroyAudioStream => :DestroyAudioStream,
      :SDL_MixAudioFormat => :MixAudioFormat,
      :SDL_QueueAudio => :QueueAudio,
      :SDL_DequeueAudio => :DequeueAudio,
      :SDL_GetQueuedAudioSize => :GetQueuedAudioSize,
      :SDL_ClearQueuedAudio => :ClearQueuedAudio,
      :SDL_LockAudioDevice => :LockAudioDevice,
      :SDL_UnlockAudioDevice => :UnlockAudioDevice,
      :SDL_CloseAudioDevice => :CloseAudioDevice,
      :SDL_ConvertAudioSamples => :ConvertAudioSamples,
    }
    args = {
      :SDL_GetNumAudioDrivers => [],
      :SDL_GetAudioDriver => [:int],
      :SDL_GetCurrentAudioDriver => [],
      :SDL_GetNumAudioDevices => [:int],
      :SDL_GetAudioDeviceName => [:int, :int],
      :SDL_GetAudioDeviceSpec => [:int, :int, :pointer],
      :SDL_GetDefaultAudioInfo => [:pointer, :pointer, :int],
      :SDL_OpenAudioDevice => [:pointer, :int, :pointer, :pointer, :int],
      :SDL_GetAudioDeviceStatus => [:uint],
      :SDL_PlayAudioDevice => [:uint],
      :SDL_PauseAudioDevice => [:uint],
      :SDL_LoadWAV_RW => [:pointer, :int, :pointer, :pointer, :pointer],
      :SDL_CreateAudioStream => [:ushort, :uchar, :int, :ushort, :uchar, :int],
      :SDL_PutAudioStreamData => [:pointer, :pointer, :int],
      :SDL_GetAudioStreamData => [:pointer, :pointer, :int],
      :SDL_GetAudioStreamAvailable => [:pointer],
      :SDL_FlushAudioStream => [:pointer],
      :SDL_ClearAudioStream => [:pointer],
      :SDL_DestroyAudioStream => [:pointer],
      :SDL_MixAudioFormat => [:pointer, :pointer, :ushort, :uint, :int],
      :SDL_QueueAudio => [:uint, :pointer, :uint],
      :SDL_DequeueAudio => [:uint, :pointer, :uint],
      :SDL_GetQueuedAudioSize => [:uint],
      :SDL_ClearQueuedAudio => [:uint],
      :SDL_LockAudioDevice => [:uint],
      :SDL_UnlockAudioDevice => [:uint],
      :SDL_CloseAudioDevice => [:uint],
      :SDL_ConvertAudioSamples => [:ushort, :uchar, :int, :pointer, :int, :ushort, :uchar, :int, :pointer, :pointer],
    }
    retvals = {
      :SDL_GetNumAudioDrivers => :int,
      :SDL_GetAudioDriver => :pointer,
      :SDL_GetCurrentAudioDriver => :pointer,
      :SDL_GetNumAudioDevices => :int,
      :SDL_GetAudioDeviceName => :pointer,
      :SDL_GetAudioDeviceSpec => :int,
      :SDL_GetDefaultAudioInfo => :int,
      :SDL_OpenAudioDevice => :uint,
      :SDL_GetAudioDeviceStatus => :int,
      :SDL_PlayAudioDevice => :int,
      :SDL_PauseAudioDevice => :int,
      :SDL_LoadWAV_RW => :pointer,
      :SDL_CreateAudioStream => :pointer,
      :SDL_PutAudioStreamData => :int,
      :SDL_GetAudioStreamData => :int,
      :SDL_GetAudioStreamAvailable => :int,
      :SDL_FlushAudioStream => :int,
      :SDL_ClearAudioStream => :int,
      :SDL_DestroyAudioStream => :void,
      :SDL_MixAudioFormat => :int,
      :SDL_QueueAudio => :int,
      :SDL_DequeueAudio => :uint,
      :SDL_GetQueuedAudioSize => :uint,
      :SDL_ClearQueuedAudio => :int,
      :SDL_LockAudioDevice => :int,
      :SDL_UnlockAudioDevice => :void,
      :SDL_CloseAudioDevice => :void,
      :SDL_ConvertAudioSamples => :int,
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

# TODO : def SDL_LoadWAV

