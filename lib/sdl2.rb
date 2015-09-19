# -*- coding: utf-8 -*-
require 'fiddle/import'
require_relative 'main'
require_relative 'hints'

module SDL2

  extend Fiddle::Importer

  #
  # Fiddle's default 'extern' stores all methods into local variable '@func_map', that makes difficult to 'include SDL2'.
  # So I override it and replace '@func_map' into 'SDL2_FUNCTIONS_MAP'.
  # Ref.: /lib/ruby/2.0.0/fiddle/import.rb
  #
  SDL2_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    SDL2_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        SDL2_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  @@sdl2_import_done = false

  # Load native library.
  def self.load_lib(libpath)
    dlload(libpath)
    import_symbols() unless @@sdl2_import_done
  end


  def self.import_symbols

    self.import_main_symbols
    self.import_hints_symbols

    @@sdl2_import_done = true
  end

end
