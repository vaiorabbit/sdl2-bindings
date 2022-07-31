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


  # Struct

  class Hid_device_info < FFI::Struct
    layout(
      :path, :pointer,
      :vendor_id, :ushort,
      :product_id, :ushort,
      :serial_number, :pointer,
      :release_number, :ushort,
      :manufacturer_string, :pointer,
      :product_string, :pointer,
      :usage_page, :ushort,
      :usage, :ushort,
      :interface_number, :int,
      :interface_class, :int,
      :interface_subclass, :int,
      :interface_protocol, :int,
      :next, :pointer,
    )
  end


  # Function

  def self.setup_hidapi_symbols(output_error = false)
    symbols = [
      :SDL_hid_init,
      :SDL_hid_exit,
      :SDL_hid_device_change_count,
      :SDL_hid_enumerate,
      :SDL_hid_free_enumeration,
      :SDL_hid_open,
      :SDL_hid_open_path,
      :SDL_hid_write,
      :SDL_hid_read_timeout,
      :SDL_hid_read,
      :SDL_hid_set_nonblocking,
      :SDL_hid_send_feature_report,
      :SDL_hid_get_feature_report,
      :SDL_hid_close,
      :SDL_hid_get_manufacturer_string,
      :SDL_hid_get_product_string,
      :SDL_hid_get_serial_number_string,
      :SDL_hid_get_indexed_string,
      :SDL_hid_ble_scan,
    ]
    apis = {
      :SDL_hid_init => :hid_init,
      :SDL_hid_exit => :hid_exit,
      :SDL_hid_device_change_count => :hid_device_change_count,
      :SDL_hid_enumerate => :hid_enumerate,
      :SDL_hid_free_enumeration => :hid_free_enumeration,
      :SDL_hid_open => :hid_open,
      :SDL_hid_open_path => :hid_open_path,
      :SDL_hid_write => :hid_write,
      :SDL_hid_read_timeout => :hid_read_timeout,
      :SDL_hid_read => :hid_read,
      :SDL_hid_set_nonblocking => :hid_set_nonblocking,
      :SDL_hid_send_feature_report => :hid_send_feature_report,
      :SDL_hid_get_feature_report => :hid_get_feature_report,
      :SDL_hid_close => :hid_close,
      :SDL_hid_get_manufacturer_string => :hid_get_manufacturer_string,
      :SDL_hid_get_product_string => :hid_get_product_string,
      :SDL_hid_get_serial_number_string => :hid_get_serial_number_string,
      :SDL_hid_get_indexed_string => :hid_get_indexed_string,
      :SDL_hid_ble_scan => :hid_ble_scan,
    }
    args = {
      :SDL_hid_init => [],
      :SDL_hid_exit => [],
      :SDL_hid_device_change_count => [],
      :SDL_hid_enumerate => [:ushort, :ushort],
      :SDL_hid_free_enumeration => [:pointer],
      :SDL_hid_open => [:ushort, :ushort, :pointer],
      :SDL_hid_open_path => [:pointer, :int],
      :SDL_hid_write => [:pointer, :pointer, :ulong],
      :SDL_hid_read_timeout => [:pointer, :pointer, :ulong, :int],
      :SDL_hid_read => [:pointer, :pointer, :ulong],
      :SDL_hid_set_nonblocking => [:pointer, :int],
      :SDL_hid_send_feature_report => [:pointer, :pointer, :ulong],
      :SDL_hid_get_feature_report => [:pointer, :pointer, :ulong],
      :SDL_hid_close => [:pointer],
      :SDL_hid_get_manufacturer_string => [:pointer, :pointer, :ulong],
      :SDL_hid_get_product_string => [:pointer, :pointer, :ulong],
      :SDL_hid_get_serial_number_string => [:pointer, :pointer, :ulong],
      :SDL_hid_get_indexed_string => [:pointer, :int, :pointer, :ulong],
      :SDL_hid_ble_scan => [:int],
    }
    retvals = {
      :SDL_hid_init => :int,
      :SDL_hid_exit => :int,
      :SDL_hid_device_change_count => :uint,
      :SDL_hid_enumerate => :pointer,
      :SDL_hid_free_enumeration => :void,
      :SDL_hid_open => :pointer,
      :SDL_hid_open_path => :pointer,
      :SDL_hid_write => :int,
      :SDL_hid_read_timeout => :int,
      :SDL_hid_read => :int,
      :SDL_hid_set_nonblocking => :int,
      :SDL_hid_send_feature_report => :int,
      :SDL_hid_get_feature_report => :int,
      :SDL_hid_close => :void,
      :SDL_hid_get_manufacturer_string => :int,
      :SDL_hid_get_product_string => :int,
      :SDL_hid_get_serial_number_string => :int,
      :SDL_hid_get_indexed_string => :int,
      :SDL_hid_ble_scan => :void,
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

