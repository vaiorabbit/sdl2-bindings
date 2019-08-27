require_relative '../lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib', mixer_libpath: '/usr/local/lib/libSDL2_mixer.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_AUDIO)
  exit if success < 0

  Mix_Init(MIX_INIT_FLAC|MIX_INIT_MOD|MIX_INIT_MP3|MIX_INIT_OGG)
  AUDIO_S16LSB = 0x8010 # TODO
  MIX_DEFAULT_FORMAT = AUDIO_S16LSB # TODO
  Mix_OpenAudio(22050, MIX_DEFAULT_FORMAT, 2, 512)

  rwops = SDL_RWFromFile(ARGV[0], "rb")
  wave = Mix_LoadWAV_RW(rwops, 1)
  Mix_FadeInChannelTimed(0, wave, 0, 600, -1)
  while Mix_Playing(0) != 0
    sleep 1
  end
  Mix_Quit()
  SDL_Quit()
end
