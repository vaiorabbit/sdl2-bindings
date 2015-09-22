# coding: utf-8
require_relative 'lib/sdl2'

include SDL2

if __FILE__ == $0
  SDL2.load_lib('libSDL2.dylib') # '/usr/local/lib/libSDL2.dylib'
  SDL_SetMainReady()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success != 0

  # SDL_ShowSimpleMessageBox
  success = SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR,
                                     "Simple MessageBox",
                                     "これが SDL_ShowSimpleMessageBox です。",
                                     nil)

  # SDL_ShowMessageBox
  buttons =  Fiddle::Pointer.malloc(SDL_MessageBoxButtonData.size * 2)
  button = [SDL_MessageBoxButtonData.new(buttons.to_i + 0), SDL_MessageBoxButtonData.new(buttons.to_i + SDL_MessageBoxButtonData.size)]

  button[0].flags = SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT
  button[0].buttonid = 0
  button[0].text = "OK"

  button[1].flags = SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT
  button[1].buttonid = 1
  button[1].text = "Cancel"

  data = SDL_MessageBoxData.malloc
  data.flags = SDL_MESSAGEBOX_INFORMATION
  data.window = nil
  data.title = "Custom MessageBox"
  data.message = "カスタマイズされたメッセージボックスの利用例です。"
  data.numbuttons = 2
  data.buttons = buttons
  data.colorScheme = nil

  success = SDL_ShowMessageBox(data, buttons)

  SDL_Quit()
end
