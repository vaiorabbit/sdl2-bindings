require_relative '../lib/sdl2'

if __FILE__ == $0
  if ARGV[0] == nil
    $stderr.puts 'Usage: ruby test_mixer.rb [path to .wav]'
    exit
  end

  SDL.load_lib(Dir.pwd + '/libSDL2.dylib', mixer_libpath: Dir.pwd + '/libSDL2_mixer.dylib' ) # '/usr/local/lib/libSDL2.dylib'
  success = SDL.Init(SDL::INIT_AUDIO)
  exit if success < 0

  SDL.Mix_Init(SDL::MIX_INIT_FLAC|SDL::MIX_INIT_MOD|SDL::MIX_INIT_MP3|SDL::MIX_INIT_OGG)
  SDL.Mix_OpenAudio(22050, SDL::MIX_DEFAULT_FORMAT, 2, 512)

  rwops = SDL.RWFromFile(ARGV[0], "rb")
  wave = SDL.Mix_LoadWAV_RW(rwops, 1)
  SDL.Mix_FadeInChannelTimed(0, wave, 0, 600, -1)
  while SDL.Mix_Playing(0) != 0
    sleep 1
  end
  SDL.Mix_Quit()
  SDL.Quit()
end
