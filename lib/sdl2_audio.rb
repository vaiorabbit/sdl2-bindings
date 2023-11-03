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
  AUDIO_MASK_SIGNED = 1 << 15
  AUDIO_U8 = 0x0008
  AUDIO_S8 = 0x8008
  AUDIO_S16LE = 0x8010
  AUDIO_S16BE = 0x9010
  AUDIO_S32LE = 0x8020
  AUDIO_S32BE = 0x9020
  AUDIO_F32LE = 0x8120
  AUDIO_F32BE = 0x9120
  AUDIO_S16 = AUDIO_S16LE
  AUDIO_S32 = AUDIO_S32LE
  AUDIO_F32 = AUDIO_F32LE
  MIX_MAXVOLUME = 128

  # Enum


  # Typedef

  typedef :ushort, :SDL_AudioFormat
  typedef :uint, :SDL_AudioDeviceID
  callback :SDL_AudioStreamCallback, [:pointer, :pointer, :int, :int], :void
  callback :SDL_AudioPostmixCallback, [:pointer, :pointer, :pointer, :int], :void

  # Struct

  class AudioSpec < FFI::Struct
    layout(
      :format, :ushort,
      :channels, :int,
      :freq, :int,
    )
  end


  # Function

  def self.setup_audio_symbols(output_error = false)
    symbols = [
      :SDL_GetNumAudioDrivers,
      :SDL_GetAudioDriver,
      :SDL_GetCurrentAudioDriver,
      :SDL_GetAudioOutputDevices,
      :SDL_GetAudioCaptureDevices,
      :SDL_GetAudioDeviceName,
      :SDL_GetAudioDeviceFormat,
      :SDL_OpenAudioDevice,
      :SDL_PauseAudioDevice,
      :SDL_ResumeAudioDevice,
      :SDL_AudioDevicePaused,
      :SDL_CloseAudioDevice,
      :SDL_BindAudioStreams,
      :SDL_BindAudioStream,
      :SDL_UnbindAudioStreams,
      :SDL_UnbindAudioStream,
      :SDL_GetAudioStreamDevice,
      :SDL_CreateAudioStream,
      :SDL_GetAudioStreamProperties,
      :SDL_GetAudioStreamFormat,
      :SDL_SetAudioStreamFormat,
      :SDL_GetAudioStreamFrequencyRatio,
      :SDL_SetAudioStreamFrequencyRatio,
      :SDL_PutAudioStreamData,
      :SDL_GetAudioStreamData,
      :SDL_GetAudioStreamAvailable,
      :SDL_GetAudioStreamQueued,
      :SDL_FlushAudioStream,
      :SDL_ClearAudioStream,
      :SDL_LockAudioStream,
      :SDL_UnlockAudioStream,
      :SDL_SetAudioStreamGetCallback,
      :SDL_SetAudioStreamPutCallback,
      :SDL_DestroyAudioStream,
      :SDL_OpenAudioDeviceStream,
      :SDL_SetAudioPostmixCallback,
      :SDL_LoadWAV_RW,
      :SDL_LoadWAV,
      :SDL_MixAudioFormat,
      :SDL_ConvertAudioSamples,
      :SDL_GetSilenceValueForFormat,
    ]
    apis = {
      :SDL_GetNumAudioDrivers => :GetNumAudioDrivers,
      :SDL_GetAudioDriver => :GetAudioDriver,
      :SDL_GetCurrentAudioDriver => :GetCurrentAudioDriver,
      :SDL_GetAudioOutputDevices => :GetAudioOutputDevices,
      :SDL_GetAudioCaptureDevices => :GetAudioCaptureDevices,
      :SDL_GetAudioDeviceName => :GetAudioDeviceName,
      :SDL_GetAudioDeviceFormat => :GetAudioDeviceFormat,
      :SDL_OpenAudioDevice => :OpenAudioDevice,
      :SDL_PauseAudioDevice => :PauseAudioDevice,
      :SDL_ResumeAudioDevice => :ResumeAudioDevice,
      :SDL_AudioDevicePaused => :AudioDevicePaused,
      :SDL_CloseAudioDevice => :CloseAudioDevice,
      :SDL_BindAudioStreams => :BindAudioStreams,
      :SDL_BindAudioStream => :BindAudioStream,
      :SDL_UnbindAudioStreams => :UnbindAudioStreams,
      :SDL_UnbindAudioStream => :UnbindAudioStream,
      :SDL_GetAudioStreamDevice => :GetAudioStreamDevice,
      :SDL_CreateAudioStream => :CreateAudioStream,
      :SDL_GetAudioStreamProperties => :GetAudioStreamProperties,
      :SDL_GetAudioStreamFormat => :GetAudioStreamFormat,
      :SDL_SetAudioStreamFormat => :SetAudioStreamFormat,
      :SDL_GetAudioStreamFrequencyRatio => :GetAudioStreamFrequencyRatio,
      :SDL_SetAudioStreamFrequencyRatio => :SetAudioStreamFrequencyRatio,
      :SDL_PutAudioStreamData => :PutAudioStreamData,
      :SDL_GetAudioStreamData => :GetAudioStreamData,
      :SDL_GetAudioStreamAvailable => :GetAudioStreamAvailable,
      :SDL_GetAudioStreamQueued => :GetAudioStreamQueued,
      :SDL_FlushAudioStream => :FlushAudioStream,
      :SDL_ClearAudioStream => :ClearAudioStream,
      :SDL_LockAudioStream => :LockAudioStream,
      :SDL_UnlockAudioStream => :UnlockAudioStream,
      :SDL_SetAudioStreamGetCallback => :SetAudioStreamGetCallback,
      :SDL_SetAudioStreamPutCallback => :SetAudioStreamPutCallback,
      :SDL_DestroyAudioStream => :DestroyAudioStream,
      :SDL_OpenAudioDeviceStream => :OpenAudioDeviceStream,
      :SDL_SetAudioPostmixCallback => :SetAudioPostmixCallback,
      :SDL_LoadWAV_RW => :LoadWAV_RW,
      :SDL_LoadWAV => :LoadWAV,
      :SDL_MixAudioFormat => :MixAudioFormat,
      :SDL_ConvertAudioSamples => :ConvertAudioSamples,
      :SDL_GetSilenceValueForFormat => :GetSilenceValueForFormat,
    }
    args = {
      :SDL_GetNumAudioDrivers => [],
      :SDL_GetAudioDriver => [:int],
      :SDL_GetCurrentAudioDriver => [],
      :SDL_GetAudioOutputDevices => [:pointer],
      :SDL_GetAudioCaptureDevices => [:pointer],
      :SDL_GetAudioDeviceName => [:uint],
      :SDL_GetAudioDeviceFormat => [:uint, :pointer, :pointer],
      :SDL_OpenAudioDevice => [:uint, :pointer],
      :SDL_PauseAudioDevice => [:uint],
      :SDL_ResumeAudioDevice => [:uint],
      :SDL_AudioDevicePaused => [:uint],
      :SDL_CloseAudioDevice => [:uint],
      :SDL_BindAudioStreams => [:uint, :pointer, :int],
      :SDL_BindAudioStream => [:uint, :pointer],
      :SDL_UnbindAudioStreams => [:pointer, :int],
      :SDL_UnbindAudioStream => [:pointer],
      :SDL_GetAudioStreamDevice => [:pointer],
      :SDL_CreateAudioStream => [:pointer, :pointer],
      :SDL_GetAudioStreamProperties => [:pointer],
      :SDL_GetAudioStreamFormat => [:pointer, :pointer, :pointer],
      :SDL_SetAudioStreamFormat => [:pointer, :pointer, :pointer],
      :SDL_GetAudioStreamFrequencyRatio => [:pointer],
      :SDL_SetAudioStreamFrequencyRatio => [:pointer, :float],
      :SDL_PutAudioStreamData => [:pointer, :pointer, :int],
      :SDL_GetAudioStreamData => [:pointer, :pointer, :int],
      :SDL_GetAudioStreamAvailable => [:pointer],
      :SDL_GetAudioStreamQueued => [:pointer],
      :SDL_FlushAudioStream => [:pointer],
      :SDL_ClearAudioStream => [:pointer],
      :SDL_LockAudioStream => [:pointer],
      :SDL_UnlockAudioStream => [:pointer],
      :SDL_SetAudioStreamGetCallback => [:pointer, :SDL_AudioStreamCallback, :pointer],
      :SDL_SetAudioStreamPutCallback => [:pointer, :SDL_AudioStreamCallback, :pointer],
      :SDL_DestroyAudioStream => [:pointer],
      :SDL_OpenAudioDeviceStream => [:uint, :pointer, :SDL_AudioStreamCallback, :pointer],
      :SDL_SetAudioPostmixCallback => [:uint, :SDL_AudioPostmixCallback, :pointer],
      :SDL_LoadWAV_RW => [:pointer, :int, :pointer, :pointer, :pointer],
      :SDL_LoadWAV => [:pointer, :pointer, :pointer, :pointer],
      :SDL_MixAudioFormat => [:pointer, :pointer, :ushort, :uint, :int],
      :SDL_ConvertAudioSamples => [:pointer, :pointer, :int, :pointer, :pointer, :pointer],
      :SDL_GetSilenceValueForFormat => [:ushort],
    }
    retvals = {
      :SDL_GetNumAudioDrivers => :int,
      :SDL_GetAudioDriver => :pointer,
      :SDL_GetCurrentAudioDriver => :pointer,
      :SDL_GetAudioOutputDevices => :pointer,
      :SDL_GetAudioCaptureDevices => :pointer,
      :SDL_GetAudioDeviceName => :pointer,
      :SDL_GetAudioDeviceFormat => :int,
      :SDL_OpenAudioDevice => :uint,
      :SDL_PauseAudioDevice => :int,
      :SDL_ResumeAudioDevice => :int,
      :SDL_AudioDevicePaused => :int,
      :SDL_CloseAudioDevice => :void,
      :SDL_BindAudioStreams => :int,
      :SDL_BindAudioStream => :int,
      :SDL_UnbindAudioStreams => :void,
      :SDL_UnbindAudioStream => :void,
      :SDL_GetAudioStreamDevice => :uint,
      :SDL_CreateAudioStream => :pointer,
      :SDL_GetAudioStreamProperties => :uint,
      :SDL_GetAudioStreamFormat => :int,
      :SDL_SetAudioStreamFormat => :int,
      :SDL_GetAudioStreamFrequencyRatio => :float,
      :SDL_SetAudioStreamFrequencyRatio => :int,
      :SDL_PutAudioStreamData => :int,
      :SDL_GetAudioStreamData => :int,
      :SDL_GetAudioStreamAvailable => :int,
      :SDL_GetAudioStreamQueued => :int,
      :SDL_FlushAudioStream => :int,
      :SDL_ClearAudioStream => :int,
      :SDL_LockAudioStream => :int,
      :SDL_UnlockAudioStream => :int,
      :SDL_SetAudioStreamGetCallback => :int,
      :SDL_SetAudioStreamPutCallback => :int,
      :SDL_DestroyAudioStream => :void,
      :SDL_OpenAudioDeviceStream => :pointer,
      :SDL_SetAudioPostmixCallback => :int,
      :SDL_LoadWAV_RW => :int,
      :SDL_LoadWAV => :int,
      :SDL_MixAudioFormat => :int,
      :SDL_ConvertAudioSamples => :int,
      :SDL_GetSilenceValueForFormat => :int,
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

