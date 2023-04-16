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

  # Enum

  EVENT_FIRST = 0
  EVENT_QUIT = 256
  EVENT_TERMINATING = 257
  EVENT_LOW_MEMORY = 258
  EVENT_WILL_ENTER_BACKGROUND = 259
  EVENT_DID_ENTER_BACKGROUND = 260
  EVENT_WILL_ENTER_FOREGROUND = 261
  EVENT_DID_ENTER_FOREGROUND = 262
  EVENT_LOCALE_CHANGED = 263
  EVENT_SYSTEM_THEME_CHANGED = 264
  EVENT_DISPLAY_ORIENTATION = 337
  EVENT_DISPLAY_CONNECTED = 338
  EVENT_DISPLAY_DISCONNECTED = 339
  EVENT_DISPLAY_MOVED = 340
  EVENT_DISPLAY_SCALE_CHANGED = 341
  EVENT_DISPLAY_FIRST = 337
  EVENT_DISPLAY_LAST = 341
  EVENT_SYSWM = 513
  EVENT_WINDOW_SHOWN = 514
  EVENT_WINDOW_HIDDEN = 515
  EVENT_WINDOW_EXPOSED = 516
  EVENT_WINDOW_MOVED = 517
  EVENT_WINDOW_RESIZED = 518
  EVENT_WINDOW_PIXEL_SIZE_CHANGED = 519
  EVENT_WINDOW_MINIMIZED = 520
  EVENT_WINDOW_MAXIMIZED = 521
  EVENT_WINDOW_RESTORED = 522
  EVENT_WINDOW_MOUSE_ENTER = 523
  EVENT_WINDOW_MOUSE_LEAVE = 524
  EVENT_WINDOW_FOCUS_GAINED = 525
  EVENT_WINDOW_FOCUS_LOST = 526
  EVENT_WINDOW_CLOSE_REQUESTED = 527
  EVENT_WINDOW_TAKE_FOCUS = 528
  EVENT_WINDOW_HIT_TEST = 529
  EVENT_WINDOW_ICCPROF_CHANGED = 530
  EVENT_WINDOW_DISPLAY_CHANGED = 531
  EVENT_WINDOW_FIRST = 514
  EVENT_WINDOW_LAST = 531
  EVENT_KEY_DOWN = 768
  EVENT_KEY_UP = 769
  EVENT_TEXT_EDITING = 770
  EVENT_TEXT_INPUT = 771
  EVENT_KEYMAP_CHANGED = 772
  EVENT_TEXT_EDITING_EXT = 773
  EVENT_MOUSE_MOTION = 1024
  EVENT_MOUSE_BUTTON_DOWN = 1025
  EVENT_MOUSE_BUTTON_UP = 1026
  EVENT_MOUSE_WHEEL = 1027
  EVENT_JOYSTICK_AXIS_MOTION = 1536
  EVENT_JOYSTICK_HAT_MOTION = 1538
  EVENT_JOYSTICK_BUTTON_DOWN = 1539
  EVENT_JOYSTICK_BUTTON_UP = 1540
  EVENT_JOYSTICK_ADDED = 1541
  EVENT_JOYSTICK_REMOVED = 1542
  EVENT_JOYSTICK_BATTERY_UPDATED = 1543
  EVENT_GAMEPAD_AXIS_MOTION = 1616
  EVENT_GAMEPAD_BUTTON_DOWN = 1617
  EVENT_GAMEPAD_BUTTON_UP = 1618
  EVENT_GAMEPAD_ADDED = 1619
  EVENT_GAMEPAD_REMOVED = 1620
  EVENT_GAMEPAD_REMAPPED = 1621
  EVENT_GAMEPAD_TOUCHPAD_DOWN = 1622
  EVENT_GAMEPAD_TOUCHPAD_MOTION = 1623
  EVENT_GAMEPAD_TOUCHPAD_UP = 1624
  EVENT_GAMEPAD_SENSOR_UPDATE = 1625
  EVENT_FINGER_DOWN = 1792
  EVENT_FINGER_UP = 1793
  EVENT_FINGER_MOTION = 1794
  EVENT_CLIPBOARD_UPDATE = 2304
  EVENT_DROP_FILE = 4096
  EVENT_DROP_TEXT = 4097
  EVENT_DROP_BEGIN = 4098
  EVENT_DROP_COMPLETE = 4099
  EVENT_DROP_POSITION = 4100
  EVENT_AUDIO_DEVICE_ADDED = 4352
  EVENT_AUDIO_DEVICE_REMOVED = 4353
  EVENT_SENSOR_UPDATE = 4608
  EVENT_RENDER_TARGETS_RESET = 8192
  EVENT_RENDER_DEVICE_RESET = 8193
  EVENT_POLL_SENTINEL = 32512
  EVENT_USER = 32768
  EVENT_LAST = 65535
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
      :timestamp, :ulong_long,
    )
  end

  class DisplayEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :displayID, :uint,
      :data1, :int,
    )
  end

  class WindowEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :data1, :int,
      :data2, :int,
    )
  end

  class KeyboardEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
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
      :timestamp, :ulong_long,
      :windowID, :uint,
      :text, [:char, 32],
      :start, :int,
      :length, :int,
    )
  end

  class TextEditingExtEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :text, :pointer,
      :start, :int,
      :length, :int,
    )
  end

  class TextInputEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :text, [:char, 32],
    )
  end

  class MouseMotionEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :which, :uint,
      :state, :uint,
      :x, :float,
      :y, :float,
      :xrel, :float,
      :yrel, :float,
    )
  end

  class MouseButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :which, :uint,
      :button, :uchar,
      :state, :uchar,
      :clicks, :uchar,
      :padding, :uchar,
      :x, :float,
      :y, :float,
    )
  end

  class MouseWheelEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :which, :uint,
      :x, :float,
      :y, :float,
      :direction, :uint,
      :mouseX, :float,
      :mouseY, :float,
    )
  end

  class JoyAxisEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :axis, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :value, :short,
      :padding4, :ushort,
    )
  end

  class JoyHatEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :hat, :uchar,
      :value, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class JoyButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :button, :uchar,
      :state, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class JoyDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
    )
  end

  class JoyBatteryEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :level, :int,
    )
  end

  class GamepadAxisEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :axis, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
      :padding3, :uchar,
      :value, :short,
      :padding4, :ushort,
    )
  end

  class GamepadButtonEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :button, :uchar,
      :state, :uchar,
      :padding1, :uchar,
      :padding2, :uchar,
    )
  end

  class GamepadDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
    )
  end

  class GamepadTouchpadEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :touchpad, :int,
      :finger, :int,
      :x, :float,
      :y, :float,
      :pressure, :float,
    )
  end

  class GamepadSensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :sensor, :int,
      :data, [:float, 3],
      :sensor_timestamp, :ulong_long,
    )
  end

  class AudioDeviceEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
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
      :timestamp, :ulong_long,
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

  class DropEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :file, :pointer,
      :windowID, :uint,
      :x, :float,
      :y, :float,
    )
  end

  class SensorEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :which, :uint,
      :data, [:float, 6],
      :sensor_timestamp, :ulong_long,
    )
  end

  class QuitEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
    )
  end

  class OSEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
    )
  end

  class UserEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
      :windowID, :uint,
      :code, :int,
      :data1, :pointer,
      :data2, :pointer,
    )
  end

  class SysWMEvent < FFI::Struct
    layout(
      :type, :uint,
      :timestamp, :ulong_long,
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
      :jhat, JoyHatEvent,
      :jbutton, JoyButtonEvent,
      :jdevice, JoyDeviceEvent,
      :jbattery, JoyBatteryEvent,
      :gaxis, GamepadAxisEvent,
      :gbutton, GamepadButtonEvent,
      :gdevice, GamepadDeviceEvent,
      :gtouchpad, GamepadTouchpadEvent,
      :gsensor, GamepadSensorEvent,
      :adevice, AudioDeviceEvent,
      :sensor, SensorEvent,
      :quit, QuitEvent,
      :user, UserEvent,
      :syswm, SysWMEvent,
      :tfinger, TouchFingerEvent,
      :drop, DropEvent,
      :padding, [:uchar, 128],
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
      :SDL_SetEventEnabled,
      :SDL_EventEnabled,
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
      :SDL_SetEventEnabled => :SetEventEnabled,
      :SDL_EventEnabled => :EventEnabled,
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
      :SDL_SetEventEnabled => [:uint, :int],
      :SDL_EventEnabled => [:uint],
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
      :SDL_SetEventEnabled => :void,
      :SDL_EventEnabled => :int,
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

