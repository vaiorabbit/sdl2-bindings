# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_guid'

module SDL
  extend FFI::Library
  # Define/Macro

  IPHONE_MAX_GFORCE = 5.0
  VIRTUAL_JOYSTICK_DESC_VERSION = 1
  JOYSTICK_AXIS_MAX = 32767
  JOYSTICK_AXIS_MIN = -32768
  HAT_CENTERED = 0x00
  HAT_UP = 0x01
  HAT_RIGHT = 0x02
  HAT_DOWN = 0x04
  HAT_LEFT = 0x08
  HAT_RIGHTUP = (HAT_RIGHT | HAT_UP)
  HAT_RIGHTDOWN = (HAT_RIGHT | HAT_DOWN)
  HAT_LEFTUP = (HAT_LEFT | HAT_UP)
  HAT_LEFTDOWN = (HAT_LEFT | HAT_DOWN)

  # Enum

  JOYSTICK_TYPE_UNKNOWN = 0
  JOYSTICK_TYPE_GAMECONTROLLER = 1
  JOYSTICK_TYPE_WHEEL = 2
  JOYSTICK_TYPE_ARCADE_STICK = 3
  JOYSTICK_TYPE_FLIGHT_STICK = 4
  JOYSTICK_TYPE_DANCE_PAD = 5
  JOYSTICK_TYPE_GUITAR = 6
  JOYSTICK_TYPE_DRUM_KIT = 7
  JOYSTICK_TYPE_ARCADE_PAD = 8
  JOYSTICK_TYPE_THROTTLE = 9
  JOYSTICK_POWER_UNKNOWN = -1
  JOYSTICK_POWER_EMPTY = 0
  JOYSTICK_POWER_LOW = 1
  JOYSTICK_POWER_MEDIUM = 2
  JOYSTICK_POWER_FULL = 3
  JOYSTICK_POWER_WIRED = 4
  JOYSTICK_POWER_MAX = 5

  # Typedef


  JoystickGUID = SDL::GUID

  typedef :int, :SDL_JoystickID
  typedef :int, :SDL_JoystickType
  typedef :int, :SDL_JoystickPowerLevel

  # Struct

  class VirtualJoystickDesc < FFI::Struct
    layout(
      :version, :ushort,
      :type, :ushort,
      :naxes, :ushort,
      :nbuttons, :ushort,
      :nhats, :ushort,
      :vendor_id, :ushort,
      :product_id, :ushort,
      :padding, :ushort,
      :button_mask, :uint,
      :axis_mask, :uint,
      :name, :pointer,
      :userdata, :pointer,
      :Update, :pointer,
      :SetPlayerIndex, :pointer,
      :Rumble, :pointer,
      :RumbleTriggers, :pointer,
      :SetLED, :pointer,
      :SendEffect, :pointer,
    )
  end


  # Function

  def self.setup_joystick_symbols(output_error = false)
    symbols = [
      :SDL_LockJoysticks,
      :SDL_UnlockJoysticks,
      :SDL_NumJoysticks,
      :SDL_JoystickNameForIndex,
      :SDL_JoystickPathForIndex,
      :SDL_JoystickGetDevicePlayerIndex,
      :SDL_JoystickGetDeviceGUID,
      :SDL_JoystickGetDeviceVendor,
      :SDL_JoystickGetDeviceProduct,
      :SDL_JoystickGetDeviceProductVersion,
      :SDL_JoystickGetDeviceType,
      :SDL_JoystickGetDeviceInstanceID,
      :SDL_JoystickOpen,
      :SDL_JoystickFromInstanceID,
      :SDL_JoystickFromPlayerIndex,
      :SDL_JoystickAttachVirtual,
      :SDL_JoystickAttachVirtualEx,
      :SDL_JoystickDetachVirtual,
      :SDL_JoystickIsVirtual,
      :SDL_JoystickSetVirtualAxis,
      :SDL_JoystickSetVirtualButton,
      :SDL_JoystickSetVirtualHat,
      :SDL_JoystickName,
      :SDL_JoystickPath,
      :SDL_JoystickGetPlayerIndex,
      :SDL_JoystickSetPlayerIndex,
      :SDL_JoystickGetGUID,
      :SDL_JoystickGetVendor,
      :SDL_JoystickGetProduct,
      :SDL_JoystickGetProductVersion,
      :SDL_JoystickGetFirmwareVersion,
      :SDL_JoystickGetSerial,
      :SDL_JoystickGetType,
      :SDL_JoystickGetGUIDString,
      :SDL_JoystickGetGUIDFromString,
      :SDL_GetJoystickGUIDInfo,
      :SDL_JoystickGetAttached,
      :SDL_JoystickInstanceID,
      :SDL_JoystickNumAxes,
      :SDL_JoystickNumBalls,
      :SDL_JoystickNumHats,
      :SDL_JoystickNumButtons,
      :SDL_JoystickUpdate,
      :SDL_JoystickEventState,
      :SDL_JoystickGetAxis,
      :SDL_JoystickGetAxisInitialState,
      :SDL_JoystickGetHat,
      :SDL_JoystickGetBall,
      :SDL_JoystickGetButton,
      :SDL_JoystickRumble,
      :SDL_JoystickRumbleTriggers,
      :SDL_JoystickHasLED,
      :SDL_JoystickHasRumble,
      :SDL_JoystickHasRumbleTriggers,
      :SDL_JoystickSetLED,
      :SDL_JoystickSendEffect,
      :SDL_JoystickClose,
      :SDL_JoystickCurrentPowerLevel,
    ]
    apis = {
      :SDL_LockJoysticks => :LockJoysticks,
      :SDL_UnlockJoysticks => :UnlockJoysticks,
      :SDL_NumJoysticks => :NumJoysticks,
      :SDL_JoystickNameForIndex => :JoystickNameForIndex,
      :SDL_JoystickPathForIndex => :JoystickPathForIndex,
      :SDL_JoystickGetDevicePlayerIndex => :JoystickGetDevicePlayerIndex,
      :SDL_JoystickGetDeviceGUID => :JoystickGetDeviceGUID,
      :SDL_JoystickGetDeviceVendor => :JoystickGetDeviceVendor,
      :SDL_JoystickGetDeviceProduct => :JoystickGetDeviceProduct,
      :SDL_JoystickGetDeviceProductVersion => :JoystickGetDeviceProductVersion,
      :SDL_JoystickGetDeviceType => :JoystickGetDeviceType,
      :SDL_JoystickGetDeviceInstanceID => :JoystickGetDeviceInstanceID,
      :SDL_JoystickOpen => :JoystickOpen,
      :SDL_JoystickFromInstanceID => :JoystickFromInstanceID,
      :SDL_JoystickFromPlayerIndex => :JoystickFromPlayerIndex,
      :SDL_JoystickAttachVirtual => :JoystickAttachVirtual,
      :SDL_JoystickAttachVirtualEx => :JoystickAttachVirtualEx,
      :SDL_JoystickDetachVirtual => :JoystickDetachVirtual,
      :SDL_JoystickIsVirtual => :JoystickIsVirtual,
      :SDL_JoystickSetVirtualAxis => :JoystickSetVirtualAxis,
      :SDL_JoystickSetVirtualButton => :JoystickSetVirtualButton,
      :SDL_JoystickSetVirtualHat => :JoystickSetVirtualHat,
      :SDL_JoystickName => :JoystickName,
      :SDL_JoystickPath => :JoystickPath,
      :SDL_JoystickGetPlayerIndex => :JoystickGetPlayerIndex,
      :SDL_JoystickSetPlayerIndex => :JoystickSetPlayerIndex,
      :SDL_JoystickGetGUID => :JoystickGetGUID,
      :SDL_JoystickGetVendor => :JoystickGetVendor,
      :SDL_JoystickGetProduct => :JoystickGetProduct,
      :SDL_JoystickGetProductVersion => :JoystickGetProductVersion,
      :SDL_JoystickGetFirmwareVersion => :JoystickGetFirmwareVersion,
      :SDL_JoystickGetSerial => :JoystickGetSerial,
      :SDL_JoystickGetType => :JoystickGetType,
      :SDL_JoystickGetGUIDString => :JoystickGetGUIDString,
      :SDL_JoystickGetGUIDFromString => :JoystickGetGUIDFromString,
      :SDL_GetJoystickGUIDInfo => :GetJoystickGUIDInfo,
      :SDL_JoystickGetAttached => :JoystickGetAttached,
      :SDL_JoystickInstanceID => :JoystickInstanceID,
      :SDL_JoystickNumAxes => :JoystickNumAxes,
      :SDL_JoystickNumBalls => :JoystickNumBalls,
      :SDL_JoystickNumHats => :JoystickNumHats,
      :SDL_JoystickNumButtons => :JoystickNumButtons,
      :SDL_JoystickUpdate => :JoystickUpdate,
      :SDL_JoystickEventState => :JoystickEventState,
      :SDL_JoystickGetAxis => :JoystickGetAxis,
      :SDL_JoystickGetAxisInitialState => :JoystickGetAxisInitialState,
      :SDL_JoystickGetHat => :JoystickGetHat,
      :SDL_JoystickGetBall => :JoystickGetBall,
      :SDL_JoystickGetButton => :JoystickGetButton,
      :SDL_JoystickRumble => :JoystickRumble,
      :SDL_JoystickRumbleTriggers => :JoystickRumbleTriggers,
      :SDL_JoystickHasLED => :JoystickHasLED,
      :SDL_JoystickHasRumble => :JoystickHasRumble,
      :SDL_JoystickHasRumbleTriggers => :JoystickHasRumbleTriggers,
      :SDL_JoystickSetLED => :JoystickSetLED,
      :SDL_JoystickSendEffect => :JoystickSendEffect,
      :SDL_JoystickClose => :JoystickClose,
      :SDL_JoystickCurrentPowerLevel => :JoystickCurrentPowerLevel,
    }
    args = {
      :SDL_LockJoysticks => [],
      :SDL_UnlockJoysticks => [],
      :SDL_NumJoysticks => [],
      :SDL_JoystickNameForIndex => [:int],
      :SDL_JoystickPathForIndex => [:int],
      :SDL_JoystickGetDevicePlayerIndex => [:int],
      :SDL_JoystickGetDeviceGUID => [:int],
      :SDL_JoystickGetDeviceVendor => [:int],
      :SDL_JoystickGetDeviceProduct => [:int],
      :SDL_JoystickGetDeviceProductVersion => [:int],
      :SDL_JoystickGetDeviceType => [:int],
      :SDL_JoystickGetDeviceInstanceID => [:int],
      :SDL_JoystickOpen => [:int],
      :SDL_JoystickFromInstanceID => [:int],
      :SDL_JoystickFromPlayerIndex => [:int],
      :SDL_JoystickAttachVirtual => [:int, :int, :int, :int],
      :SDL_JoystickAttachVirtualEx => [:pointer],
      :SDL_JoystickDetachVirtual => [:int],
      :SDL_JoystickIsVirtual => [:int],
      :SDL_JoystickSetVirtualAxis => [:pointer, :int, :short],
      :SDL_JoystickSetVirtualButton => [:pointer, :int, :uchar],
      :SDL_JoystickSetVirtualHat => [:pointer, :int, :uchar],
      :SDL_JoystickName => [:pointer],
      :SDL_JoystickPath => [:pointer],
      :SDL_JoystickGetPlayerIndex => [:pointer],
      :SDL_JoystickSetPlayerIndex => [:pointer, :int],
      :SDL_JoystickGetGUID => [:pointer],
      :SDL_JoystickGetVendor => [:pointer],
      :SDL_JoystickGetProduct => [:pointer],
      :SDL_JoystickGetProductVersion => [:pointer],
      :SDL_JoystickGetFirmwareVersion => [:pointer],
      :SDL_JoystickGetSerial => [:pointer],
      :SDL_JoystickGetType => [:pointer],
      :SDL_JoystickGetGUIDString => [JoystickGUID.by_value, :pointer, :int],
      :SDL_JoystickGetGUIDFromString => [:pointer],
      :SDL_GetJoystickGUIDInfo => [JoystickGUID.by_value, :pointer, :pointer, :pointer, :pointer],
      :SDL_JoystickGetAttached => [:pointer],
      :SDL_JoystickInstanceID => [:pointer],
      :SDL_JoystickNumAxes => [:pointer],
      :SDL_JoystickNumBalls => [:pointer],
      :SDL_JoystickNumHats => [:pointer],
      :SDL_JoystickNumButtons => [:pointer],
      :SDL_JoystickUpdate => [],
      :SDL_JoystickEventState => [:int],
      :SDL_JoystickGetAxis => [:pointer, :int],
      :SDL_JoystickGetAxisInitialState => [:pointer, :int, :pointer],
      :SDL_JoystickGetHat => [:pointer, :int],
      :SDL_JoystickGetBall => [:pointer, :int, :pointer, :pointer],
      :SDL_JoystickGetButton => [:pointer, :int],
      :SDL_JoystickRumble => [:pointer, :ushort, :ushort, :uint],
      :SDL_JoystickRumbleTriggers => [:pointer, :ushort, :ushort, :uint],
      :SDL_JoystickHasLED => [:pointer],
      :SDL_JoystickHasRumble => [:pointer],
      :SDL_JoystickHasRumbleTriggers => [:pointer],
      :SDL_JoystickSetLED => [:pointer, :uchar, :uchar, :uchar],
      :SDL_JoystickSendEffect => [:pointer, :pointer, :int],
      :SDL_JoystickClose => [:pointer],
      :SDL_JoystickCurrentPowerLevel => [:pointer],
    }
    retvals = {
      :SDL_LockJoysticks => :void,
      :SDL_UnlockJoysticks => :void,
      :SDL_NumJoysticks => :int,
      :SDL_JoystickNameForIndex => :pointer,
      :SDL_JoystickPathForIndex => :pointer,
      :SDL_JoystickGetDevicePlayerIndex => :int,
      :SDL_JoystickGetDeviceGUID => JoystickGUID.by_value,
      :SDL_JoystickGetDeviceVendor => :ushort,
      :SDL_JoystickGetDeviceProduct => :ushort,
      :SDL_JoystickGetDeviceProductVersion => :ushort,
      :SDL_JoystickGetDeviceType => :int,
      :SDL_JoystickGetDeviceInstanceID => :int,
      :SDL_JoystickOpen => :pointer,
      :SDL_JoystickFromInstanceID => :pointer,
      :SDL_JoystickFromPlayerIndex => :pointer,
      :SDL_JoystickAttachVirtual => :int,
      :SDL_JoystickAttachVirtualEx => :int,
      :SDL_JoystickDetachVirtual => :int,
      :SDL_JoystickIsVirtual => :int,
      :SDL_JoystickSetVirtualAxis => :int,
      :SDL_JoystickSetVirtualButton => :int,
      :SDL_JoystickSetVirtualHat => :int,
      :SDL_JoystickName => :pointer,
      :SDL_JoystickPath => :pointer,
      :SDL_JoystickGetPlayerIndex => :int,
      :SDL_JoystickSetPlayerIndex => :void,
      :SDL_JoystickGetGUID => JoystickGUID.by_value,
      :SDL_JoystickGetVendor => :ushort,
      :SDL_JoystickGetProduct => :ushort,
      :SDL_JoystickGetProductVersion => :ushort,
      :SDL_JoystickGetFirmwareVersion => :ushort,
      :SDL_JoystickGetSerial => :pointer,
      :SDL_JoystickGetType => :int,
      :SDL_JoystickGetGUIDString => :void,
      :SDL_JoystickGetGUIDFromString => JoystickGUID.by_value,
      :SDL_GetJoystickGUIDInfo => :void,
      :SDL_JoystickGetAttached => :int,
      :SDL_JoystickInstanceID => :int,
      :SDL_JoystickNumAxes => :int,
      :SDL_JoystickNumBalls => :int,
      :SDL_JoystickNumHats => :int,
      :SDL_JoystickNumButtons => :int,
      :SDL_JoystickUpdate => :void,
      :SDL_JoystickEventState => :int,
      :SDL_JoystickGetAxis => :short,
      :SDL_JoystickGetAxisInitialState => :int,
      :SDL_JoystickGetHat => :uchar,
      :SDL_JoystickGetBall => :int,
      :SDL_JoystickGetButton => :uchar,
      :SDL_JoystickRumble => :int,
      :SDL_JoystickRumbleTriggers => :int,
      :SDL_JoystickHasLED => :int,
      :SDL_JoystickHasRumble => :int,
      :SDL_JoystickHasRumbleTriggers => :int,
      :SDL_JoystickSetLED => :int,
      :SDL_JoystickSendEffect => :int,
      :SDL_JoystickClose => :void,
      :SDL_JoystickCurrentPowerLevel => :int,
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

