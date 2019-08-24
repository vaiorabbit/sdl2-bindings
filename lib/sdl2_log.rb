# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_MAX_LOG_MESSAGE = 4096

  # Enum

  SDL_LOG_CATEGORY_APPLICATION = 0
  SDL_LOG_CATEGORY_ERROR = 1
  SDL_LOG_CATEGORY_ASSERT = 2
  SDL_LOG_CATEGORY_SYSTEM = 3
  SDL_LOG_CATEGORY_AUDIO = 4
  SDL_LOG_CATEGORY_VIDEO = 5
  SDL_LOG_CATEGORY_RENDER = 6
  SDL_LOG_CATEGORY_INPUT = 7
  SDL_LOG_CATEGORY_TEST = 8
  SDL_LOG_CATEGORY_RESERVED1 = 9
  SDL_LOG_CATEGORY_RESERVED2 = 10
  SDL_LOG_CATEGORY_RESERVED3 = 11
  SDL_LOG_CATEGORY_RESERVED4 = 12
  SDL_LOG_CATEGORY_RESERVED5 = 13
  SDL_LOG_CATEGORY_RESERVED6 = 14
  SDL_LOG_CATEGORY_RESERVED7 = 15
  SDL_LOG_CATEGORY_RESERVED8 = 16
  SDL_LOG_CATEGORY_RESERVED9 = 17
  SDL_LOG_CATEGORY_RESERVED10 = 18
  SDL_LOG_CATEGORY_CUSTOM = 19
  SDL_LOG_PRIORITY_VERBOSE = 1
  SDL_LOG_PRIORITY_DEBUG = 2
  SDL_LOG_PRIORITY_INFO = 3
  SDL_LOG_PRIORITY_WARN = 4
  SDL_LOG_PRIORITY_ERROR = 5
  SDL_LOG_PRIORITY_CRITICAL = 6
  SDL_NUM_LOG_PRIORITIES = 7

  # Typedef

  typedef :int, :SDL_LogPriority
  callback :SDL_LogOutputFunction, [:pointer, :int, :int, :pointer], :void

  # Struct


  # Function

  def self.setup_log_symbols()
      attach_function :SDL_LogSetAllPriority, [:int], :void
      attach_function :SDL_LogSetPriority, [:int, :int], :void
      attach_function :SDL_LogGetPriority, [:int], :int
      attach_function :SDL_LogResetPriorities, [], :void
      attach_function :SDL_Log, [:pointer], :void
      attach_function :SDL_LogVerbose, [:int, :pointer], :void
      attach_function :SDL_LogDebug, [:int, :pointer], :void
      attach_function :SDL_LogInfo, [:int, :pointer], :void
      attach_function :SDL_LogWarn, [:int, :pointer], :void
      attach_function :SDL_LogError, [:int, :pointer], :void
      attach_function :SDL_LogCritical, [:int, :pointer], :void
      attach_function :SDL_LogMessage, [:int, :int, :pointer], :void
      attach_function :SDL_LogGetOutputFunction, [:pointer, :pointer], :void
      attach_function :SDL_LogSetOutputFunction, [:pointer, :pointer], :void
  end

end

