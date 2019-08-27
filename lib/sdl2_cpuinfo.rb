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
    cpuinfo_symbols = [
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
      :SDL_HasNEON,
      :SDL_GetSystemRAM,
      :SDL_SIMDGetAlignment,
      :SDL_SIMDAlloc,
      :SDL_SIMDFree,
    ]
    cpuinfo_args = {
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
      :SDL_HasNEON => [], 
      :SDL_GetSystemRAM => [], 
      :SDL_SIMDGetAlignment => [], 
      :SDL_SIMDAlloc => [:ulong], 
      :SDL_SIMDFree => [:pointer], 
    }
    cpuinfo_retvals = {
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
      :SDL_HasNEON => :int,
      :SDL_GetSystemRAM => :int,
      :SDL_SIMDGetAlignment => :size_t,
      :SDL_SIMDAlloc => :pointer,
      :SDL_SIMDFree => :void,
    }
    cpuinfo_symbols.each do |sym|
      begin
        attach_function sym, cpuinfo_args[sym], cpuinfo_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

