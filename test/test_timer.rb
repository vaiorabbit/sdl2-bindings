require 'fiddle'
require_relative '../lib/sdl2'

include SDL2

$ticks = 0

cb_args = [-Fiddle::TYPE_INT, Fiddle::TYPE_VOIDP]
cb_retval = -Fiddle::TYPE_INT

$ticktock = nil # SDL2::create_callback(:SDL_TimerCallback) do |interval, param|
def ticktock(interval, param)
  $ticks += 1
  puts("Ticks #{$ticks}")
  interval
end

$callback = nil # SDL2::create_callback(:SDL_TimerCallback) do |interval, param| # Fiddle::Closure::BlockCaller.new( cb_retval, cb_args ) { |interval, param|
def callback(interval, param)
  puts("Timer #{interval} : param = #{param}")
  interval
end

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  success = SDL_Init(SDL_INIT_TIMER)
  exit if success < 0

  resolution = 1

  thr = Thread.new(1) do |i|
    t1 = SDL_AddTimer(resolution, SDL2.create_callback(:SDL_TimerCallback, method(:ticktock).to_proc), nil)
    print("Waiting Timer...")
    sleep(10)
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
