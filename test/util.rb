def load_sdl2_lib()
  case RbConfig::CONFIG['host_os']
  when /mswin|msys|mingw|cygwin/
    SDL.load_lib(Dir.pwd + '/SDL2.dll')
  when /darwin/
    SDL.load_lib('../third_party/SDL/lib/libSDL3.dylib', output_error = true)
  when /linux/
    # Tested on Ubuntu Linux
    SDL.load_lib("/lib/#{RUBY_PLATFORM}-gnu/libSDL2.so")
  else
    raise RuntimeError, "Unsupported platform."
  end
end
