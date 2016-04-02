# -*- coding: utf-8 -*-
require 'fiddle/import'

module SDL2

  extend Fiddle::Importer

  SDL_MIXER_MAJOR_VERSION = 2
  SDL_MIXER_MINOR_VERSION = 0
  SDL_MIXER_PATCHLEVEL    = 1

  # MIX_InitFlags
  MIX_INIT_FLAC        = 0x00000001
  MIX_INIT_MOD         = 0x00000002
  MIX_INIT_MODPLUG     = 0x00000004
  MIX_INIT_MP3         = 0x00000008
  MIX_INIT_OGG         = 0x00000010
  MIX_INIT_FLUIDSYNTH  = 0x00000020

  MIX_CHANNELS = 8

  MIX_DEFAULT_CHANNELS =    2
  MIX_MAX_VOLUME       =  128

  # Mix_Fading
  MIX_NO_FADING   = 0
  MIX_FADING_OUT  = 1
  MIX_FADING_IN   = 2

  # Mix_MusicType
  MUS_NONE     = 0
  MUS_CMD      = 1
  MUS_WAV      = 2
  MUS_MOD      = 3
  MUS_MID      = 4
  MUS_OGG      = 5
  MUS_MP3      = 6
  MUS_MP3_MAD  = 7
  MUS_FLAC     = 8
  MUS_MODPLUG  = 9

  MIX_CHANNEL_POST = -2

  MIX_EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"

  Mix_Chunk = struct(["int allocated",
                      "unsigned char* abuf",
                      "unsigned int alen",
                      "unsigned char volume"])

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2MIXER_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2MIXER_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2MIXER_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2MIXER_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2mixer_import_done = false

  # Load native library.
  def self.load_mixer_lib(libpath)
    unless @@sdl2mixer_import_done
      dlload(libpath)
      import_mixer_symbols()
    end
  end


  def self.import_mixer_symbols
    typealias("Mix_MusicType", "int")
    typealias("Mix_Fading", "int")

    extern 'int Mix_Init(int)'
    extern 'void Mix_Quit()'

    extern 'int Mix_OpenAudio(int, unsigned short, int, int)'
    extern 'int Mix_AllocateChannels(int)'
    extern 'int Mix_QuerySpec(int*,unsigned short*,int*)'
    extern 'Mix_Chunk* Mix_LoadWAV_RW(SDL_RWops*, int)'
    # TODO : Mix_LoadWAV(file)   Mix_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1)
    extern 'Mix_Music* Mix_LoadMUS(const char*)'
    extern 'Mix_Music* Mix_LoadMUS_RW(SDL_RWops *src, int)'
    extern 'Mix_Music* Mix_LoadMUSType_RW(SDL_RWops* src, Mix_MusicType, int)'
    extern 'Mix_Chunk* Mix_QuickLoad_WAV(unsigned char*)'
    extern 'Mix_Chunk* Mix_QuickLoad_RAW(unsigned char*, unsigned int)'
    extern 'void Mix_FreeChunk(Mix_Chunk*)'
    extern 'void Mix_FreeMusic(Mix_Music*)'
    extern 'int Mix_GetNumChunkDecoders()'
    extern 'const char* Mix_GetChunkDecoder(int)'
    extern 'int Mix_GetNumMusicDecoders()'
    extern 'const char* Mix_GetMusicDecoder(int)'
    extern 'Mix_MusicType Mix_GetMusicType(const Mix_Music*)'
=begin
    extern 'void Mix_SetPostMix(void (*mix_func)(void*, unsigned char*, int), void*)'
    extern 'void Mix_HookMusic(void (*mix_func)(void *udata, unsigned char *stream, int len), void *arg)'
    extern 'void Mix_HookMusicFinished(void (*music_finished)())'
    extern 'void* Mix_GetMusicHookData()'
    extern 'void Mix_ChannelFinished(void (*channel_finished)(int))'
=end

    # TODO : Effect
