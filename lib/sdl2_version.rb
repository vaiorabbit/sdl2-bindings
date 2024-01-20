# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  MAJOR_VERSION = 2
  MINOR_VERSION = 29
  PATCHLEVEL = 1

  # Enum


  # Typedef


  # Struct

  class Version < FFI::Struct
    layout(
      :major, :uchar,
      :minor, :uchar,
      :patch, :uchar,
    )
  end


  # Function

  def self.setup_version_symbols(output_error = false)
    symbols = [
      :SDL_GetVersion,
      :SDL_GetRevision,
      :SDL_GetRevisionNumber,
    ]
    apis = {
      :SDL_GetVersion => :GetVersion,
      :SDL_GetRevision => :GetRevision,
      :SDL_GetRevisionNumber => :GetRevisionNumber,
    }
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
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

