require_relative '../lib/sdl2'

include SDL2

$ticks = 0

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_TIMER)
  exit if success < 0

  resolution = 1

  cb = Proc.new do |interval, param|
    puts("Timer #{interval} : param = #{param}, $ticks=#{$ticks}")
    $ticks += 1
    interval
  end

  thr = Thread.new(1) do |i|
    t1 = SDL_AddTimer(resolution, cb, nil)

    print("Waiting Timer...")
    sleep(1)
    puts("Done.")
    SDL_RemoveTimer(t1)
  end

  puts("Waiting thread...")
  thr.join

  if $ticks > 0
    printf("Timer resolution: desired = %d ms, actual = %f ms\n", resolution, (10 * 1000).to_f / $ticks);
  end

  SDL_Quit()
end
