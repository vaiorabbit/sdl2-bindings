# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro

  SDL_MAJOR_VERSION = 2
  SDL_MINOR_VERSION = 0
  SDL_PATCHLEVEL = 10

  # Enum


  # Typedef


  # Struct

  class SDL_version < FFI::Struct
    layout(
      :major, :uchar,
      :minor, :uchar,
      :patch, :uchar,
    )
  end


  # Function

  def self.setup_version_symbols()
    symbols = [
      :SDL_GetVersion,
      :SDL_GetRevision,
      :SDL_GetRevisionNumber,
    ]
    args = {
      :SDL_GetVersion => [:pointer],
      :SDL_GetRevision => [],
      :SDL_GetRevisionNumber => [],
    }
    retvals = {
      :SDL_GetVersion => :void,
      :SDL_GetRevision => :pointer,
      :SDL_GetRevisionNumber => :int,
    }
    symbols.each do |sym|
      begin
        attach_function sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

