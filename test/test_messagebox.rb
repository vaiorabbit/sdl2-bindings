# coding: utf-8
require_relative '../lib/sdl2'
require_relative 'util'

include SDL2

if __FILE__ == $0
  load_sdl2_lib()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success != 0

  # SDL_ShowSimpleMessageBox
  success = SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR,
                                     "Simple MessageBox",
                                     "これが SDL_ShowSimpleMessageBox です。",
                                     nil)

  # SDL_ShowMessageBox
  buttons = FFI::MemoryPointer.new(SDL_MessageBoxButtonData, 2)
  button = [SDL_MessageBoxButtonData.new(buttons[0]), SDL_MessageBoxButtonData.new(buttons[1])]

  button[0][:flags] = SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT
  button[0][:buttonid] = 0
  button[0][:text] = FFI::MemoryPointer.from_string("OK")

  button[1][:flags] = SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT
  button[1][:buttonid] = 1
  button[1][:text] = FFI::MemoryPointer.from_string("Cancel")

  data = SDL_MessageBoxData.new
  data[:flags] = SDL_MESSAGEBOX_INFORMATION
  data[:window] = nil
  data[:title] = FFI::MemoryPointer.from_string("Custom MessageBox")
  data[:message] = FFI::MemoryPointer.from_string("カスタマイズされたメッセージボックスの利用例です。")
  data[:numbuttons] = 2
  data[:buttons] = buttons
  data[:colorScheme] = nil

  success = SDL_ShowMessageBox(data, buttons)

  SDL_Quit()
end
