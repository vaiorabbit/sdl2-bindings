# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'
require_relative 'sdl2_joystick'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum

  SDL_CONTROLLER_BINDTYPE_NONE = 0
  SDL_CONTROLLER_BINDTYPE_BUTTON = 1
  SDL_CONTROLLER_BINDTYPE_AXIS = 2
  SDL_CONTROLLER_BINDTYPE_HAT = 3
  SDL_CONTROLLER_AXIS_INVALID = -1
  SDL_CONTROLLER_AXIS_LEFTX = 0
  SDL_CONTROLLER_AXIS_LEFTY = 1
  SDL_CONTROLLER_AXIS_RIGHTX = 2
  SDL_CONTROLLER_AXIS_RIGHTY = 3
  SDL_CONTROLLER_AXIS_TRIGGERLEFT = 4
  SDL_CONTROLLER_AXIS_TRIGGERRIGHT = 5
  SDL_CONTROLLER_AXIS_MAX = 6
  SDL_CONTROLLER_BUTTON_INVALID = -1
  SDL_CONTROLLER_BUTTON_A = 0
  SDL_CONTROLLER_BUTTON_B = 1
  SDL_CONTROLLER_BUTTON_X = 2
  SDL_CONTROLLER_BUTTON_Y = 3
  SDL_CONTROLLER_BUTTON_BACK = 4
  SDL_CONTROLLER_BUTTON_GUIDE = 5
  SDL_CONTROLLER_BUTTON_START = 6
  SDL_CONTROLLER_BUTTON_LEFTSTICK = 7
  SDL_CONTROLLER_BUTTON_RIGHTSTICK = 8
  SDL_CONTROLLER_BUTTON_LEFTSHOULDER = 9
  SDL_CONTROLLER_BUTTON_RIGHTSHOULDER = 10
  SDL_CONTROLLER_BUTTON_DPAD_UP = 11
  SDL_CONTROLLER_BUTTON_DPAD_DOWN = 12
  SDL_CONTROLLER_BUTTON_DPAD_LEFT = 13
  SDL_CONTROLLER_BUTTON_DPAD_RIGHT = 14
  SDL_CONTROLLER_BUTTON_MAX = 15

  # Typedef


  class SDL_GameControllerButtonBind_value_hat < FFI::Struct
    layout(
        :hat, :int,
        :hat_mask, :int,
    )
  end

  class SDL_GameControllerButtonBind_value < FFI::Struct
    layout(
        :button, :int,
        :axis, :int,
        :hat, SDL_GameControllerButtonBind_value_hat.by_value,
    )
  end

  class SDL_GameControllerButtonBind < FFI::Struct
    layout(
        :bindType, :int,
        :value, SDL_GameControllerButtonBind_value.by_value,
    )
  end

  typedef :int, :SDL_GameControllerBindType
  typedef :int, :SDL_GameControllerAxis
  typedef :int, :SDL_GameControllerButton

  # Struct


  # Function

  def self.setup_gamecontroller_symbols()
    symbols = [
      :SDL_GameControllerAddMappingsFromRW,
      :SDL_GameControllerAddMapping,
      :SDL_GameControllerNumMappings,
      :SDL_GameControllerMappingForIndex,
      :SDL_GameControllerMappingForGUID,
      :SDL_GameControllerMapping,
      :SDL_IsGameController,
      :SDL_GameControllerNameForIndex,
      :SDL_GameControllerMappingForDeviceIndex,
      :SDL_GameControllerOpen,
      :SDL_GameControllerFromInstanceID,
      :SDL_GameControllerName,
      :SDL_GameControllerGetPlayerIndex,
      :SDL_GameControllerGetVendor,
      :SDL_GameControllerGetProduct,
      :SDL_GameControllerGetProductVersion,
      :SDL_GameControllerGetAttached,
      :SDL_GameControllerGetJoystick,
      :SDL_GameControllerEventState,
      :SDL_GameControllerUpdate,
      :SDL_GameControllerGetAxisFromString,
      :SDL_GameControllerGetStringForAxis,
      :SDL_GameControllerGetBindForAxis,
      :SDL_GameControllerGetAxis,
      :SDL_GameControllerGetButtonFromString,
      :SDL_GameControllerGetStringForButton,
      :SDL_GameControllerGetBindForButton,
      :SDL_GameControllerGetButton,
      :SDL_GameControllerRumble,
      :SDL_GameControllerClose,
    ]
    args = {
      :SDL_GameControllerAddMappingsFromRW => [:pointer, :int],
      :SDL_GameControllerAddMapping => [:pointer],
      :SDL_GameControllerNumMappings => [],
      :SDL_GameControllerMappingForIndex => [:int],
      :SDL_GameControllerMappingForGUID => [SDL_JoystickGUID],
      :SDL_GameControllerMapping => [:pointer],
      :SDL_IsGameController => [:int],
      :SDL_GameControllerNameForIndex => [:int],
      :SDL_GameControllerMappingForDeviceIndex => [:int],
      :SDL_GameControllerOpen => [:int],
      :SDL_GameControllerFromInstanceID => [:int],
      :SDL_GameControllerName => [:pointer],
      :SDL_GameControllerGetPlayerIndex => [:pointer],
      :SDL_GameControllerGetVendor => [:pointer],
      :SDL_GameControllerGetProduct => [:pointer],
      :SDL_GameControllerGetProductVersion => [:pointer],
      :SDL_GameControllerGetAttached => [:pointer],
      :SDL_GameControllerGetJoystick => [:pointer],
      :SDL_GameControllerEventState => [:int],
      :SDL_GameControllerUpdate => [],
      :SDL_GameControllerGetAxisFromString => [:pointer],
      :SDL_GameControllerGetStringForAxis => [:int],
      :SDL_GameControllerGetBindForAxis => [:pointer, :int],
      :SDL_GameControllerGetAxis => [:pointer, :int],
      :SDL_GameControllerGetButtonFromString => [:pointer],
      :SDL_GameControllerGetStringForButton => [:int],
      :SDL_GameControllerGetBindForButton => [:pointer, :int],
      :SDL_GameControllerGetButton => [:pointer, :int],
      :SDL_GameControllerRumble => [:pointer, :ushort, :ushort, :uint],
      :SDL_GameControllerClose => [:pointer],
    }
    retvals = {
      :SDL_GameControllerAddMappingsFromRW => :int,
      :SDL_GameControllerAddMapping => :int,
      :SDL_GameControllerNumMappings => :int,
      :SDL_GameControllerMappingForIndex => :pointer,
      :SDL_GameControllerMappingForGUID => :pointer,
      :SDL_GameControllerMapping => :pointer,
      :SDL_IsGameController => :int,
      :SDL_GameControllerNameForIndex => :pointer,
      :SDL_GameControllerMappingForDeviceIndex => :pointer,
      :SDL_GameControllerOpen => :pointer,
      :SDL_GameControllerFromInstanceID => :pointer,
      :SDL_GameControllerName => :pointer,
      :SDL_GameControllerGetPlayerIndex => :int,
      :SDL_GameControllerGetVendor => :ushort,
      :SDL_GameControllerGetProduct => :ushort,
      :SDL_GameControllerGetProductVersion => :ushort,
      :SDL_GameControllerGetAttached => :int,
      :SDL_GameControllerGetJoystick => :pointer,
      :SDL_GameControllerEventState => :int,
      :SDL_GameControllerUpdate => :void,
      :SDL_GameControllerGetAxisFromString => :int,
      :SDL_GameControllerGetStringForAxis => :pointer,
      :SDL_GameControllerGetBindForAxis => SDL_GameControllerButtonBind,
      :SDL_GameControllerGetAxis => :short,
      :SDL_GameControllerGetButtonFromString => :int,
      :SDL_GameControllerGetStringForButton => :pointer,
      :SDL_GameControllerGetBindForButton => SDL_GameControllerButtonBind,
      :SDL_GameControllerGetButton => :uchar,
      :SDL_GameControllerRumble => :int,
      :SDL_GameControllerClose => :void,
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

