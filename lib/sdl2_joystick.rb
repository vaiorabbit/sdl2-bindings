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

  JOYSTICK_AXIS_MAX = 32767
  JOYSTICK_AXIS_MIN = -32768
  IPHONE_MAX_GFORCE = 5.0
  VIRTUAL_JOYSTICK_DESC_VERSION = 1
  HAT_CENTERED = 0x00
  HAT_UP = 0x01
  HAT_RIGHT = 0x02
  HAT_DOWN = 0x04
  HAT_LEFT = 0x08
  HAT_RIGHTUP = HAT_RIGHT | HAT_UP
  HAT_RIGHTDOWN = HAT_RIGHT | HAT_DOWN
  HAT_LEFTUP = HAT_LEFT | HAT_UP
  HAT_LEFTDOWN = HAT_LEFT | HAT_DOWN

  # Enum

  JOYSTICK_TYPE_UNKNOWN = 0
  JOYSTICK_TYPE_GAMEPAD = 1
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

  typedef :uint, :SDL_JoystickID
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
      :SDL_GetJoysticks,
      :SDL_GetJoystickInstanceName,
      :SDL_GetJoystickInstancePath,
      :SDL_GetJoystickInstancePlayerIndex,
      :SDL_GetJoystickInstanceGUID,
      :SDL_GetJoystickInstanceVendor,
      :SDL_GetJoystickInstanceProduct,
      :SDL_GetJoystickInstanceProductVersion,
      :SDL_GetJoystickInstanceType,
      :SDL_OpenJoystick,
      :SDL_GetJoystickFromInstanceID,
      :SDL_GetJoystickFromPlayerIndex,
      :SDL_AttachVirtualJoystick,
      :SDL_AttachVirtualJoystickEx,
      :SDL_DetachVirtualJoystick,
      :SDL_IsJoystickVirtual,
      :SDL_SetJoystickVirtualAxis,
      :SDL_SetJoystickVirtualButton,
      :SDL_SetJoystickVirtualHat,
      :SDL_GetJoystickName,
      :SDL_GetJoystickPath,
      :SDL_GetJoystickPlayerIndex,
      :SDL_SetJoystickPlayerIndex,
      :SDL_GetJoystickGUID,
      :SDL_GetJoystickVendor,
      :SDL_GetJoystickProduct,
      :SDL_GetJoystickProductVersion,
      :SDL_GetJoystickFirmwareVersion,
      :SDL_GetJoystickSerial,
      :SDL_GetJoystickType,
      :SDL_GetJoystickGUIDString,
      :SDL_GetJoystickGUIDFromString,
      :SDL_GetJoystickGUIDInfo,
      :SDL_JoystickConnected,
      :SDL_GetJoystickInstanceID,
      :SDL_GetNumJoystickAxes,
      :SDL_GetNumJoystickHats,
      :SDL_GetNumJoystickButtons,
      :SDL_SetJoystickEventsEnabled,
      :SDL_JoystickEventsEnabled,
      :SDL_UpdateJoysticks,
      :SDL_GetJoystickAxis,
      :SDL_GetJoystickAxisInitialState,
      :SDL_GetJoystickHat,
      :SDL_GetJoystickButton,
      :SDL_RumbleJoystick,
      :SDL_RumbleJoystickTriggers,
      :SDL_JoystickHasLED,
      :SDL_JoystickHasRumble,
      :SDL_JoystickHasRumbleTriggers,
      :SDL_SetJoystickLED,
      :SDL_SendJoystickEffect,
      :SDL_CloseJoystick,
      :SDL_GetJoystickPowerLevel,
    ]
    apis = {
      :SDL_LockJoysticks => :LockJoysticks,
      :SDL_UnlockJoysticks => :UnlockJoysticks,
      :SDL_GetJoysticks => :GetJoysticks,
      :SDL_GetJoystickInstanceName => :GetJoystickInstanceName,
      :SDL_GetJoystickInstancePath => :GetJoystickInstancePath,
      :SDL_GetJoystickInstancePlayerIndex => :GetJoystickInstancePlayerIndex,
      :SDL_GetJoystickInstanceGUID => :GetJoystickInstanceGUID,
      :SDL_GetJoystickInstanceVendor => :GetJoystickInstanceVendor,
      :SDL_GetJoystickInstanceProduct => :GetJoystickInstanceProduct,
      :SDL_GetJoystickInstanceProductVersion => :GetJoystickInstanceProductVersion,
      :SDL_GetJoystickInstanceType => :GetJoystickInstanceType,
      :SDL_OpenJoystick => :OpenJoystick,
      :SDL_GetJoystickFromInstanceID => :GetJoystickFromInstanceID,
      :SDL_GetJoystickFromPlayerIndex => :GetJoystickFromPlayerIndex,
      :SDL_AttachVirtualJoystick => :AttachVirtualJoystick,
      :SDL_AttachVirtualJoystickEx => :AttachVirtualJoystickEx,
      :SDL_DetachVirtualJoystick => :DetachVirtualJoystick,
      :SDL_IsJoystickVirtual => :IsJoystickVirtual,
      :SDL_SetJoystickVirtualAxis => :SetJoystickVirtualAxis,
      :SDL_SetJoystickVirtualButton => :SetJoystickVirtualButton,
      :SDL_SetJoystickVirtualHat => :SetJoystickVirtualHat,
      :SDL_GetJoystickName => :GetJoystickName,
      :SDL_GetJoystickPath => :GetJoystickPath,
      :SDL_GetJoystickPlayerIndex => :GetJoystickPlayerIndex,
      :SDL_SetJoystickPlayerIndex => :SetJoystickPlayerIndex,
      :SDL_GetJoystickGUID => :GetJoystickGUID,
      :SDL_GetJoystickVendor => :GetJoystickVendor,
      :SDL_GetJoystickProduct => :GetJoystickProduct,
      :SDL_GetJoystickProductVersion => :GetJoystickProductVersion,
      :SDL_GetJoystickFirmwareVersion => :GetJoystickFirmwareVersion,
      :SDL_GetJoystickSerial => :GetJoystickSerial,
      :SDL_GetJoystickType => :GetJoystickType,
      :SDL_GetJoystickGUIDString => :GetJoystickGUIDString,
      :SDL_GetJoystickGUIDFromString => :GetJoystickGUIDFromString,
      :SDL_GetJoystickGUIDInfo => :GetJoystickGUIDInfo,
      :SDL_JoystickConnected => :JoystickConnected,
      :SDL_GetJoystickInstanceID => :GetJoystickInstanceID,
      :SDL_GetNumJoystickAxes => :GetNumJoystickAxes,
      :SDL_GetNumJoystickHats => :GetNumJoystickHats,
      :SDL_GetNumJoystickButtons => :GetNumJoystickButtons,
      :SDL_SetJoystickEventsEnabled => :SetJoystickEventsEnabled,
      :SDL_JoystickEventsEnabled => :JoystickEventsEnabled,
      :SDL_UpdateJoysticks => :UpdateJoysticks,
      :SDL_GetJoystickAxis => :GetJoystickAxis,
      :SDL_GetJoystickAxisInitialState => :GetJoystickAxisInitialState,
      :SDL_GetJoystickHat => :GetJoystickHat,
      :SDL_GetJoystickButton => :GetJoystickButton,
      :SDL_RumbleJoystick => :RumbleJoystick,
      :SDL_RumbleJoystickTriggers => :RumbleJoystickTriggers,
      :SDL_JoystickHasLED => :JoystickHasLED,
      :SDL_JoystickHasRumble => :JoystickHasRumble,
      :SDL_JoystickHasRumbleTriggers => :JoystickHasRumbleTriggers,
      :SDL_SetJoystickLED => :SetJoystickLED,
      :SDL_SendJoystickEffect => :SendJoystickEffect,
      :SDL_CloseJoystick => :CloseJoystick,
      :SDL_GetJoystickPowerLevel => :GetJoystickPowerLevel,
    }
    args = {
      :SDL_LockJoysticks => [],
      :SDL_UnlockJoysticks => [],
      :SDL_GetJoysticks => [:pointer],
      :SDL_GetJoystickInstanceName => [:uint],
      :SDL_GetJoystickInstancePath => [:uint],
      :SDL_GetJoystickInstancePlayerIndex => [:uint],
      :SDL_GetJoystickInstanceGUID => [:uint],
      :SDL_GetJoystickInstanceVendor => [:uint],
      :SDL_GetJoystickInstanceProduct => [:uint],
      :SDL_GetJoystickInstanceProductVersion => [:uint],
      :SDL_GetJoystickInstanceType => [:uint],
      :SDL_OpenJoystick => [:uint],
      :SDL_GetJoystickFromInstanceID => [:uint],
      :SDL_GetJoystickFromPlayerIndex => [:int],
      :SDL_AttachVirtualJoystick => [:int, :int, :int, :int],
      :SDL_AttachVirtualJoystickEx => [:pointer],
      :SDL_DetachVirtualJoystick => [:uint],
      :SDL_IsJoystickVirtual => [:uint],
      :SDL_SetJoystickVirtualAxis => [:pointer, :int, :short],
      :SDL_SetJoystickVirtualButton => [:pointer, :int, :uchar],
      :SDL_SetJoystickVirtualHat => [:pointer, :int, :uchar],
      :SDL_GetJoystickName => [:pointer],
      :SDL_GetJoystickPath => [:pointer],
      :SDL_GetJoystickPlayerIndex => [:pointer],
      :SDL_SetJoystickPlayerIndex => [:pointer, :int],
      :SDL_GetJoystickGUID => [:pointer],
      :SDL_GetJoystickVendor => [:pointer],
      :SDL_GetJoystickProduct => [:pointer],
      :SDL_GetJoystickProductVersion => [:pointer],
      :SDL_GetJoystickFirmwareVersion => [:pointer],
      :SDL_GetJoystickSerial => [:pointer],
      :SDL_GetJoystickType => [:pointer],
      :SDL_GetJoystickGUIDString => [JoystickGUID.by_value, :pointer, :int],
      :SDL_GetJoystickGUIDFromString => [:pointer],
      :SDL_GetJoystickGUIDInfo => [JoystickGUID.by_value, :pointer, :pointer, :pointer, :pointer],
      :SDL_JoystickConnected => [:pointer],
      :SDL_GetJoystickInstanceID => [:pointer],
      :SDL_GetNumJoystickAxes => [:pointer],
      :SDL_GetNumJoystickHats => [:pointer],
      :SDL_GetNumJoystickButtons => [:pointer],
      :SDL_SetJoystickEventsEnabled => [:int],
      :SDL_JoystickEventsEnabled => [],
      :SDL_UpdateJoysticks => [],
      :SDL_GetJoystickAxis => [:pointer, :int],
      :SDL_GetJoystickAxisInitialState => [:pointer, :int, :pointer],
      :SDL_GetJoystickHat => [:pointer, :int],
      :SDL_GetJoystickButton => [:pointer, :int],
      :SDL_RumbleJoystick => [:pointer, :ushort, :ushort, :uint],
      :SDL_RumbleJoystickTriggers => [:pointer, :ushort, :ushort, :uint],
      :SDL_JoystickHasLED => [:pointer],
      :SDL_JoystickHasRumble => [:pointer],
      :SDL_JoystickHasRumbleTriggers => [:pointer],
      :SDL_SetJoystickLED => [:pointer, :uchar, :uchar, :uchar],
      :SDL_SendJoystickEffect => [:pointer, :pointer, :int],
      :SDL_CloseJoystick => [:pointer],
      :SDL_GetJoystickPowerLevel => [:pointer],
    }
    retvals = {
      :SDL_LockJoysticks => :void,
      :SDL_UnlockJoysticks => :void,
      :SDL_GetJoysticks => :pointer,
      :SDL_GetJoystickInstanceName => :pointer,
      :SDL_GetJoystickInstancePath => :pointer,
      :SDL_GetJoystickInstancePlayerIndex => :int,
      :SDL_GetJoystickInstanceGUID => JoystickGUID.by_value,
      :SDL_GetJoystickInstanceVendor => :ushort,
      :SDL_GetJoystickInstanceProduct => :ushort,
      :SDL_GetJoystickInstanceProductVersion => :ushort,
      :SDL_GetJoystickInstanceType => :int,
      :SDL_OpenJoystick => :pointer,
      :SDL_GetJoystickFromInstanceID => :pointer,
      :SDL_GetJoystickFromPlayerIndex => :pointer,
      :SDL_AttachVirtualJoystick => :uint,
      :SDL_AttachVirtualJoystickEx => :uint,
      :SDL_DetachVirtualJoystick => :int,
      :SDL_IsJoystickVirtual => :int,
      :SDL_SetJoystickVirtualAxis => :int,
      :SDL_SetJoystickVirtualButton => :int,
      :SDL_SetJoystickVirtualHat => :int,
      :SDL_GetJoystickName => :pointer,
      :SDL_GetJoystickPath => :pointer,
      :SDL_GetJoystickPlayerIndex => :int,
      :SDL_SetJoystickPlayerIndex => :int,
      :SDL_GetJoystickGUID => JoystickGUID.by_value,
      :SDL_GetJoystickVendor => :ushort,
      :SDL_GetJoystickProduct => :ushort,
      :SDL_GetJoystickProductVersion => :ushort,
      :SDL_GetJoystickFirmwareVersion => :ushort,
      :SDL_GetJoystickSerial => :pointer,
      :SDL_GetJoystickType => :int,
      :SDL_GetJoystickGUIDString => :int,
      :SDL_GetJoystickGUIDFromString => JoystickGUID.by_value,
      :SDL_GetJoystickGUIDInfo => :void,
      :SDL_JoystickConnected => :int,
      :SDL_GetJoystickInstanceID => :uint,
      :SDL_GetNumJoystickAxes => :int,
      :SDL_GetNumJoystickHats => :int,
      :SDL_GetNumJoystickButtons => :int,
      :SDL_SetJoystickEventsEnabled => :void,
      :SDL_JoystickEventsEnabled => :int,
      :SDL_UpdateJoysticks => :void,
      :SDL_GetJoystickAxis => :short,
      :SDL_GetJoystickAxisInitialState => :int,
      :SDL_GetJoystickHat => :uchar,
      :SDL_GetJoystickButton => :uchar,
      :SDL_RumbleJoystick => :int,
      :SDL_RumbleJoystickTriggers => :int,
      :SDL_JoystickHasLED => :int,
      :SDL_JoystickHasRumble => :int,
      :SDL_JoystickHasRumbleTriggers => :int,
      :SDL_SetJoystickLED => :int,
      :SDL_SendJoystickEffect => :int,
      :SDL_CloseJoystick => :void,
      :SDL_GetJoystickPowerLevel => :int,
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

