# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_MIXER_MAJOR_VERSION = 2
  SDL_MIXER_MINOR_VERSION = 0
  SDL_MIXER_PATCHLEVEL = 4

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
    symbols = [
      :Mix_Linked_Version,
      :Mix_Init,
      :Mix_Quit,
      :Mix_OpenAudio,
      :Mix_OpenAudioDevice,
      :Mix_AllocateChannels,
      :Mix_QuerySpec,
      :Mix_LoadWAV_RW,
      :Mix_LoadMUS,
      :Mix_LoadMUS_RW,
      :Mix_LoadMUSType_RW,
      :Mix_QuickLoad_WAV,
      :Mix_QuickLoad_RAW,
      :Mix_FreeChunk,
      :Mix_FreeMusic,
      :Mix_GetNumChunkDecoders,
      :Mix_GetChunkDecoder,
      :Mix_HasChunkDecoder,
      :Mix_GetNumMusicDecoders,
      :Mix_GetMusicDecoder,
      :Mix_HasMusicDecoder,
      :Mix_GetMusicType,
      :Mix_SetPostMix,
      :Mix_HookMusic,
      :Mix_HookMusicFinished,
      :Mix_GetMusicHookData,
      :Mix_ChannelFinished,
      :Mix_RegisterEffect,
      :Mix_UnregisterEffect,
      :Mix_UnregisterAllEffects,
      :Mix_SetPanning,
      :Mix_SetPosition,
      :Mix_SetDistance,
      :Mix_SetReverseStereo,
      :Mix_ReserveChannels,
      :Mix_GroupChannel,
      :Mix_GroupChannels,
      :Mix_GroupAvailable,
      :Mix_GroupCount,
      :Mix_GroupOldest,
      :Mix_GroupNewer,
      :Mix_PlayChannelTimed,
      :Mix_PlayMusic,
      :Mix_FadeInMusic,
      :Mix_FadeInMusicPos,
      :Mix_FadeInChannelTimed,
      :Mix_Volume,
      :Mix_VolumeChunk,
      :Mix_VolumeMusic,
      :Mix_HaltChannel,
      :Mix_HaltGroup,
      :Mix_HaltMusic,
      :Mix_ExpireChannel,
      :Mix_FadeOutChannel,
      :Mix_FadeOutGroup,
      :Mix_FadeOutMusic,
      :Mix_FadingMusic,
      :Mix_FadingChannel,
      :Mix_Pause,
      :Mix_Resume,
      :Mix_Paused,
      :Mix_PauseMusic,
      :Mix_ResumeMusic,
      :Mix_RewindMusic,
      :Mix_PausedMusic,
      :Mix_SetMusicPosition,
      :Mix_Playing,
      :Mix_PlayingMusic,
      :Mix_SetMusicCMD,
      :Mix_SetSynchroValue,
      :Mix_GetSynchroValue,
      :Mix_SetSoundFonts,
      :Mix_GetSoundFonts,
      :Mix_EachSoundFont,
      :Mix_GetChunk,
      :Mix_CloseAudio,
    ]
    args = {
      :Mix_Linked_Version => [],
      :Mix_Init => [:int],
      :Mix_Quit => [],
      :Mix_OpenAudio => [:int, :ushort, :int, :int],
      :Mix_OpenAudioDevice => [:int, :ushort, :int, :int, :pointer, :int],
      :Mix_AllocateChannels => [:int],
      :Mix_QuerySpec => [:pointer, :pointer, :pointer],
      :Mix_LoadWAV_RW => [:pointer, :int],
      :Mix_LoadMUS => [:pointer],
      :Mix_LoadMUS_RW => [:pointer, :int],
      :Mix_LoadMUSType_RW => [:pointer, :int, :int],
      :Mix_QuickLoad_WAV => [:pointer],
      :Mix_QuickLoad_RAW => [:pointer, :uint],
      :Mix_FreeChunk => [:pointer],
      :Mix_FreeMusic => [:pointer],
      :Mix_GetNumChunkDecoders => [],
      :Mix_GetChunkDecoder => [:int],
      :Mix_HasChunkDecoder => [:pointer],
      :Mix_GetNumMusicDecoders => [],
      :Mix_GetMusicDecoder => [:int],
      :Mix_HasMusicDecoder => [:pointer],
      :Mix_GetMusicType => [:pointer],
      :Mix_SetPostMix => [:pointer, :pointer],
      :Mix_HookMusic => [:pointer, :pointer],
      :Mix_HookMusicFinished => [:pointer],
      :Mix_GetMusicHookData => [],
      :Mix_ChannelFinished => [:pointer],
      :Mix_RegisterEffect => [:int, :Mix_EffectFunc_t, :Mix_EffectDone_t, :pointer],
      :Mix_UnregisterEffect => [:int, :Mix_EffectFunc_t],
      :Mix_UnregisterAllEffects => [:int],
      :Mix_SetPanning => [:int, :uchar, :uchar],
      :Mix_SetPosition => [:int, :short, :uchar],
      :Mix_SetDistance => [:int, :uchar],
      :Mix_SetReverseStereo => [:int, :int],
      :Mix_ReserveChannels => [:int],
      :Mix_GroupChannel => [:int, :int],
      :Mix_GroupChannels => [:int, :int, :int],
      :Mix_GroupAvailable => [:int],
      :Mix_GroupCount => [:int],
      :Mix_GroupOldest => [:int],
      :Mix_GroupNewer => [:int],
      :Mix_PlayChannelTimed => [:int, :pointer, :int, :int],
      :Mix_PlayMusic => [:pointer, :int],
      :Mix_FadeInMusic => [:pointer, :int, :int],
      :Mix_FadeInMusicPos => [:pointer, :int, :int, :double],
      :Mix_FadeInChannelTimed => [:int, :pointer, :int, :int, :int],
      :Mix_Volume => [:int, :int],
      :Mix_VolumeChunk => [:pointer, :int],
      :Mix_VolumeMusic => [:int],
      :Mix_HaltChannel => [:int],
      :Mix_HaltGroup => [:int],
      :Mix_HaltMusic => [],
      :Mix_ExpireChannel => [:int, :int],
      :Mix_FadeOutChannel => [:int, :int],
      :Mix_FadeOutGroup => [:int, :int],
      :Mix_FadeOutMusic => [:int],
      :Mix_FadingMusic => [],
      :Mix_FadingChannel => [:int],
      :Mix_Pause => [:int],
      :Mix_Resume => [:int],
      :Mix_Paused => [:int],
      :Mix_PauseMusic => [],
      :Mix_ResumeMusic => [],
      :Mix_RewindMusic => [],
      :Mix_PausedMusic => [],
      :Mix_SetMusicPosition => [:double],
      :Mix_Playing => [:int],
      :Mix_PlayingMusic => [],
      :Mix_SetMusicCMD => [:pointer],
      :Mix_SetSynchroValue => [:int],
      :Mix_GetSynchroValue => [],
      :Mix_SetSoundFonts => [:pointer],
      :Mix_GetSoundFonts => [],
      :Mix_EachSoundFont => [:pointer, :pointer],
      :Mix_GetChunk => [:int],
      :Mix_CloseAudio => [],
    }
    retvals = {
      :Mix_Linked_Version => :pointer,
      :Mix_Init => :int,
      :Mix_Quit => :void,
      :Mix_OpenAudio => :int,
      :Mix_OpenAudioDevice => :int,
      :Mix_AllocateChannels => :int,
      :Mix_QuerySpec => :int,
      :Mix_LoadWAV_RW => :pointer,
      :Mix_LoadMUS => :pointer,
      :Mix_LoadMUS_RW => :pointer,
      :Mix_LoadMUSType_RW => :pointer,
      :Mix_QuickLoad_WAV => :pointer,
      :Mix_QuickLoad_RAW => :pointer,
      :Mix_FreeChunk => :void,
      :Mix_FreeMusic => :void,
      :Mix_GetNumChunkDecoders => :int,
      :Mix_GetChunkDecoder => :pointer,
      :Mix_HasChunkDecoder => :int,
      :Mix_GetNumMusicDecoders => :int,
      :Mix_GetMusicDecoder => :pointer,
      :Mix_HasMusicDecoder => :int,
      :Mix_GetMusicType => :int,
      :Mix_SetPostMix => :void,
      :Mix_HookMusic => :void,
      :Mix_HookMusicFinished => :void,
      :Mix_GetMusicHookData => :pointer,
      :Mix_ChannelFinished => :void,
      :Mix_RegisterEffect => :int,
      :Mix_UnregisterEffect => :int,
      :Mix_UnregisterAllEffects => :int,
      :Mix_SetPanning => :int,
      :Mix_SetPosition => :int,
      :Mix_SetDistance => :int,
      :Mix_SetReverseStereo => :int,
      :Mix_ReserveChannels => :int,
      :Mix_GroupChannel => :int,
      :Mix_GroupChannels => :int,
      :Mix_GroupAvailable => :int,
      :Mix_GroupCount => :int,
      :Mix_GroupOldest => :int,
      :Mix_GroupNewer => :int,
      :Mix_PlayChannelTimed => :int,
      :Mix_PlayMusic => :int,
      :Mix_FadeInMusic => :int,
      :Mix_FadeInMusicPos => :int,
      :Mix_FadeInChannelTimed => :int,
      :Mix_Volume => :int,
      :Mix_VolumeChunk => :int,
      :Mix_VolumeMusic => :int,
      :Mix_HaltChannel => :int,
      :Mix_HaltGroup => :int,
      :Mix_HaltMusic => :int,
      :Mix_ExpireChannel => :int,
      :Mix_FadeOutChannel => :int,
      :Mix_FadeOutGroup => :int,
      :Mix_FadeOutMusic => :int,
      :Mix_FadingMusic => :int,
      :Mix_FadingChannel => :int,
      :Mix_Pause => :void,
      :Mix_Resume => :void,
      :Mix_Paused => :int,
      :Mix_PauseMusic => :void,
      :Mix_ResumeMusic => :void,
      :Mix_RewindMusic => :void,
      :Mix_PausedMusic => :int,
      :Mix_SetMusicPosition => :int,
      :Mix_Playing => :int,
      :Mix_PlayingMusic => :int,
      :Mix_SetMusicCMD => :int,
      :Mix_SetSynchroValue => :int,
      :Mix_GetSynchroValue => :int,
      :Mix_SetSoundFonts => :int,
      :Mix_GetSoundFonts => :pointer,
      :Mix_EachSoundFont => :int,
      :Mix_GetChunk => :pointer,
      :Mix_CloseAudio => :void,
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

