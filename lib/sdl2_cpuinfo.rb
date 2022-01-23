# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  CACHELINE_SIZE = 128

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_cpuinfo_symbols()
    symbols = [
      :SDL_GetCPUCount,
      :SDL_GetCPUCacheLineSize,
      :SDL_HasRDTSC,
      :SDL_HasAltiVec,
      :SDL_HasMMX,
      :SDL_Has3DNow,
      :SDL_HasSSE,
      :SDL_HasSSE2,
      :SDL_HasSSE3,
      :SDL_HasSSE41,
      :SDL_HasSSE42,
      :SDL_HasAVX,
      :SDL_HasAVX2,
      :SDL_HasAVX512F,
      :SDL_HasARMSIMD,
      :SDL_HasNEON,
      :SDL_GetSystemRAM,
      :SDL_SIMDGetAlignment,
      :SDL_SIMDAlloc,
      :SDL_SIMDRealloc,
      :SDL_SIMDFree,
    ]
    apis = {
      :SDL_GetCPUCount => :GetCPUCount,
      :SDL_GetCPUCacheLineSize => :GetCPUCacheLineSize,
      :SDL_HasRDTSC => :HasRDTSC,
      :SDL_HasAltiVec => :HasAltiVec,
      :SDL_HasMMX => :HasMMX,
      :SDL_Has3DNow => :Has3DNow,
      :SDL_HasSSE => :HasSSE,
      :SDL_HasSSE2 => :HasSSE2,
      :SDL_HasSSE3 => :HasSSE3,
      :SDL_HasSSE41 => :HasSSE41,
      :SDL_HasSSE42 => :HasSSE42,
      :SDL_HasAVX => :HasAVX,
      :SDL_HasAVX2 => :HasAVX2,
      :SDL_HasAVX512F => :HasAVX512F,
      :SDL_HasARMSIMD => :HasARMSIMD,
      :SDL_HasNEON => :HasNEON,
      :SDL_GetSystemRAM => :GetSystemRAM,
      :SDL_SIMDGetAlignment => :SIMDGetAlignment,
      :SDL_SIMDAlloc => :SIMDAlloc,
      :SDL_SIMDRealloc => :SIMDRealloc,
      :SDL_SIMDFree => :SIMDFree,
    }
    args = {
      :SDL_GetCPUCount => [],
      :SDL_GetCPUCacheLineSize => [],
      :SDL_HasRDTSC => [],
      :SDL_HasAltiVec => [],
      :SDL_HasMMX => [],
      :SDL_Has3DNow => [],
      :SDL_HasSSE => [],
      :SDL_HasSSE2 => [],
      :SDL_HasSSE3 => [],
      :SDL_HasSSE41 => [],
      :SDL_HasSSE42 => [],
      :SDL_HasAVX => [],
      :SDL_HasAVX2 => [],
      :SDL_HasAVX512F => [],
      :SDL_HasARMSIMD => [],
      :SDL_HasNEON => [],
      :SDL_GetSystemRAM => [],
      :SDL_SIMDGetAlignment => [],
      :SDL_SIMDAlloc => [:int],
      :SDL_SIMDRealloc => [:pointer, :int],
      :SDL_SIMDFree => [:pointer],
    }
    retvals = {
      :SDL_GetCPUCount => :int,
      :SDL_GetCPUCacheLineSize => :int,
      :SDL_HasRDTSC => :int,
      :SDL_HasAltiVec => :int,
      :SDL_HasMMX => :int,
      :SDL_Has3DNow => :int,
      :SDL_HasSSE => :int,
      :SDL_HasSSE2 => :int,
      :SDL_HasSSE3 => :int,
      :SDL_HasSSE41 => :int,
      :SDL_HasSSE42 => :int,
      :SDL_HasAVX => :int,
      :SDL_HasAVX2 => :int,
      :SDL_HasAVX512F => :int,
      :SDL_HasARMSIMD => :int,
      :SDL_HasNEON => :int,
      :SDL_GetSystemRAM => :int,
      :SDL_SIMDGetAlignment => :int,
      :SDL_SIMDAlloc => :pointer,
      :SDL_SIMDRealloc => :pointer,
      :SDL_SIMDFree => :void,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

