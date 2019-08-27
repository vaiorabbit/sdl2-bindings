# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum

  MIX_INIT_FLAC = 1
  MIX_INIT_MOD = 2
  MIX_INIT_MP3 = 8
  MIX_INIT_OGG = 16
  MIX_INIT_MID = 32
  MIX_INIT_OPUS = 64
  MIX_NO_FADING = 0
  MIX_FADING_OUT = 1
  MIX_FADING_IN = 2
  MUS_NONE = 0
  MUS_CMD = 1
  MUS_WAV = 2
  MUS_MOD = 3
  MUS_MID = 4
  MUS_OGG = 5
  MUS_MP3 = 6
  MUS_MP3_MAD_UNUSED = 7
  MUS_FLAC = 8
  MUS_MODPLUG_UNUSED = 9
  MUS_OPUS = 10

  # Typedef

  typedef :int, :MIX_InitFlags
  typedef :int, :Mix_Fading
  typedef :int, :Mix_MusicType
  callback :Mix_EffectFunc_t, [:int, :pointer, :int, :pointer], :void
  callback :Mix_EffectDone_t, [:int, :pointer], :void

  # Struct

  class Mix_Chunk < FFI::Struct
    layout(
      :allocated, :int,
      :abuf, :pointer,
      :alen, :uint,
      :volume, :uchar,
    )
  end


  # Function

  def self.setup_mixer_symbols()
      attach_function :Mix_Linked_Version, [], :pointer
      attach_function :Mix_Init, [:int], :int
      attach_function :Mix_Quit, [], :void
      attach_function :Mix_OpenAudio, [:int, :ushort, :int, :int], :int
      attach_function :Mix_OpenAudioDevice, [:int, :ushort, :int, :int, :pointer, :int], :int
      attach_function :Mix_AllocateChannels, [:int], :int
      attach_function :Mix_QuerySpec, [:pointer, :pointer, :pointer], :int
      attach_function :Mix_LoadWAV_RW, [:pointer, :int], :pointer
      attach_function :Mix_LoadMUS, [:pointer], :pointer
      attach_function :Mix_LoadMUS_RW, [:pointer, :int], :pointer
      attach_function :Mix_LoadMUSType_RW, [:pointer, :int, :int], :pointer
      attach_function :Mix_QuickLoad_WAV, [:pointer], :pointer
      attach_function :Mix_QuickLoad_RAW, [:pointer, :uint], :pointer
      attach_function :Mix_FreeChunk, [:pointer], :void
      attach_function :Mix_FreeMusic, [:pointer], :void
      attach_function :Mix_GetNumChunkDecoders, [], :int
      attach_function :Mix_GetChunkDecoder, [:int], :pointer
      attach_function :Mix_HasChunkDecoder, [:pointer], :int
      attach_function :Mix_GetNumMusicDecoders, [], :int
      attach_function :Mix_GetMusicDecoder, [:int], :pointer
      attach_function :Mix_HasMusicDecoder, [:pointer], :int
      attach_function :Mix_GetMusicType, [:pointer], :int
      attach_function :Mix_SetPostMix, [:pointer, :pointer], :void
      attach_function :Mix_HookMusic, [:pointer, :pointer], :void
      attach_function :Mix_HookMusicFinished, [:pointer], :void
      attach_function :Mix_GetMusicHookData, [], :pointer
      attach_function :Mix_ChannelFinished, [:pointer], :void
      attach_function :Mix_RegisterEffect, [:int, :pointer, :pointer, :pointer], :int
      attach_function :Mix_UnregisterEffect, [:int, :pointer], :int
      attach_function :Mix_UnregisterAllEffects, [:int], :int
      attach_function :Mix_SetPanning, [:int, :uchar, :uchar], :int
      attach_function :Mix_SetPosition, [:int, :short, :uchar], :int
      attach_function :Mix_SetDistance, [:int, :uchar], :int
      attach_function :Mix_SetReverseStereo, [:int, :int], :int
      attach_function :Mix_ReserveChannels, [:int], :int
      attach_function :Mix_GroupChannel, [:int, :int], :int
      attach_function :Mix_GroupChannels, [:int, :int, :int], :int
      attach_function :Mix_GroupAvailable, [:int], :int
      attach_function :Mix_GroupCount, [:int], :int
      attach_function :Mix_GroupOldest, [:int], :int
      attach_function :Mix_GroupNewer, [:int], :int
      attach_function :Mix_PlayChannelTimed, [:int, :pointer, :int, :int], :int
      attach_function :Mix_PlayMusic, [:pointer, :int], :int
      attach_function :Mix_FadeInMusic, [:pointer, :int, :int], :int
      attach_function :Mix_FadeInMusicPos, [:pointer, :int, :int, :double], :int
      attach_function :Mix_FadeInChannelTimed, [:int, :pointer, :int, :int, :int], :int
      attach_function :Mix_Volume, [:int, :int], :int
      attach_function :Mix_VolumeChunk, [:pointer, :int], :int
      attach_function :Mix_VolumeMusic, [:int], :int
      attach_function :Mix_HaltChannel, [:int], :int
      attach_function :Mix_HaltGroup, [:int], :int
      attach_function :Mix_HaltMusic, [], :int
      attach_function :Mix_ExpireChannel, [:int, :int], :int
      attach_function :Mix_FadeOutChannel, [:int, :int], :int
      attach_function :Mix_FadeOutGroup, [:int, :int], :int
      attach_function :Mix_FadeOutMusic, [:int], :int
      attach_function :Mix_FadingMusic, [], :int
      attach_function :Mix_FadingChannel, [:int], :int
      attach_function :Mix_Pause, [:int], :void
      attach_function :Mix_Resume, [:int], :void
      attach_function :Mix_Paused, [:int], :int
      attach_function :Mix_PauseMusic, [], :void
      attach_function :Mix_ResumeMusic, [], :void
      attach_function :Mix_RewindMusic, [], :void
      attach_function :Mix_PausedMusic, [], :int
      attach_function :Mix_SetMusicPosition, [:double], :int
      attach_function :Mix_Playing, [:int], :int
      attach_function :Mix_PlayingMusic, [], :int
      attach_function :Mix_SetMusicCMD, [:pointer], :int
      attach_function :Mix_SetSynchroValue, [:int], :int
      attach_function :Mix_GetSynchroValue, [], :int
      attach_function :Mix_SetSoundFonts, [:pointer], :int
      attach_function :Mix_GetSoundFonts, [], :pointer
      attach_function :Mix_EachSoundFont, [:pointer, :pointer], :int
      attach_function :Mix_GetChunk, [:int], :pointer
      attach_function :Mix_CloseAudio, [], :void
  end

end

