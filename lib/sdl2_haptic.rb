# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_HAPTIC_CONSTANT = ( 1 << 0 )
  SDL_HAPTIC_SINE = ( 1 << 1 )
  SDL_HAPTIC_LEFTRIGHT = ( 1 << 2 )
  SDL_HAPTIC_TRIANGLE = ( 1 << 3 )
  SDL_HAPTIC_SAWTOOTHUP = ( 1 << 4 )
  SDL_HAPTIC_SAWTOOTHDOWN = ( 1 << 5 )
  SDL_HAPTIC_RAMP = ( 1 << 6 )
  SDL_HAPTIC_SPRING = ( 1 << 7 )
  SDL_HAPTIC_DAMPER = ( 1 << 8 )
  SDL_HAPTIC_INERTIA = ( 1 << 9 )
  SDL_HAPTIC_FRICTION = ( 1 << 10 )
  SDL_HAPTIC_CUSTOM = ( 1 << 11 )
  SDL_HAPTIC_GAIN = ( 1 << 12 )
  SDL_HAPTIC_AUTOCENTER = ( 1 << 13 )
  SDL_HAPTIC_STATUS = ( 1 << 14 )
  SDL_HAPTIC_PAUSE = ( 1 << 15 )
  SDL_HAPTIC_POLAR = 0
  SDL_HAPTIC_CARTESIAN = 1
  SDL_HAPTIC_SPHERICAL = 2
  SDL_HAPTIC_INFINITY = 4294967295

  # Enum


  # Typedef


  # Struct

  class SDL_HapticDirection < FFI::Struct
    layout(
      :type, :uchar,
      :dir, [:int, 3],
    )
  end

  class SDL_HapticConstant < FFI::Struct
    layout(
      :type, :ushort,
      :direction, SDL_HapticDirection,
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

  class SDL_HapticPeriodic < FFI::Struct
    layout(
      :type, :ushort,
      :direction, SDL_HapticDirection,
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

  class SDL_HapticCondition < FFI::Struct
    layout(
      :type, :ushort,
      :direction, SDL_HapticDirection,
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

  class SDL_HapticRamp < FFI::Struct
    layout(
      :type, :ushort,
      :direction, SDL_HapticDirection,
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

  class SDL_HapticLeftRight < FFI::Struct
    layout(
      :type, :ushort,
      :length, :uint,
      :large_magnitude, :ushort,
      :small_magnitude, :ushort,
    )
  end

  class SDL_HapticCustom < FFI::Struct
    layout(
      :type, :ushort,
      :direction, SDL_HapticDirection,
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

  class SDL_HapticEffect < FFI::Union
    layout(
      :type, :ushort,
      :constant, SDL_HapticConstant,
      :periodic, SDL_HapticPeriodic,
      :condition, SDL_HapticCondition,
      :ramp, SDL_HapticRamp,
      :leftright, SDL_HapticLeftRight,
      :custom, SDL_HapticCustom,
    )
  end


  # Function

  def self.setup_haptic_symbols()
      attach_function :SDL_NumHaptics, [], :int
      attach_function :SDL_HapticName, [:int], :pointer
      attach_function :SDL_HapticOpen, [:int], :pointer
      attach_function :SDL_HapticOpened, [:int], :int
      attach_function :SDL_HapticIndex, [:pointer], :int
      attach_function :SDL_MouseIsHaptic, [], :int
      attach_function :SDL_HapticOpenFromMouse, [], :pointer
      attach_function :SDL_JoystickIsHaptic, [:pointer], :int
      attach_function :SDL_HapticOpenFromJoystick, [:pointer], :pointer
      attach_function :SDL_HapticClose, [:pointer], :void
      attach_function :SDL_HapticNumEffects, [:pointer], :int
      attach_function :SDL_HapticNumEffectsPlaying, [:pointer], :int
      attach_function :SDL_HapticQuery, [:pointer], :uint
      attach_function :SDL_HapticNumAxes, [:pointer], :int
      attach_function :SDL_HapticEffectSupported, [:pointer, :pointer], :int
      attach_function :SDL_HapticNewEffect, [:pointer, :pointer], :int
      attach_function :SDL_HapticUpdateEffect, [:pointer, :int, :pointer], :int
      attach_function :SDL_HapticRunEffect, [:pointer, :int, :uint], :int
      attach_function :SDL_HapticStopEffect, [:pointer, :int], :int
      attach_function :SDL_HapticDestroyEffect, [:pointer, :int], :void
      attach_function :SDL_HapticGetEffectStatus, [:pointer, :int], :int
      attach_function :SDL_HapticSetGain, [:pointer, :int], :int
      attach_function :SDL_HapticSetAutocenter, [:pointer, :int], :int
      attach_function :SDL_HapticPause, [:pointer], :int
      attach_function :SDL_HapticUnpause, [:pointer], :int
      attach_function :SDL_HapticStopAll, [:pointer], :int
      attach_function :SDL_HapticRumbleSupported, [:pointer], :int
      attach_function :SDL_HapticRumbleInit, [:pointer], :int
      attach_function :SDL_HapticRumblePlay, [:pointer, :float, :uint], :int
      attach_function :SDL_HapticRumbleStop, [:pointer], :int
  end

end

