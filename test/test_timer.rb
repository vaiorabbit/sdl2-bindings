require_relative '../lib/sdl2'
require_relative 'util'

$ticks = 0

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_TIMER)
  exit if success < 0

  resolution = 1

  cb = Proc.new do |interval, param|
    puts("Timer #{interval} : param = #{param}, $ticks=#{$ticks}")
    $ticks += 1
    interval
  end

  thr = Thread.new(1) do |i|
    t1 = SDL.AddTimer(resolution, cb, nil)

    print("Waiting Timer...")
    sleep(1)
    puts("Done.")
    SDL.RemoveTimer(t1)
  end

  puts("Waiting thread...")
  thr.join

  if $ticks > 0
    printf("Timer resolution: desired = %d ms, actual = %f ms\n", resolution, (10 * 1000).to_f / $ticks);
  end

  SDL.Quit()
end
