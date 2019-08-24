# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings

require 'ffi'
require_relative 'sdl2_main.rb'
require_relative 'sdl2_audio.rb'
require_relative 'sdl2_blendmode.rb'
require_relative 'sdl2_clipboard.rb'
require_relative 'sdl2_cpuinfo.rb'
require_relative 'sdl2_error.rb'
require_relative 'sdl2_events.rb'
require_relative 'sdl2_filesystem.rb'
require_relative 'sdl2_gamecontroller.rb'
require_relative 'sdl2_gesture.rb'
require_relative 'sdl2_haptic.rb'
require_relative 'sdl2_hints.rb'
require_relative 'sdl2_joystick.rb'
require_relative 'sdl2_keyboard.rb'
require_relative 'sdl2_keycode.rb'
require_relative 'sdl2_log.rb'
require_relative 'sdl2_messagebox.rb'
require_relative 'sdl2_mouse.rb'
require_relative 'sdl2_pixels.rb'
require_relative 'sdl2_platform.rb'
require_relative 'sdl2_power.rb'
require_relative 'sdl2_rect.rb'
require_relative 'sdl2_render.rb'
require_relative 'sdl2_rwops.rb'
require_relative 'sdl2_scancode.rb'
require_relative 'sdl2_shape.rb'
require_relative 'sdl2_surface.rb'
require_relative 'sdl2_timer.rb'
require_relative 'sdl2_touch.rb'
require_relative 'sdl2_version.rb'
require_relative 'sdl2_video.rb'
require_relative 'sdl2_vulkan.rb'

require_relative 'sdl2_framerate.rb'
require_relative 'sdl2_gfxPrimitives.rb'
require_relative 'sdl2_image.rb'
require_relative 'sdl2_rotozoom.rb'
require_relative 'sdl2_imageFilter.rb'
require_relative 'sdl2_ttf.rb'

module SDL2
  extend FFI::Library

  @@sdl2_import_done = false
  def self.load_lib(libpath, image_libpath: nil, ttf_libpath: nil, gfx_libpath: nil)

    unless @@sdl2_import_done
      # Ref.: Using Multiple and Alternate Libraries
      # https://github.com/ffi/ffi/wiki/Using-Multiple-and-Alternate-Libraries
      lib_paths = [libpath, image_libpath, ttf_libpath, gfx_libpath].compact

      ffi_lib_flags :now, :global
      ffi_lib *lib_paths
      setup_symbols()

      if image_libpath != nil
        setup_image_symbols()
      end

      if ttf_libpath != nil
        setup_ttf_symbols()
      end

      if gfx_libpath != nil
        setup_gfx_framerate_symbols()
        setup_gfx_primitives_symbols()
        setup_gfx_imagefilter_symbols()
        setup_gfx_rotozoom_symbols()
      end
    end

  end

  def self.setup_symbols()
    setup_main_symbols()
    setup_audio_symbols()
    setup_blendmode_symbols()
    setup_clipboard_symbols()
    setup_cpuinfo_symbols()
    setup_error_symbols()
    setup_events_symbols()
    setup_filesystem_symbols()
    setup_gamecontroller_symbols()
    setup_gesture_symbols()
    setup_haptic_symbols()
    setup_hints_symbols()
    setup_joystick_symbols()
    setup_keyboard_symbols()
    setup_keycode_symbols()
    setup_log_symbols()
    setup_messagebox_symbols()
    setup_mouse_symbols()
    setup_pixels_symbols()
    setup_platform_symbols()
    setup_power_symbols()
    setup_rect_symbols()
    setup_render_symbols()
    setup_rwops_symbols()
    setup_scancode_symbols()
    setup_shape_symbols()
    setup_surface_symbols()
    setup_timer_symbols()
    setup_touch_symbols()
    setup_version_symbols()
    setup_video_symbols()
    setup_vulkan_symbols()
  end

end


if __FILE__ == $0
#  SDL2.load_lib('libSDL2.dylib')
#  p SDL2.SDL_Init(SDL2::SDL_INIT_EVERYTHING)
  SDL2.load_lib('libSDL2.dylib',
                gfx_libpath: '/usr/local/lib/libSDL2_gfx.dylib'
               )
  #SDL2.SDL_SetMainReady()
  success = SDL2.SDL_Init(SDL2::SDL_INIT_EVERYTHING)
  exit if success < 0

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL2.SDL_CreateWindow("1st SDL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  fpsdelay = 100;

  count = 0
  event = SDL2::SDL_Event.new
  done = false
  while not done
    while SDL2.SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL2::SDL_KEYDOWN
        if event[:key][:keysym][:sym] == SDL2::SDLK_SPACE
          puts "\tSPACE key pressed."
        end
      end
    end

    count += 1
    done = true if count >= 100
    SDL2.SDL_Delay(fpsdelay)
  end

  SDL2.SDL_Quit()
end
