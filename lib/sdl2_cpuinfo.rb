# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_CACHELINE_SIZE = 128

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_cpuinfo_symbols()
      attach_function :SDL_GetCPUCount, [], :int
      attach_function :SDL_GetCPUCacheLineSize, [], :int
      attach_function :SDL_HasRDTSC, [], :int
      attach_function :SDL_HasAltiVec, [], :int
      attach_function :SDL_HasMMX, [], :int
      attach_function :SDL_Has3DNow, [], :int
      attach_function :SDL_HasSSE, [], :int
      attach_function :SDL_HasSSE2, [], :int
      attach_function :SDL_HasSSE3, [], :int
      attach_function :SDL_HasSSE41, [], :int
      attach_function :SDL_HasSSE42, [], :int
      attach_function :SDL_HasAVX, [], :int
      attach_function :SDL_HasAVX2, [], :int
      attach_function :SDL_HasAVX512F, [], :int
      attach_function :SDL_HasNEON, [], :int
      attach_function :SDL_GetSystemRAM, [], :int
      attach_function :SDL_SIMDGetAlignment, [], :size_t
      attach_function :SDL_SIMDAlloc, [:ulong], :pointer
      attach_function :SDL_SIMDFree, [:pointer], :void
  end

end

