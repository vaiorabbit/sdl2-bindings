#!/usr/local/bin/zsh
export PYTHONPATH=/usr/local/Cellar/llvm/8.0.1/lib/python2.7/site-packages
python generate_SDL.py > ../lib/sdl2_main.rb
python generate_SDL_audio.py > ../lib/sdl2_audio.rb
python generate_SDL_blendmode.py > ../lib/sdl2_blendmode.rb
python generate_SDL_clipboard.py > ../lib/sdl2_clipboard.rb
python generate_SDL_cpuinfo.py > ../lib/sdl2_cpuinfo.rb
python generate_SDL_error.py > ../lib/sdl2_error.rb
python generate_SDL_events.py > ../lib/sdl2_events.rb
python generate_SDL_filesystem.py > ../lib/sdl2_filesystem.rb
python generate_SDL_gamecontroller.py > ../lib/sdl2_gamecontroller.rb
python generate_SDL_gesture.py > ../lib/sdl2_gesture.rb
python generate_SDL_haptic.py > ../lib/sdl2_haptic.rb
python generate_SDL_hints.py > ../lib/sdl2_hints.rb
python generate_SDL_joystick.py > ../lib/sdl2_joystick.rb
python generate_SDL_keyboard.py > ../lib/sdl2_keyboard.rb
python generate_SDL_keycode.py > ../lib/sdl2_keycode.rb
python generate_SDL_log.py > ../lib/sdl2_log.rb
python generate_SDL_messagebox.py > ../lib/sdl2_messagebox.rb
python generate_SDL_mouse.py > ../lib/sdl2_mouse.rb
python generate_SDL_pixels.py > ../lib/sdl2_pixels.rb
python generate_SDL_platform.py > ../lib/sdl2_platform.rb
python generate_SDL_power.py > ../lib/sdl2_power.rb
python generate_SDL_rect.py > ../lib/sdl2_rect.rb
python generate_SDL_render.py > ../lib/sdl2_render.rb
python generate_SDL_rwops.py > ../lib/sdl2_rwops.rb
python generate_SDL_scancode.py > ../lib/sdl2_scancode.rb
python generate_SDL_shape.py > ../lib/sdl2_shape.rb
python generate_SDL_surface.py > ../lib/sdl2_surface.rb
python generate_SDL_timer.py > ../lib/sdl2_timer.rb
python generate_SDL_touch.py > ../lib/sdl2_touch.rb
python generate_SDL_version.py > ../lib/sdl2_version.rb
python generate_SDL_video.py > ../lib/sdl2_video.rb
python generate_SDL_vulkan.py > ../lib/sdl2_vulkan.rb

python generate_SDL_ttf.py > ../lib/sdl2_ttf.rb
python generate_SDL_image.py > ../lib/sdl2_image.rb
python generate_SDL2_gfxPrimitives.py > ../lib/sdl2_gfxPrimitives.rb
python generate_SDL2_rotozoom.py > ../lib/sdl2_rotozoom.rb
python generate_SDL2_imageFilter.py > ../lib/sdl2_imageFilter.rb
python generate_SDL2_framerate.py > ../lib/sdl2_framerate.rb

