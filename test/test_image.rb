require_relative '../lib/sdl2'
require_relative '../lib/sdl2_image'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib', image_libpath: 'libSDL2_image.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_AUDIO)
  exit if success < 0
=begin
  Mix_Init(MIX_INIT_FLAC|MIX_INIT_MOD|MIX_INIT_MP3|MIX_INIT_OGG)
  Mix_OpenAudio(22050, MIX_DEFAULT_FORMAT, 2, 512)

  rwops = SDL_RWFromFile(ARGV[0], "rb")
  wave = Mix_LoadWAV_RW(rwops, 1)
  Mix_FadeInChannelTimed(0, wave, 0, 600, -1)
  while Mix_Playing(0) != 0
    sleep 1
  end
  Mix_Quit()
=end
  SDL_Quit()
end
