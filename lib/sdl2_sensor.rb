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

  typedef :uint, :SDL_SensorID
  typedef :int, :SDL_SensorType

  # Struct


  # Function

  def self.setup_sensor_symbols(output_error = false)
    symbols = [
      :SDL_GetSensors,
      :SDL_GetSensorInstanceName,
      :SDL_GetSensorInstanceType,
      :SDL_GetSensorInstanceNonPortableType,
      :SDL_OpenSensor,
      :SDL_GetSensorFromInstanceID,
      :SDL_GetSensorProperties,
      :SDL_GetSensorName,
      :SDL_GetSensorType,
      :SDL_GetSensorNonPortableType,
      :SDL_GetSensorInstanceID,
      :SDL_GetSensorData,
      :SDL_CloseSensor,
      :SDL_UpdateSensors,
    ]
    apis = {
      :SDL_GetSensors => :GetSensors,
      :SDL_GetSensorInstanceName => :GetSensorInstanceName,
      :SDL_GetSensorInstanceType => :GetSensorInstanceType,
      :SDL_GetSensorInstanceNonPortableType => :GetSensorInstanceNonPortableType,
      :SDL_OpenSensor => :OpenSensor,
      :SDL_GetSensorFromInstanceID => :GetSensorFromInstanceID,
      :SDL_GetSensorProperties => :GetSensorProperties,
      :SDL_GetSensorName => :GetSensorName,
      :SDL_GetSensorType => :GetSensorType,
      :SDL_GetSensorNonPortableType => :GetSensorNonPortableType,
      :SDL_GetSensorInstanceID => :GetSensorInstanceID,
      :SDL_GetSensorData => :GetSensorData,
      :SDL_CloseSensor => :CloseSensor,
      :SDL_UpdateSensors => :UpdateSensors,
    }
    args = {
      :SDL_GetSensors => [:pointer],
      :SDL_GetSensorInstanceName => [:uint],
      :SDL_GetSensorInstanceType => [:uint],
      :SDL_GetSensorInstanceNonPortableType => [:uint],
      :SDL_OpenSensor => [:uint],
      :SDL_GetSensorFromInstanceID => [:uint],
      :SDL_GetSensorProperties => [:pointer],
      :SDL_GetSensorName => [:pointer],
      :SDL_GetSensorType => [:pointer],
      :SDL_GetSensorNonPortableType => [:pointer],
      :SDL_GetSensorInstanceID => [:pointer],
      :SDL_GetSensorData => [:pointer, :pointer, :int],
      :SDL_CloseSensor => [:pointer],
      :SDL_UpdateSensors => [],
    }
    retvals = {
      :SDL_GetSensors => :pointer,
      :SDL_GetSensorInstanceName => :pointer,
      :SDL_GetSensorInstanceType => :int,
      :SDL_GetSensorInstanceNonPortableType => :int,
      :SDL_OpenSensor => :pointer,
      :SDL_GetSensorFromInstanceID => :pointer,
      :SDL_GetSensorProperties => :uint,
      :SDL_GetSensorName => :pointer,
      :SDL_GetSensorType => :int,
      :SDL_GetSensorNonPortableType => :int,
      :SDL_GetSensorInstanceID => :uint,
      :SDL_GetSensorData => :int,
      :SDL_CloseSensor => :void,
      :SDL_UpdateSensors => :void,
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

