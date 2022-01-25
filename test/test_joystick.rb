# Tested with:
# - Xbox One S Controller on macOS 12.1 [2022-01-26]
require_relative '../lib/sdl2'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_VIDEO | SDL::INIT_GAMECONTROLLER)
  exit if success < 0

  if File.exists?('gamecontrollerdb.txt')
    # curl -O https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt
    SDL.GameControllerAddMapping(IO.read('gamecontrollerdb.txt'))
  end

  n_joysticks = SDL.NumJoysticks()
  if n_joysticks <= 0
    $stderr.puts 'ERROR: No joysticks found'
    exit
  end
  for i in 0...n_joysticks
    name = SDL.JoystickNameForIndex(i)
    printf("Joystick %d: %s\n", i, name ? name.read_string : "Unknown Joystick")
  end

  gamepad = SDL.GameControllerOpen(0)
  joystick = SDL.GameControllerGetJoystick(gamepad)
  puts("#{SDL.GameControllerGetType(gamepad)}") # CONTROLLER_TYPE_XBOXONE = 2
  printf("       axes: %d\n", SDL.JoystickNumAxes(joystick))
  printf("      balls: %d\n", SDL.JoystickNumBalls(joystick))
  printf("       hats: %d\n", SDL.JoystickNumHats(joystick))
  printf("    buttons: %d\n", SDL.JoystickNumButtons(joystick))
  printf("instance id: %d\n", SDL.JoystickInstanceID(joystick))

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL.CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL::JOYAXISMOTION || SDL::CONTROLLERAXISMOTION
        puts "axis=#{event[:jaxis][:axis]}, value=#{event[:jaxis][:value]}"

      when SDL::KEYDOWN
        if event[:key][:keysym][:sym] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::JOYBUTTONUP || SDL::JOYBUTTONUP
        puts "sym=#{event[:key][:keysym][:sym]}"
      end
    end

  end

  SDL.GameControllerClose(gamepad)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
