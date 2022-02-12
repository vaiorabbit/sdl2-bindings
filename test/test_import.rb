require 'sdl2'
# require_relative '../lib/sdl2'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_EVERYTHING)
  puts "SDL_Init : #{success == 0 ? 'Success' : 'Failed'}"
  exit if success != 0
  # p SDL_INIT_EVERYTHING.to_s(16)
  puts "Platform: #{SDL.GetPlatform().read_string}"
  version = SDL::Version.new
  SDL.GetVersion(version)
  puts("Major, Minor and Patch: #{version[:major]} #{version[:minor]} #{version[:patch]}")
  SDL.ClearHints()
  SDL.Quit()
end
