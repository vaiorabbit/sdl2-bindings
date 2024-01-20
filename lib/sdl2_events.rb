# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_keyboard'

module SDL
  extend FFI::Library
  # Define/Macro

  RELEASED = 0
  PRESSED = 1
  TEXTEDITINGEVENT_TEXT_SIZE = 32
  TEXTINPUTEVENT_TEXT_SIZE = 32
  QUERY = -1
  IGNORE = 0
  DISABLE = 0
  ENABLE = 1

  # Enum

  FIRSTEVENT = 0
  QUIT = 256
  APP_TERMINATING = 257
  APP_LOWMEMORY = 258
  APP_WILLENTERBACKGROUND = 259
  APP_DIDENTERBACKGROUND = 260
  APP_WILLENTERFOREGROUND = 261
  APP_DIDENTERFOREGROUND = 262
  LOCALECHANGED = 263
  DISPLAYEVENT = 336
  WINDOWEVENT = 512
  SYSWMEVENT = 513
  KEYDOWN = 768
  KEYUP = 769
  TEXTEDITING = 770
  TEXTINPUT = 771
  KEYMAPCHANGED = 772
  TEXTEDITING_EXT = 773
  MOUSEMOTION = 1024
  MOUSEBUTTONDOWN = 1025
  MOUSEBUTTONUP = 1026
  MOUSEWHEEL = 1027
  JOYAXISMOTION = 1536
  JOYBALLMOTION = 1537
  JOYHATMOTION = 1538
  JOYBUTTONDOWN = 1539
  JOYBUTTONUP = 1540
  JOYDEVICEADDED = 1541
  JOYDEVICEREMOVED = 1542
  JOYBATTERYUPDATED = 1543
  CONTROLLERAXISMOTION = 1616
  CONTROLLERBUTTONDOWN = 1617
  CONTROLLERBUTTONUP = 1618
  CONTROLLERDEVICEADDED = 1619
  CONTROLLERDEVICEREMOVED = 1620
  CONTROLLERDEVICEREMAPPED = 1621
  CONTROLLERTOUCHPADDOWN = 1622
  CONTROLLERTOUCHPADMOTION = 1623
  CONTROLLERTOUCHPADUP = 1624
  CONTROLLERSENSORUPDATE = 1625
  CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3 = 1626
  CONTROLLERSTEAMHANDLEUPDATED = 1627
  FINGERDOWN = 1792
  FINGERUP = 1793
  FINGERMOTION = 1794
  DOLLARGESTURE = 2048
  DOLLARRECORD = 2049
  MULTIGESTURE = 2050
  CLIPBOARDUPDATE = 2304
  DROPFILE = 4096
  DROPTEXT = 4097
  DROPBEGIN = 4098
  DROPCOMPLETE = 4099
  AUDIODEVICEADDED = 4352
  AUDIODEVICEREMOVED = 4353
  SENSORUPDATE = 4608
  RENDER_TARGETS_RESET = 8192
  RENDER_DEVICE_RESET = 8193
  POLLSENTINEL = 32512
  USEREVENT = 32768
  LASTEVENT = 65535
  ADDEVENT = 0
  PEEKEVENT = 1
  GETEVENT = 2

  # Typedef

  typedef :int, :SDL_EventType
  typedef :int, :SDL_eventaction
  callback :SDL_EventFilter, [:pointer, :pointer], :int

  # Struct

  class CommonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
    )
  end

  class DisplayEvent < FFI::Struct
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

  class WindowEvent < FFI::Struct
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

  class KeyboardEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :state, :uchar,
      :repeat, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :keysym, Keysym,
    )
  end

  class TextEditingEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :text, [:char, 32],
      :start, :int,
      :length, :int,
    )
  end

  class TextEditingExtEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :text, :pointer,
      :start, :int,
      :length, :int,
    )
  end

  class TextInputEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :text, [:char, 32],
    )
  end

  class MouseMotionEvent < FFI::Struct
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

  class MouseButtonEvent < FFI::Struct
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

  class MouseWheelEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :which, :uint,
      :x, :int,
      :y, :int,
      :direction, :uint,
      :preciseX, :float,
      :preciseY, :float,
      :mouseX, :int,
      :mouseY, :int,
    )
  end

  class JoyAxisEvent < FFI::Struct
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

  class JoyBallEvent < FFI::Struct
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

  class JoyHatEvent < FFI::Struct
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

  class JoyButtonEvent < FFI::Struct
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

  class JoyDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
    )
  end

  class JoyBatteryEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :level, :int,
    )
  end

  class ControllerAxisEvent < FFI::Struct
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

  class ControllerButtonEvent < FFI::Struct
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

  class ControllerDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
    )
  end

  class ControllerTouchpadEvent < FFI::Struct
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

  class ControllerSensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :sensor, :int,
      :data, [:float, 3],
      :timestamp_us, :ulong_long,
    )
  end

  class AudioDeviceEvent < FFI::Struct
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

  class TouchFingerEvent < FFI::Struct
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

  class MultiGestureEvent < FFI::Struct
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

  class DollarGestureEvent < FFI::Struct
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

  class DropEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :file, :pointer,
      :windowID, :uint,
    )
  end

  class SensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :which, :int,
      :data, [:float, 6],
      :timestamp_us, :ulong_long,
    )
  end

  class QuitEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
    )
  end

  class UserEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :windowID, :uint,
      :code, :int,
      :data1, :pointer,
      :data2, :pointer,
    )
  end

  class SysWMEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :uint,
      :msg, :pointer,
    )
  end

  class Event < FFI::Union
    layout(
      :type, :uint,
      :common, CommonEvent,
      :display, DisplayEvent,
      :window, WindowEvent,
      :key, KeyboardEvent,
      :edit, TextEditingEvent,
      :editExt, TextEditingExtEvent,
      :text, TextInputEvent,
      :motion, MouseMotionEvent,
      :button, MouseButtonEvent,
      :wheel, MouseWheelEvent,
      :jaxis, JoyAxisEvent,
      :jball, JoyBallEvent,
      :jhat, JoyHatEvent,
      :jbutton, JoyButtonEvent,
      :jdevice, JoyDeviceEvent,
      :jbattery, JoyBatteryEvent,
      :caxis, ControllerAxisEvent,
      :cbutton, ControllerButtonEvent,
      :cdevice, ControllerDeviceEvent,
      :ctouchpad, ControllerTouchpadEvent,
      :csensor, ControllerSensorEvent,
      :adevice, AudioDeviceEvent,
      :sensor, SensorEvent,
      :quit, QuitEvent,
      :user, UserEvent,
      :syswm, SysWMEvent,
      :tfinger, TouchFingerEvent,
      :mgesture, MultiGestureEvent,
      :dgesture, DollarGestureEvent,
      :drop, DropEvent,
      :padding, [:uchar, 56],
    )
  end


  # Function

  def self.setup_events_symbols(output_error = false)
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
    apis = {
      :SDL_PumpEvents => :PumpEvents,
      :SDL_PeepEvents => :PeepEvents,
      :SDL_HasEvent => :HasEvent,
      :SDL_HasEvents => :HasEvents,
      :SDL_FlushEvent => :FlushEvent,
      :SDL_FlushEvents => :FlushEvents,
      :SDL_PollEvent => :PollEvent,
      :SDL_WaitEvent => :WaitEvent,
      :SDL_WaitEventTimeout => :WaitEventTimeout,
      :SDL_PushEvent => :PushEvent,
      :SDL_SetEventFilter => :SetEventFilter,
      :SDL_GetEventFilter => :GetEventFilter,
      :SDL_AddEventWatch => :AddEventWatch,
      :SDL_DelEventWatch => :DelEventWatch,
      :SDL_FilterEvents => :FilterEvents,
      :SDL_EventState => :EventState,
      :SDL_RegisterEvents => :RegisterEvents,
    }
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
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

