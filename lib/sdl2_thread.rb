# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  THREAD_PRIORITY_LOW = 0
  THREAD_PRIORITY_NORMAL = 1
  THREAD_PRIORITY_HIGH = 2
  THREAD_PRIORITY_TIME_CRITICAL = 3

  # Typedef

  typedef :ulong, :SDL_threadID
  typedef :uint, :SDL_TLSID
  typedef :int, :SDL_ThreadPriority
  callback :SDL_ThreadFunction, [:pointer], :int

  # Struct


  # Function

  def self.setup_thread_symbols(output_error = false)
    symbols = [
      :SDL_CreateThread,
      :SDL_CreateThreadWithStackSize,
      :SDL_GetThreadName,
      :SDL_ThreadID,
      :SDL_GetThreadID,
      :SDL_SetThreadPriority,
      :SDL_WaitThread,
      :SDL_DetachThread,
      :SDL_CreateTLS,
      :SDL_GetTLS,
      :SDL_SetTLS,
      :SDL_CleanupTLS,
    ]
    apis = {
      :SDL_CreateThread => :CreateThread,
      :SDL_CreateThreadWithStackSize => :CreateThreadWithStackSize,
      :SDL_GetThreadName => :GetThreadName,
      :SDL_ThreadID => :ThreadID,
      :SDL_GetThreadID => :GetThreadID,
      :SDL_SetThreadPriority => :SetThreadPriority,
      :SDL_WaitThread => :WaitThread,
      :SDL_DetachThread => :DetachThread,
      :SDL_CreateTLS => :CreateTLS,
      :SDL_GetTLS => :GetTLS,
      :SDL_SetTLS => :SetTLS,
      :SDL_CleanupTLS => :CleanupTLS,
    }
    args = {
      :SDL_CreateThread => [:SDL_ThreadFunction, :pointer, :pointer],
      :SDL_CreateThreadWithStackSize => [:SDL_ThreadFunction, :pointer, :ulong, :pointer],
      :SDL_GetThreadName => [:pointer],
      :SDL_ThreadID => [],
      :SDL_GetThreadID => [:pointer],
      :SDL_SetThreadPriority => [:int],
      :SDL_WaitThread => [:pointer, :pointer],
      :SDL_DetachThread => [:pointer],
      :SDL_CreateTLS => [],
      :SDL_GetTLS => [:uint],
      :SDL_SetTLS => [:uint, :pointer, :pointer],
      :SDL_CleanupTLS => [],
    }
    retvals = {
      :SDL_CreateThread => :pointer,
      :SDL_CreateThreadWithStackSize => :pointer,
      :SDL_GetThreadName => :pointer,
      :SDL_ThreadID => :ulong,
      :SDL_GetThreadID => :ulong,
      :SDL_SetThreadPriority => :int,
      :SDL_WaitThread => :void,
      :SDL_DetachThread => :void,
      :SDL_CreateTLS => :uint,
      :SDL_GetTLS => :pointer,
      :SDL_SetTLS => :int,
      :SDL_CleanupTLS => :void,
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