=begin
    # typedef void (*Mix_EffectFunc_t)(int chan, void *stream, int len, void *udata)
    # typedef void (*Mix_EffectDone_t)(int chan, void *udata)
    extern 'int Mix_RegisterEffect(int, Mix_EffectFunc_t, Mix_EffectDone_t, void*)'
    extern 'int Mix_UnregisterEffect(int, Mix_EffectFunc_t)'
    extern 'int Mix_UnregisterAllEffects(int)'
=end

    extern 'int Mix_SetPanning(int, unsigned char, unsigned char)'
    extern 'int Mix_SetPosition(int, short, unsigned char)'
    extern 'int Mix_SetDistance(int, unsigned char)'

    extern 'int Mix_SetReverseStereo(int, int)'
    extern 'int Mix_ReserveChannels(int)'
    extern 'int Mix_GroupChannel(int, int)'
    extern 'int Mix_GroupChannels(int, int, int)'
    extern 'int Mix_GroupAvailable(int)'
    extern 'int Mix_GroupCount(int)'
    extern 'int Mix_GroupOldest(int)'
    extern 'int Mix_GroupNewer(int)'

    # TODO : Mix_PlayChannel(channel,chunk,loops) Mix_PlayChannelTimed(channel,chunk,loops,-1)
    extern 'int Mix_PlayChannelTimed(int, Mix_Chunk*, int, int)'
    extern 'int Mix_PlayMusic(Mix_Music*, int)'

    extern 'int Mix_FadeInMusic(Mix_Music*, int, int)'
    extern 'int Mix_FadeInMusicPos(Mix_Music*, int, int, double)'
    #TODO : Mix_FadeInChannel(channel,chunk,loops,ms) Mix_FadeInChannelTimed(channel,chunk,loops,ms,-1)
    extern 'int Mix_FadeInChannelTimed(int, Mix_Chunk*, int, int, int)'

    extern 'int Mix_Volume(int, int)'
    extern 'int Mix_VolumeChunk(Mix_Chunk*, int)'
    extern 'int Mix_VolumeMusic(int)'
    extern 'int Mix_HaltChannel(int)'
    extern 'int Mix_HaltGroup(int)'
    extern 'int Mix_HaltMusic()'

    extern 'int Mix_ExpireChannel(int, int)'

    extern 'int Mix_FadeOutChannel(int, int)'
    extern 'int Mix_FadeOutGroup(int, int)'
    extern 'int Mix_FadeOutMusic(int)'

    extern 'Mix_Fading Mix_FadingMusic()'
    extern 'Mix_Fading Mix_FadingChannel(int)'

    extern 'void Mix_Pause(int)'
    extern 'void Mix_Resume(int)'
    extern 'int Mix_Paused(int)'

    extern 'void Mix_PauseMusic()'
    extern 'void Mix_ResumeMusic()'
    extern 'void Mix_RewindMusic()'
    extern 'int Mix_PausedMusic()'

    extern 'int Mix_SetMusicPosition(double)'

    extern 'int Mix_Playing(int)'
    extern 'int Mix_PlayingMusic()'

    extern 'int Mix_SetMusicCMD(const char*)'

    extern 'int Mix_SetSynchroValue(int)'
    extern 'int Mix_GetSynchroValue()'
=begin
    extern 'int Mix_SetSoundFonts(const char*)'
    extern 'const char* Mix_GetSoundFonts()'
    extern 'int Mix_EachSoundFont(int (*function)(const char*, void*), void *data)'
=end
    extern 'Mix_Chunk* Mix_GetChunk(int)'
    extern 'void Mix_CloseAudio()'

# TODO : Mix_SetError/Mix_GetError

    if SDL2::SDL_BYTEORDER == SDL2::SDL_BIG_ENDIAN
      self.const_set("MIX_DEFAULT_FORMAT", AUDIO_S16LSB)
    else
      self.const_set("MIX_DEFAULT_FORMAT", AUDIO_S16MSB)
    end

    @@sdl2mixer_import_done = true
  end

end

=begin
sdl2-bindings : Yet another SDL2 wrapper for Ruby
Copyright (c) 2015 vaiorabbit <http://twitter.com/vaiorabbit>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
=end
