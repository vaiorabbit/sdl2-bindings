# -*- coding: utf-8 -*-
require 'fiddle/import'
require_relative 'main'
require_relative 'audio'
require_relative 'blendmode'
require_relative 'clipboard'
require_relative 'cpuinfo'
require_relative 'error'
require_relative 'events'
require_relative 'filesystem'
require_relative 'gamecontroller'
require_relative 'gesture'
require_relative 'hints'
require_relative 'joystick'
require_relative 'keyboard'
require_relative 'messagebox'
require_relative 'mouse'
require_relative 'pixels'
require_relative 'platform'
require_relative 'rect'
require_relative 'render'
require_relative 'rwops'
require_relative 'surface'
require_relative 'syswm'
require_relative 'timer'
require_relative 'touch'
require_relative 'version'
require_relative 'video'

require_relative 'sdl2_image'
require_relative 'sdl2_mixer'
require_relative 'sdl2_ttf'
require_relative 'sdl2_gfx'

module SDL2

  extend Fiddle::Importer

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2_import_done = false

  # Load native library.
  def self.load_lib(libpath, image_libpath: nil, mixer_libpath: nil, ttf_libpath: nil, gfx_libpath: nil)
    unless @@sdl2_import_done
      dlload(libpath)
      import_symbols()
    end
    if mixer_libpath != nil
      load_mixer_lib(mixer_libpath)
    end
    if image_libpath != nil
      load_image_lib(image_libpath)
    end
    if ttf_libpath != nil
      load_ttf_lib(ttf_libpath)
    end
    if gfx_libpath != nil
      load_gfx_lib(gfx_libpath)
    end
  end


=begin # Using callback functionality may cause interpreter crash.
  @@sdl2_cb_signature = {
    :SDL_TimerCallback => "unsigned int SDL_TimerCallback(unsigned int, void*)",
  }

  def self.create_callback( sym, proc=nil, &blk )
    if block_given?
      return bind( @@sdl2_cb_signature[sym], nil, &blk )
    else
      return bind( @@sdl2_cb_signature[sym], nil, &proc )
    end
  end
=end

  def self.import_symbols

    self.import_main_symbols
    self.import_audio_symbols
    self.import_blendmode_symbols
    self.import_clipboard_symbols
    self.import_cpuinfo_symbols
    self.import_error_symbols
    self.import_events_symbols
    self.import_filesystem_symbols
    self.import_hints_symbols
    self.import_gamecontroller_symbols
    self.import_gesture_symbols
    self.import_joystick_symbols
    self.import_keyboard_symbols
    self.import_messagebox_symbols
    self.import_mouse_symbols
    self.import_pixels_symbols
    self.import_platform_symbols
    self.import_rect_symbols
    self.import_render_symbols
    self.import_rwops_symbols
    self.import_surface_symbols
    self.import_syswm_symbols
    self.import_timer_symbols
    self.import_touch_symbols
    self.import_version_symbols
    self.import_video_symbols

    @@sdl2_import_done = true
  end

end

=begin
sdl2-bindings : Yet another SDL2 wrapper for Ruby
Copyright (c) 2015 vaiorabbit <http://twitter.com/vaiorabbit>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
=end
