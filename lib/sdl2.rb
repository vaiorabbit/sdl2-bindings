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
require_relative 'sdl2_misc.rb'
require_relative 'sdl2_mouse.rb'
require_relative 'sdl2_pixels.rb'
require_relative 'sdl2_platform.rb'
require_relative 'sdl2_power.rb'
require_relative 'sdl2_rect.rb'
require_relative 'sdl2_render.rb'
require_relative 'sdl2_rwops.rb'
require_relative 'sdl2_scancode.rb'
require_relative 'sdl2_sensor.rb'
require_relative 'sdl2_shape.rb'
require_relative 'sdl2_stdinc.rb'
require_relative 'sdl2_surface.rb'
require_relative 'sdl2_syswm.rb'
require_relative 'sdl2_timer.rb'
require_relative 'sdl2_touch.rb'
require_relative 'sdl2_version.rb'
require_relative 'sdl2_video.rb'
require_relative 'sdl2_vulkan.rb'

# SDL2_gfx
require_relative 'sdl2_framerate.rb'
require_relative 'sdl2_gfxPrimitives.rb'
require_relative 'sdl2_rotozoom.rb'
require_relative 'sdl2_imageFilter.rb'
# SDL_image
require_relative 'sdl2_image.rb'
# SDL_mixer
require_relative 'sdl2_mixer.rb'
# SDL_ttf
require_relative 'sdl2_ttf.rb'
# SDL_sound
require_relative 'sdl2_sound.rb'

module SDL
  extend FFI::Library

  @@sdl2_import_done = false
  def self.load_lib(libpath, output_error = false, image_libpath: nil, ttf_libpath: nil, mixer_libpath: nil, gfx_libpath: nil, sound_libpath: nil)

    unless @@sdl2_import_done
      # Ref.: Using Multiple and Alternate Libraries
      # https://github.com/ffi/ffi/wiki/Using-Multiple-and-Alternate-Libraries
      begin
        lib_paths = [libpath, image_libpath, ttf_libpath, mixer_libpath, gfx_libpath, sound_libpath].compact

        ffi_lib_flags :now, :global
        ffi_lib *lib_paths
        setup_symbols(output_error)

        setup_image_symbols(output_error) if image_libpath
        setup_ttf_symbols(output_error) if ttf_libpath
        setup_mixer_symbols(output_error) if mixer_libpath

        if gfx_libpath != nil
          setup_gfx_framerate_symbols(output_error)
          setup_gfx_primitives_symbols(output_error)
          setup_gfx_imagefilter_symbols(output_error)
          setup_gfx_rotozoom_symbols(output_error)
        end

        setup_sound_symbols(output_error) if sound_libpath
      rescue => error
        $stderr.puts("[Warning] Failed to load libraries (#{error}).") if output_error
      end
    end

  end

  def self.setup_symbols(output_error = false)
    setup_main_symbols(output_error)
    setup_audio_symbols(output_error)
    setup_blendmode_symbols(output_error)
    setup_clipboard_symbols(output_error)
    setup_cpuinfo_symbols(output_error)
    setup_error_symbols(output_error)
    setup_events_symbols(output_error)
    setup_filesystem_symbols(output_error)
    setup_gamecontroller_symbols(output_error)
    setup_gesture_symbols(output_error)
    setup_haptic_symbols(output_error)
    setup_hints_symbols(output_error)
    setup_joystick_symbols(output_error)
    setup_keyboard_symbols(output_error)
    setup_keycode_symbols(output_error)
    setup_log_symbols(output_error)
    setup_messagebox_symbols(output_error)
    setup_misc_symbols(output_error)
    setup_mouse_symbols(output_error)
    setup_pixels_symbols(output_error)
    setup_platform_symbols(output_error)
    setup_power_symbols(output_error)
    setup_rect_symbols(output_error)
    setup_render_symbols(output_error)
    setup_rwops_symbols(output_error)
    setup_scancode_symbols(output_error)
    setup_sensor_symbols(output_error)
    setup_shape_symbols(output_error)
    setup_surface_symbols(output_error)
    setup_syswm_symbols(output_error)
    setup_stdinc_symbols(output_error)
    setup_timer_symbols(output_error)
    setup_touch_symbols(output_error)
    setup_version_symbols(output_error)
    setup_video_symbols(output_error)
    setup_vulkan_symbols(output_error)
  end

end
