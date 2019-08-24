# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_IMAGE_MAJOR_VERSION = 2
  SDL_IMAGE_MINOR_VERSION = 0
  SDL_IMAGE_PATCHLEVEL = 5

  # Enum

  IMG_INIT_JPG = 1
  IMG_INIT_PNG = 2
  IMG_INIT_TIF = 4
  IMG_INIT_WEBP = 8

  # Typedef

  typedef :int, :IMG_InitFlags

  # Struct


  # Function

  def self.setup_image_symbols()
      attach_function :IMG_Linked_Version, [], :pointer
      attach_function :IMG_Init, [:int], :int
      attach_function :IMG_Quit, [], :void
      attach_function :IMG_LoadTyped_RW, [:pointer, :int, :pointer], :pointer
      attach_function :IMG_Load, [:pointer], :pointer
      attach_function :IMG_Load_RW, [:pointer, :int], :pointer
      attach_function :IMG_LoadTexture, [:pointer, :pointer], :pointer
      attach_function :IMG_LoadTexture_RW, [:pointer, :pointer, :int], :pointer
      attach_function :IMG_LoadTextureTyped_RW, [:pointer, :pointer, :int, :pointer], :pointer
      attach_function :IMG_isICO, [:pointer], :int
      attach_function :IMG_isCUR, [:pointer], :int
      attach_function :IMG_isBMP, [:pointer], :int
      attach_function :IMG_isGIF, [:pointer], :int
      attach_function :IMG_isJPG, [:pointer], :int
      attach_function :IMG_isLBM, [:pointer], :int
      attach_function :IMG_isPCX, [:pointer], :int
      attach_function :IMG_isPNG, [:pointer], :int
      attach_function :IMG_isPNM, [:pointer], :int
      attach_function :IMG_isSVG, [:pointer], :int
      attach_function :IMG_isTIF, [:pointer], :int
      attach_function :IMG_isXCF, [:pointer], :int
      attach_function :IMG_isXPM, [:pointer], :int
      attach_function :IMG_isXV, [:pointer], :int
      attach_function :IMG_isWEBP, [:pointer], :int
      attach_function :IMG_LoadICO_RW, [:pointer], :pointer
      attach_function :IMG_LoadCUR_RW, [:pointer], :pointer
      attach_function :IMG_LoadBMP_RW, [:pointer], :pointer
      attach_function :IMG_LoadGIF_RW, [:pointer], :pointer
      attach_function :IMG_LoadJPG_RW, [:pointer], :pointer
      attach_function :IMG_LoadLBM_RW, [:pointer], :pointer
      attach_function :IMG_LoadPCX_RW, [:pointer], :pointer
      attach_function :IMG_LoadPNG_RW, [:pointer], :pointer
      attach_function :IMG_LoadPNM_RW, [:pointer], :pointer
      attach_function :IMG_LoadSVG_RW, [:pointer], :pointer
      attach_function :IMG_LoadTGA_RW, [:pointer], :pointer
      attach_function :IMG_LoadTIF_RW, [:pointer], :pointer
      attach_function :IMG_LoadXCF_RW, [:pointer], :pointer
      attach_function :IMG_LoadXPM_RW, [:pointer], :pointer
      attach_function :IMG_LoadXV_RW, [:pointer], :pointer
      attach_function :IMG_LoadWEBP_RW, [:pointer], :pointer
      attach_function :IMG_ReadXPMFromArray, [:pointer], :pointer
      attach_function :IMG_SavePNG, [:pointer, :pointer], :int
      attach_function :IMG_SavePNG_RW, [:pointer, :pointer, :int], :int
      attach_function :IMG_SaveJPG, [:pointer, :pointer, :int], :int
      attach_function :IMG_SaveJPG_RW, [:pointer, :pointer, :int, :int], :int
  end

end

