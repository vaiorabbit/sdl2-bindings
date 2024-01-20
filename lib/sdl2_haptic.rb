# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  HAPTIC_CONSTANT = 1 << 0
  HAPTIC_SINE = 1 << 1
  HAPTIC_LEFTRIGHT = 1 << 2
  HAPTIC_TRIANGLE = 1 << 3
  HAPTIC_SAWTOOTHUP = 1 << 4
  HAPTIC_SAWTOOTHDOWN = 1 << 5
  HAPTIC_RAMP = 1 << 6
  HAPTIC_SPRING = 1 << 7
  HAPTIC_DAMPER = 1 << 8
  HAPTIC_INERTIA = 1 << 9
  HAPTIC_FRICTION = 1 << 10
  HAPTIC_CUSTOM = 1 << 11
  HAPTIC_GAIN = 1 << 12
  HAPTIC_AUTOCENTER = 1 << 13
  HAPTIC_STATUS = 1 << 14
  HAPTIC_PAUSE = 1 << 15
  HAPTIC_POLAR = 0
  HAPTIC_CARTESIAN = 1
  HAPTIC_SPHERICAL = 2
  HAPTIC_STEERING_AXIS = 3
  HAPTIC_INFINITY = 4294967295

  # Enum


  # Typedef


  # Struct

  class HapticDirection < FFI::Struct
    layout(
      :type, :uchar,
      :dir, [:int, 3],
    )
  end

  class HapticConstant < FFI::Struct
    layout(
      :type, :ushort,
      :direction, HapticDirection,
      :length, :uint,
      :delay, :ushort,
      :button, :ushort,
      :interval, :ushort,
      :level, :short,
      :attack_length, :ushort,
      :attack_level, :ushort,
      :fade_length, :ushort,
      :fade_level, :ushort,
    )
  end

  class HapticPeriodic < FFI::Struct
    layout(
      :type, :ushort,
      :direction, HapticDirection,
      :length, :uint,
      :delay, :ushort,
      :button, :ushort,
      :interval, :ushort,
      :period, :ushort,
      :magnitude, :short,
      :offset, :short,
      :phase, :ushort,
      :attack_length, :ushort,
      :attack_level, :ushort,
      :fade_length, :ushort,
      :fade_level, :ushort,
    )
  end

  class HapticCondition < FFI::Struct
    layout(
      :type, :ushort,
      :direction, HapticDirection,
      :length, :uint,
      :delay, :ushort,
      :button, :ushort,
      :interval, :ushort,
      :right_sat, [:ushort, 3],
      :left_sat, [:ushort, 3],
      :right_coeff, [:short, 3],
      :left_coeff, [:short, 3],
      :deadband, [:ushort, 3],
      :center, [:short, 3],
    )
  end

  class HapticRamp < FFI::Struct
    layout(
      :type, :ushort,
      :direction, HapticDirection,
      :length, :uint,
      :delay, :ushort,
      :button, :ushort,
      :interval, :ushort,
      :start, :short,
      :end, :short,
      :attack_length, :ushort,
      :attack_level, :ushort,
      :fade_length, :ushort,
      :fade_level, :ushort,
    )
  end

  class HapticLeftRight < FFI::Struct
    layout(
      :type, :ushort,
      :length, :uint,
      :large_magnitude, :ushort,
      :small_magnitude, :ushort,
    )
  end

  class HapticCustom < FFI::Struct
    layout(
      :type, :ushort,
      :direction, HapticDirection,
      :length, :uint,
      :delay, :ushort,
      :button, :ushort,
      :interval, :ushort,
      :channels, :uchar,
      :period, :ushort,
      :samples, :ushort,
      :data, :pointer,
      :attack_length, :ushort,
      :attack_level, :ushort,
      :fade_length, :ushort,
      :fade_level, :ushort,
    )
  end

  class HapticEffect < FFI::Union
    layout(
      :type, :ushort,
      :constant, HapticConstant,
      :periodic, HapticPeriodic,
      :condition, HapticCondition,
      :ramp, HapticRamp,
      :leftright, HapticLeftRight,
      :custom, HapticCustom,
    )
  end


  # Function

  def self.setup_haptic_symbols(output_error = false)
    symbols = [
      :SDL_NumHaptics,
      :SDL_HapticName,
      :SDL_HapticOpen,
      :SDL_HapticOpened,
      :SDL_HapticIndex,
      :SDL_MouseIsHaptic,
      :SDL_HapticOpenFromMouse,
      :SDL_JoystickIsHaptic,
      :SDL_HapticOpenFromJoystick,
      :SDL_HapticClose,
      :SDL_HapticNumEffects,
      :SDL_HapticNumEffectsPlaying,
      :SDL_HapticQuery,
      :SDL_HapticNumAxes,
      :SDL_HapticEffectSupported,
      :SDL_HapticNewEffect,
      :SDL_HapticUpdateEffect,
      :SDL_HapticRunEffect,
      :SDL_HapticStopEffect,
      :SDL_HapticDestroyEffect,
      :SDL_HapticGetEffectStatus,
      :SDL_HapticSetGain,
      :SDL_HapticSetAutocenter,
      :SDL_HapticPause,
      :SDL_HapticUnpause,
      :SDL_HapticStopAll,
      :SDL_HapticRumbleSupported,
      :SDL_HapticRumbleInit,
      :SDL_HapticRumblePlay,
      :SDL_HapticRumbleStop,
    ]
    apis = {
      :SDL_NumHaptics => :NumHaptics,
      :SDL_HapticName => :HapticName,
      :SDL_HapticOpen => :HapticOpen,
      :SDL_HapticOpened => :HapticOpened,
      :SDL_HapticIndex => :HapticIndex,
      :SDL_MouseIsHaptic => :MouseIsHaptic,
      :SDL_HapticOpenFromMouse => :HapticOpenFromMouse,
      :SDL_JoystickIsHaptic => :JoystickIsHaptic,
      :SDL_HapticOpenFromJoystick => :HapticOpenFromJoystick,
      :SDL_HapticClose => :HapticClose,
      :SDL_HapticNumEffects => :HapticNumEffects,
      :SDL_HapticNumEffectsPlaying => :HapticNumEffectsPlaying,
      :SDL_HapticQuery => :HapticQuery,
      :SDL_HapticNumAxes => :HapticNumAxes,
      :SDL_HapticEffectSupported => :HapticEffectSupported,
      :SDL_HapticNewEffect => :HapticNewEffect,
      :SDL_HapticUpdateEffect => :HapticUpdateEffect,
      :SDL_HapticRunEffect => :HapticRunEffect,
      :SDL_HapticStopEffect => :HapticStopEffect,
      :SDL_HapticDestroyEffect => :HapticDestroyEffect,
      :SDL_HapticGetEffectStatus => :HapticGetEffectStatus,
      :SDL_HapticSetGain => :HapticSetGain,
      :SDL_HapticSetAutocenter => :HapticSetAutocenter,
      :SDL_HapticPause => :HapticPause,
      :SDL_HapticUnpause => :HapticUnpause,
      :SDL_HapticStopAll => :HapticStopAll,
      :SDL_HapticRumbleSupported => :HapticRumbleSupported,
      :SDL_HapticRumbleInit => :HapticRumbleInit,
      :SDL_HapticRumblePlay => :HapticRumblePlay,
      :SDL_HapticRumbleStop => :HapticRumbleStop,
    }
    args = {
      :SDL_NumHaptics => [],
      :SDL_HapticName => [:int],
      :SDL_HapticOpen => [:int],
      :SDL_HapticOpened => [:int],
      :SDL_HapticIndex => [:pointer],
      :SDL_MouseIsHaptic => [],
      :SDL_HapticOpenFromMouse => [],
      :SDL_JoystickIsHaptic => [:pointer],
      :SDL_HapticOpenFromJoystick => [:pointer],
      :SDL_HapticClose => [:pointer],
      :SDL_HapticNumEffects => [:pointer],
      :SDL_HapticNumEffectsPlaying => [:pointer],
      :SDL_HapticQuery => [:pointer],
      :SDL_HapticNumAxes => [:pointer],
      :SDL_HapticEffectSupported => [:pointer, :pointer],
      :SDL_HapticNewEffect => [:pointer, :pointer],
      :SDL_HapticUpdateEffect => [:pointer, :int, :pointer],
      :SDL_HapticRunEffect => [:pointer, :int, :uint],
      :SDL_HapticStopEffect => [:pointer, :int],
      :SDL_HapticDestroyEffect => [:pointer, :int],
      :SDL_HapticGetEffectStatus => [:pointer, :int],
      :SDL_HapticSetGain => [:pointer, :int],
      :SDL_HapticSetAutocenter => [:pointer, :int],
      :SDL_HapticPause => [:pointer],
      :SDL_HapticUnpause => [:pointer],
      :SDL_HapticStopAll => [:pointer],
      :SDL_HapticRumbleSupported => [:pointer],
      :SDL_HapticRumbleInit => [:pointer],
      :SDL_HapticRumblePlay => [:pointer, :float, :uint],
      :SDL_HapticRumbleStop => [:pointer],
    }
    retvals = {
      :SDL_NumHaptics => :int,
      :SDL_HapticName => :pointer,
      :SDL_HapticOpen => :pointer,
      :SDL_HapticOpened => :int,
      :SDL_HapticIndex => :int,
      :SDL_MouseIsHaptic => :int,
      :SDL_HapticOpenFromMouse => :pointer,
      :SDL_JoystickIsHaptic => :int,
      :SDL_HapticOpenFromJoystick => :pointer,
      :SDL_HapticClose => :void,
      :SDL_HapticNumEffects => :int,
      :SDL_HapticNumEffectsPlaying => :int,
      :SDL_HapticQuery => :uint,
      :SDL_HapticNumAxes => :int,
      :SDL_HapticEffectSupported => :int,
      :SDL_HapticNewEffect => :int,
      :SDL_HapticUpdateEffect => :int,
      :SDL_HapticRunEffect => :int,
      :SDL_HapticStopEffect => :int,
      :SDL_HapticDestroyEffect => :void,
      :SDL_HapticGetEffectStatus => :int,
      :SDL_HapticSetGain => :int,
      :SDL_HapticSetAutocenter => :int,
      :SDL_HapticPause => :int,
      :SDL_HapticUnpause => :int,
      :SDL_HapticStopAll => :int,
      :SDL_HapticRumbleSupported => :int,
      :SDL_HapticRumbleInit => :int,
      :SDL_HapticRumblePlay => :int,
      :SDL_HapticRumbleStop => :int,
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

