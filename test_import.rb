require_relative 'lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib', '/usr/local/lib')
  success = SDL_Init(SDL_INIT_EVERYTHING)
  puts "SDL_Init : #{success == 0 ? 'Success' : 'Failed'}"
  exit if success != 0
  # p SDL_INIT_EVERYTHING.to_s(16)
  SDL_ClearHints()
  SDL_Quit()
end
