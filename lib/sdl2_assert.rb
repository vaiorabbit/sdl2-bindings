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

  ASSERTION_RETRY = 0
  ASSERTION_BREAK = 1
  ASSERTION_ABORT = 2
  ASSERTION_IGNORE = 3
  ASSERTION_ALWAYS_IGNORE = 4

  # Typedef

  typedef :int, :SDL_AssertState
  callback :SDL_AssertionHandler, [:pointer, :pointer], :int

  # Struct

  class AssertData < FFI::Struct
    layout(
      :always_ignore, :int,
      :trigger_count, :uint,
      :condition, :pointer,
      :filename, :pointer,
      :linenum, :int,
      :function, :pointer,
      :next, :pointer,
    )
  end


  # Function

  def self.setup_assert_symbols(output_error = false)
    symbols = [
      :SDL_ReportAssertion,
      :SDL_SetAssertionHandler,
      :SDL_GetDefaultAssertionHandler,
      :SDL_GetAssertionHandler,
      :SDL_GetAssertionReport,
      :SDL_ResetAssertionReport,
    ]
    apis = {
      :SDL_ReportAssertion => :ReportAssertion,
      :SDL_SetAssertionHandler => :SetAssertionHandler,
      :SDL_GetDefaultAssertionHandler => :GetDefaultAssertionHandler,
      :SDL_GetAssertionHandler => :GetAssertionHandler,
      :SDL_GetAssertionReport => :GetAssertionReport,
      :SDL_ResetAssertionReport => :ResetAssertionReport,
    }
    args = {
      :SDL_ReportAssertion => [:pointer, :pointer, :pointer, :int],
      :SDL_SetAssertionHandler => [:SDL_AssertionHandler, :pointer],
      :SDL_GetDefaultAssertionHandler => [],
      :SDL_GetAssertionHandler => [:pointer],
      :SDL_GetAssertionReport => [],
      :SDL_ResetAssertionReport => [],
    }
    retvals = {
      :SDL_ReportAssertion => :int,
      :SDL_SetAssertionHandler => :void,
      :SDL_GetDefaultAssertionHandler => :pointer,
      :SDL_GetAssertionHandler => :pointer,
      :SDL_GetAssertionReport => :pointer,
      :SDL_ResetAssertionReport => :void,
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

