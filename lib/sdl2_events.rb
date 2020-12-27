# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_keyboard'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_RELEASED = 0
  SDL_PRESSED = 1
  SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32
  SDL_TEXTINPUTEVENT_TEXT_SIZE = 32
  SDL_QUERY = -1
  SDL_IGNORE = 0
  SDL_DISABLE = 0
  SDL_ENABLE = 1

  # Enum

  SDL_FIRSTEVENT = 0
  SDL_QUIT = 256
  SDL_APP_TERMINATING = 257
  SDL_APP_LOWMEMORY = 258
  SDL_APP_WILLENTERBACKGROUND = 259
  SDL_APP_DIDENTERBACKGROUND = 260
  SDL_APP_WILLENTERFOREGROUND = 261
  SDL_APP_DIDENTERFOREGROUND = 262
  SDL_LOCALECHANGED = 263
  SDL_DISPLAYEVENT = 336
  SDL_WINDOWEVENT = 512
  SDL_SYSWMEVENT = 513
  SDL_KEYDOWN = 768
  SDL_KEYUP = 769
  SDL_TEXTEDITING = 770
  SDL_TEXTINPUT = 771
  SDL_KEYMAPCHANGED = 772
  SDL_MOUSEMOTION = 1024
  SDL_MOUSEBUTTONDOWN = 1025
  SDL_MOUSEBUTTONUP = 1026
  SDL_MOUSEWHEEL = 1027
  SDL_JOYAXISMOTION = 1536
  SDL_JOYBALLMOTION = 1537
  SDL_JOYHATMOTION = 1538
  SDL_JOYBUTTONDOWN = 1539
  SDL_JOYBUTTONUP = 1540
  SDL_JOYDEVICEADDED = 1541
  SDL_JOYDEVICEREMOVED = 1542
  SDL_CONTROLLERAXISMOTION = 1616
  SDL_CONTROLLERBUTTONDOWN = 1617
  SDL_CONTROLLERBUTTONUP = 1618
  SDL_CONTROLLERDEVICEADDED = 1619
  SDL_CONTROLLERDEVICEREMOVED = 1620
  SDL_CONTROLLERDEVICEREMAPPED = 1621
  SDL_CONTROLLERTOUCHPADDOWN = 1622
  SDL_CONTROLLERTOUCHPADMOTION = 1623
  SDL_CONTROLLERTOUCHPADUP = 1624
  SDL_CONTROLLERSENSORUPDATE = 1625
  SDL_FINGERDOWN = 1792
  SDL_FINGERUP = 1793
  SDL_FINGERMOTION = 1794
  SDL_DOLLARGESTURE = 2048
  SDL_DOLLARRECORD = 2049
  SDL_MULTIGESTURE = 2050
  SDL_CLIPBOARDUPDATE = 2304
  SDL_DROPFILE = 4096
  SDL_DROPTEXT = 4097
  SDL_DROPBEGIN = 4098
  SDL_DROPCOMPLETE = 4099
  SDL_AUDIODEVICEADDED = 4352
  SDL_AUDIODEVICEREMOVED = 4353
  SDL_SENSORUPDATE = 4608
  SDL_RENDER_TARGETS_RESET = 8192
  SDL_RENDER_DEVICE_RESET = 8193
  SDL_USEREVENT = 32768
  SDL_LASTEVENT = 65535
  SDL_ADDEVENT = 0
  SDL_PEEKEVENT = 1
  SDL_GETEVENT = 2

  # Typedef

  typedef :int, :SDL_EventType
  typedef :int, :SDL_compile_time_assert_SDL_Event
  typedef :int, :SDL_eventaction
  callback :SDL_EventFilter, [:pointer, :pointer], :int

  # Struct

  class SDL_CommonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
    )
  end

  class SDL_DisplayEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :display, :uint,
      :event, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :data1, :int,
    )
  end

  class SDL_WindowEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :event, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :data1, :int,
      :data2, :int,
    )
  end

  class SDL_KeyboardEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :state, :uchar,
      :repeat, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :keysym, SDL_Keysym,
    )
  end

  class SDL_TextEditingEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :text, [:char, 32],
      :start, :int,
      :length, :int,
    )
  end

  class SDL_TextInputEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :text, [:char, 32],
    )
  end

  class SDL_MouseMotionEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :which, :uint,
      :state, :uint,
      :x, :int,
      :y, :int,
      :xrel, :int,
      :yrel, :int,
    )
  end

  class SDL_MouseButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :which, :uint,
      :button, :uchar,
      :state, :uchar,
      :clicks, :uchar,
      :padding1, :uchar,
      :x, :int,
      :y, :int,
    )
  end

  class SDL_MouseWheelEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :which, :uint,
      :x, :int,
      :y, :int,
      :direction, :uint,
    )
  end

  class SDL_JoyAxisEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :axis, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :value, :short,
      :padding4, :ushort,
    )
  end

  class SDL_JoyBallEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :ball, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :xrel, :short,
      :yrel, :short,
    )
  end

  class SDL_JoyHatEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :hat, :uchar,
      :value, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class SDL_JoyButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :button, :uchar,
      :state, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class SDL_JoyDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
    )
  end

  class SDL_ControllerAxisEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :axis, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :value, :short,
      :padding4, :ushort,
    )
  end

  class SDL_ControllerButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :button, :uchar,
      :state, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class SDL_ControllerDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
    )
  end

  class SDL_ControllerTouchpadEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :touchpad, :int,
      :finger, :int,
      :x, :float,
      :y, :float,
      :pressure, :float,
    )
  end

  class SDL_ControllerSensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :sensor, :int,
      :data, [:float, 3],
    )
  end

  class SDL_AudioDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :uint,
      :iscapture, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
    )
  end

  class SDL_TouchFingerEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :touchId, :long_long,
      :fingerId, :long_long,
      :x, :float,
      :y, :float,
      :dx, :float,
      :dy, :float,
      :pressure, :float,
      :windowID, :uint,
    )
  end

  class SDL_MultiGestureEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :touchId, :long_long,
      :dTheta, :float,
      :dDist, :float,
      :x, :float,
      :y, :float,
      :numFingers, :ushort,
      :padding, :ushort,
    )
  end

  class SDL_DollarGestureEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :touchId, :long_long,
      :gestureId, :long_long,
      :numFingers, :uint,
      :error, :float,
      :x, :float,
      :y, :float,
    )
  end

  class SDL_DropEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :file, :pointer,
      :windowID, :uint,
    )
  end

  class SDL_SensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :data, [:float, 6],
    )
  end

  class SDL_QuitEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
    )
  end

  class SDL_OSEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
    )
  end

  class SDL_UserEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :code, :int,
      :data1, :pointer,
      :data2, :pointer,
    )
  end

  class SDL_SysWMEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :msg, :pointer,
    )
  end

  class SDL_Event < FFI::Union
    layout(
      :type, :uint,
      :common, SDL_CommonEvent,
      :display, SDL_DisplayEvent,
      :window, SDL_WindowEvent,
      :key, SDL_KeyboardEvent,
      :edit, SDL_TextEditingEvent,
      :text, SDL_TextInputEvent,
      :motion, SDL_MouseMotionEvent,
      :button, SDL_MouseButtonEvent,
      :wheel, SDL_MouseWheelEvent,
      :jaxis, SDL_JoyAxisEvent,
      :jball, SDL_JoyBallEvent,
      :jhat, SDL_JoyHatEvent,
      :jbutton, SDL_JoyButtonEvent,
      :jdevice, SDL_JoyDeviceEvent,
      :caxis, SDL_ControllerAxisEvent,
      :cbutton, SDL_ControllerButtonEvent,
      :cdevice, SDL_ControllerDeviceEvent,
      :ctouchpad, SDL_ControllerTouchpadEvent,
      :csensor, SDL_ControllerSensorEvent,
      :adevice, SDL_AudioDeviceEvent,
      :sensor, SDL_SensorEvent,
      :quit, SDL_QuitEvent,
      :user, SDL_UserEvent,
      :syswm, SDL_SysWMEvent,
      :tfinger, SDL_TouchFingerEvent,
      :mgesture, SDL_MultiGestureEvent,
      :dgesture, SDL_DollarGestureEvent,
      :drop, SDL_DropEvent,
      :padding, [:uchar, 56],
    )
  end


  # Function

  def self.setup_events_symbols()
    symbols = [
      :SDL_PumpEvents,
      :SDL_PeepEvents,
      :SDL_HasEvent,
      :SDL_HasEvents,
      :SDL_FlushEvent,
      :SDL_FlushEvents,
      :SDL_PollEvent,
      :SDL_WaitEvent,
      :SDL_WaitEventTimeout,
      :SDL_PushEvent,
      :SDL_SetEventFilter,
      :SDL_GetEventFilter,
      :SDL_AddEventWatch,
      :SDL_DelEventWatch,
      :SDL_FilterEvents,
      :SDL_EventState,
      :SDL_RegisterEvents,
    ]
    args = {
      :SDL_PumpEvents => [],
      :SDL_PeepEvents => [:pointer, :int, :int, :uint, :uint],
      :SDL_HasEvent => [:uint],
      :SDL_HasEvents => [:uint, :uint],
      :SDL_FlushEvent => [:uint],
      :SDL_FlushEvents => [:uint, :uint],
      :SDL_PollEvent => [:pointer],
      :SDL_WaitEvent => [:pointer],
      :SDL_WaitEventTimeout => [:pointer, :int],
      :SDL_PushEvent => [:pointer],
      :SDL_SetEventFilter => [:SDL_EventFilter, :pointer],
      :SDL_GetEventFilter => [:pointer, :pointer],
      :SDL_AddEventWatch => [:SDL_EventFilter, :pointer],
      :SDL_DelEventWatch => [:SDL_EventFilter, :pointer],
      :SDL_FilterEvents => [:SDL_EventFilter, :pointer],
      :SDL_EventState => [:uint, :int],
      :SDL_RegisterEvents => [:int],
    }
    retvals = {
      :SDL_PumpEvents => :void,
      :SDL_PeepEvents => :int,
      :SDL_HasEvent => :int,
      :SDL_HasEvents => :int,
      :SDL_FlushEvent => :void,
      :SDL_FlushEvents => :void,
      :SDL_PollEvent => :int,
      :SDL_WaitEvent => :int,
      :SDL_WaitEventTimeout => :int,
      :SDL_PushEvent => :int,
      :SDL_SetEventFilter => :void,
      :SDL_GetEventFilter => :int,
      :SDL_AddEventWatch => :void,
      :SDL_DelEventWatch => :void,
      :SDL_FilterEvents => :void,
      :SDL_EventState => :uchar,
      :SDL_RegisterEvents => :uint,
    }
    symbols.each do |sym|
      begin
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

