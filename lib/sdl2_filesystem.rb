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

  FOLDER_HOME = 0
  FOLDER_DESKTOP = 1
  FOLDER_DOCUMENTS = 2
  FOLDER_DOWNLOADS = 3
  FOLDER_MUSIC = 4
  FOLDER_PICTURES = 5
  FOLDER_PUBLICSHARE = 6
  FOLDER_SAVEDGAMES = 7
  FOLDER_SCREENSHOTS = 8
  FOLDER_TEMPLATES = 9
  FOLDER_VIDEOS = 10

  # Typedef

  typedef :int, :SDL_Folder

  # Struct


  # Function

  def self.setup_filesystem_symbols(output_error = false)
    symbols = [
      :SDL_GetBasePath,
      :SDL_GetPrefPath,
      :SDL_GetPath,
    ]
    apis = {
      :SDL_GetBasePath => :GetBasePath,
      :SDL_GetPrefPath => :GetPrefPath,
      :SDL_GetPath => :GetPath,
    }
    args = {
      :SDL_GetBasePath => [],
      :SDL_GetPrefPath => [:pointer, :pointer],
      :SDL_GetPath => [:int],
    }
    retvals = {
      :SDL_GetBasePath => :pointer,
      :SDL_GetPrefPath => :pointer,
      :SDL_GetPath => :pointer,
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

