# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  STANDARD_GRAVITY = 9.80665

  # Enum

  SENSOR_INVALID = -1
  SENSOR_UNKNOWN = 0
  SENSOR_ACCEL = 1
  SENSOR_GYRO = 2
  SENSOR_ACCEL_L = 3
  SENSOR_GYRO_L = 4
  SENSOR_ACCEL_R = 5
  SENSOR_GYRO_R = 6

  # Typedef

  typedef :int, :SDL_SensorID
  typedef :int, :SDL_SensorType

  # Struct


  # Function

  def self.setup_sensor_symbols(output_error = false)
    symbols = [
      :SDL_LockSensors,
      :SDL_UnlockSensors,
      :SDL_NumSensors,
      :SDL_SensorGetDeviceName,
      :SDL_SensorGetDeviceType,
      :SDL_SensorGetDeviceNonPortableType,
      :SDL_SensorGetDeviceInstanceID,
      :SDL_SensorOpen,
      :SDL_SensorFromInstanceID,
      :SDL_SensorGetName,
      :SDL_SensorGetType,
      :SDL_SensorGetNonPortableType,
      :SDL_SensorGetInstanceID,
      :SDL_SensorGetData,
      :SDL_SensorGetDataWithTimestamp,
      :SDL_SensorClose,
      :SDL_SensorUpdate,
    ]
    apis = {
      :SDL_LockSensors => :LockSensors,
      :SDL_UnlockSensors => :UnlockSensors,
      :SDL_NumSensors => :NumSensors,
      :SDL_SensorGetDeviceName => :SensorGetDeviceName,
      :SDL_SensorGetDeviceType => :SensorGetDeviceType,
      :SDL_SensorGetDeviceNonPortableType => :SensorGetDeviceNonPortableType,
      :SDL_SensorGetDeviceInstanceID => :SensorGetDeviceInstanceID,
      :SDL_SensorOpen => :SensorOpen,
      :SDL_SensorFromInstanceID => :SensorFromInstanceID,
      :SDL_SensorGetName => :SensorGetName,
      :SDL_SensorGetType => :SensorGetType,
      :SDL_SensorGetNonPortableType => :SensorGetNonPortableType,
      :SDL_SensorGetInstanceID => :SensorGetInstanceID,
      :SDL_SensorGetData => :SensorGetData,
      :SDL_SensorGetDataWithTimestamp => :SensorGetDataWithTimestamp,
      :SDL_SensorClose => :SensorClose,
      :SDL_SensorUpdate => :SensorUpdate,
    }
    args = {
      :SDL_LockSensors => [],
      :SDL_UnlockSensors => [],
      :SDL_NumSensors => [],
      :SDL_SensorGetDeviceName => [:int],
      :SDL_SensorGetDeviceType => [:int],
      :SDL_SensorGetDeviceNonPortableType => [:int],
      :SDL_SensorGetDeviceInstanceID => [:int],
      :SDL_SensorOpen => [:int],
      :SDL_SensorFromInstanceID => [:int],
      :SDL_SensorGetName => [:pointer],
      :SDL_SensorGetType => [:pointer],
      :SDL_SensorGetNonPortableType => [:pointer],
      :SDL_SensorGetInstanceID => [:pointer],
      :SDL_SensorGetData => [:pointer, :pointer, :int],
      :SDL_SensorGetDataWithTimestamp => [:pointer, :pointer, :pointer, :int],
      :SDL_SensorClose => [:pointer],
      :SDL_SensorUpdate => [],
    }
    retvals = {
      :SDL_LockSensors => :void,
      :SDL_UnlockSensors => :void,
      :SDL_NumSensors => :int,
      :SDL_SensorGetDeviceName => :pointer,
      :SDL_SensorGetDeviceType => :int,
      :SDL_SensorGetDeviceNonPortableType => :int,
      :SDL_SensorGetDeviceInstanceID => :int,
      :SDL_SensorOpen => :pointer,
      :SDL_SensorFromInstanceID => :pointer,
      :SDL_SensorGetName => :pointer,
      :SDL_SensorGetType => :int,
      :SDL_SensorGetNonPortableType => :int,
      :SDL_SensorGetInstanceID => :int,
      :SDL_SensorGetData => :int,
      :SDL_SensorGetDataWithTimestamp => :int,
      :SDL_SensorClose => :void,
      :SDL_SensorUpdate => :void,
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

