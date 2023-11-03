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


  # Typedef

  typedef :pointer, :VkInstance
  typedef :pointer, :VkSurfaceKHR
  typedef :pointer, :SDL_vulkanInstance
  typedef :pointer, :SDL_vulkanSurface

  # Struct


  # Function

  def self.setup_vulkan_symbols(output_error = false)
    symbols = [
      :SDL_Vulkan_LoadLibrary,
      :SDL_Vulkan_GetVkGetInstanceProcAddr,
      :SDL_Vulkan_UnloadLibrary,
      :SDL_Vulkan_GetInstanceExtensions,
      :SDL_Vulkan_CreateSurface,
    ]
    apis = {
      :SDL_Vulkan_LoadLibrary => :Vulkan_LoadLibrary,
      :SDL_Vulkan_GetVkGetInstanceProcAddr => :Vulkan_GetVkGetInstanceProcAddr,
      :SDL_Vulkan_UnloadLibrary => :Vulkan_UnloadLibrary,
      :SDL_Vulkan_GetInstanceExtensions => :Vulkan_GetInstanceExtensions,
      :SDL_Vulkan_CreateSurface => :Vulkan_CreateSurface,
    }
    args = {
      :SDL_Vulkan_LoadLibrary => [:pointer],
      :SDL_Vulkan_GetVkGetInstanceProcAddr => [],
      :SDL_Vulkan_UnloadLibrary => [],
      :SDL_Vulkan_GetInstanceExtensions => [:pointer],
      :SDL_Vulkan_CreateSurface => [:pointer, :pointer, :pointer],
    }
    retvals = {
      :SDL_Vulkan_LoadLibrary => :int,
      :SDL_Vulkan_GetVkGetInstanceProcAddr => :pointer,
      :SDL_Vulkan_UnloadLibrary => :void,
      :SDL_Vulkan_GetInstanceExtensions => :pointer,
      :SDL_Vulkan_CreateSurface => :int,
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

