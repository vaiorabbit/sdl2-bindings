# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
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

  def self.setup_vulkan_symbols()
      attach_function :SDL_Vulkan_LoadLibrary, [:pointer], :int
      attach_function :SDL_Vulkan_GetVkGetInstanceProcAddr, [], :pointer
      attach_function :SDL_Vulkan_UnloadLibrary, [], :void
      attach_function :SDL_Vulkan_GetInstanceExtensions, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_Vulkan_CreateSurface, [:pointer, :pointer, :pointer], :int
      attach_function :SDL_Vulkan_GetDrawableSize, [:pointer, :pointer, :pointer], :void
  end

end

