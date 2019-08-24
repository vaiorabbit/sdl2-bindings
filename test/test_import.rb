require_relative '../lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_EVERYTHING)
  puts "SDL_Init : #{success == 0 ? 'Success' : 'Failed'}"
  exit if success != 0
  # p SDL_INIT_EVERYTHING.to_s(16)
  puts "Platform: #{SDL_GetPlatform().read_string}"
  version = SDL_version.new
  SDL_GetVersion(version)
  puts("Major, Minor and Patch: #{version[:major]} #{version[:minor]} #{version[:patch]}")
  SDL_ClearHints()
  SDL_Quit()
end
