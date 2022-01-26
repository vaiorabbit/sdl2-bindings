# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  MAX_LOG_MESSAGE = 4096

  # Enum

  LOG_CATEGORY_APPLICATION = 0
  LOG_CATEGORY_ERROR = 1
  LOG_CATEGORY_ASSERT = 2
  LOG_CATEGORY_SYSTEM = 3
  LOG_CATEGORY_AUDIO = 4
  LOG_CATEGORY_VIDEO = 5
  LOG_CATEGORY_RENDER = 6
  LOG_CATEGORY_INPUT = 7
  LOG_CATEGORY_TEST = 8
  LOG_CATEGORY_RESERVED1 = 9
  LOG_CATEGORY_RESERVED2 = 10
  LOG_CATEGORY_RESERVED3 = 11
  LOG_CATEGORY_RESERVED4 = 12
  LOG_CATEGORY_RESERVED5 = 13
  LOG_CATEGORY_RESERVED6 = 14
  LOG_CATEGORY_RESERVED7 = 15
  LOG_CATEGORY_RESERVED8 = 16
  LOG_CATEGORY_RESERVED9 = 17
  LOG_CATEGORY_RESERVED10 = 18
  LOG_CATEGORY_CUSTOM = 19
  LOG_PRIORITY_VERBOSE = 1
  LOG_PRIORITY_DEBUG = 2
  LOG_PRIORITY_INFO = 3
  LOG_PRIORITY_WARN = 4
  LOG_PRIORITY_ERROR = 5
  LOG_PRIORITY_CRITICAL = 6
  NUM_LOG_PRIORITIES = 7

  # Typedef

  typedef :int, :SDL_LogCategory
  typedef :int, :SDL_LogPriority
  callback :SDL_LogOutputFunction, [:pointer, :int, :int, :pointer], :void

  # Struct


  # Function

  def self.setup_log_symbols(output_error = false)
    symbols = [
      :SDL_LogSetAllPriority,
      :SDL_LogSetPriority,
      :SDL_LogGetPriority,
      :SDL_LogResetPriorities,
      :SDL_Log,
      :SDL_LogVerbose,
      :SDL_LogDebug,
      :SDL_LogInfo,
      :SDL_LogWarn,
      :SDL_LogError,
      :SDL_LogCritical,
      :SDL_LogMessage,
      :SDL_LogGetOutputFunction,
      :SDL_LogSetOutputFunction,
    ]
    apis = {
      :SDL_LogSetAllPriority => :LogSetAllPriority,
      :SDL_LogSetPriority => :LogSetPriority,
      :SDL_LogGetPriority => :LogGetPriority,
      :SDL_LogResetPriorities => :LogResetPriorities,
      :SDL_Log => :Log,
      :SDL_LogVerbose => :LogVerbose,
      :SDL_LogDebug => :LogDebug,
      :SDL_LogInfo => :LogInfo,
      :SDL_LogWarn => :LogWarn,
      :SDL_LogError => :LogError,
      :SDL_LogCritical => :LogCritical,
      :SDL_LogMessage => :LogMessage,
      :SDL_LogGetOutputFunction => :LogGetOutputFunction,
      :SDL_LogSetOutputFunction => :LogSetOutputFunction,
    }
    args = {
      :SDL_LogSetAllPriority => [:int],
      :SDL_LogSetPriority => [:int, :int],
      :SDL_LogGetPriority => [:int],
      :SDL_LogResetPriorities => [],
      :SDL_Log => [:pointer],
      :SDL_LogVerbose => [:int, :pointer],
      :SDL_LogDebug => [:int, :pointer],
      :SDL_LogInfo => [:int, :pointer],
      :SDL_LogWarn => [:int, :pointer],
      :SDL_LogError => [:int, :pointer],
      :SDL_LogCritical => [:int, :pointer],
      :SDL_LogMessage => [:int, :int, :pointer],
      :SDL_LogGetOutputFunction => [:pointer, :pointer],
      :SDL_LogSetOutputFunction => [:SDL_LogOutputFunction, :pointer],
    }
    retvals = {
      :SDL_LogSetAllPriority => :void,
      :SDL_LogSetPriority => :void,
      :SDL_LogGetPriority => :int,
      :SDL_LogResetPriorities => :void,
      :SDL_Log => :void,
      :SDL_LogVerbose => :void,
      :SDL_LogDebug => :void,
      :SDL_LogInfo => :void,
      :SDL_LogWarn => :void,
      :SDL_LogError => :void,
      :SDL_LogCritical => :void,
      :SDL_LogMessage => :void,
      :SDL_LogGetOutputFunction => :void,
      :SDL_LogSetOutputFunction => :void,
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

