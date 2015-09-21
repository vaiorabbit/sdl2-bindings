module SDL2

  extend Fiddle::Importer

  #
  # Enums
  #

  SDL_RELEASED = 0
  SDL_PRESSED  = 1

  # SDL_EventType;
  SDL_FIRSTEVENT = 0     # Unused (do not remove)

  # Application events
  SDL_QUIT = 0x100

  # These application events have special meaning on iOS, see README-ios.txt for details
  SDL_APP_TERMINATING          = 0x101
  SDL_APP_LOWMEMORY            = 0x102
  SDL_APP_WILLENTERBACKGROUND  = 0x103
  SDL_APP_DIDENTERBACKGROUND   = 0x104
  SDL_APP_WILLENTERFOREGROUND  = 0x105
  SDL_APP_DIDENTERFOREGROUND   = 0x106

  #  Window events
  SDL_WINDOWEVENT    = 0x200
  SDL_SYSWMEVENT     = 0x201

  #  Keyboard events
  SDL_KEYDOWN        = 0x300
  SDL_KEYUP          = 0x301
  SDL_TEXTEDITING    = 0x302
  SDL_TEXTINPUT      = 0x303

  #  Mouse events
  SDL_MOUSEMOTION     = 0x400
  SDL_MOUSEBUTTONDOWN = 0x401
  SDL_MOUSEBUTTONUP   = 0x402
  SDL_MOUSEWHEEL      = 0x403

  #  Joystick events
  SDL_JOYAXISMOTION    = 0x600
  SDL_JOYBALLMOTION    = 0x601
  SDL_JOYHATMOTION     = 0x602
  SDL_JOYBUTTONDOWN    = 0x603
  SDL_JOYBUTTONUP      = 0x604
  SDL_JOYDEVICEADDED   = 0x605
  SDL_JOYDEVICEREMOVED = 0x606

  #  Game controller events
  SDL_CONTROLLERAXISMOTION     = 0x650
  SDL_CONTROLLERBUTTONDOWN     = 0x651
  SDL_CONTROLLERBUTTONUP       = 0x652
  SDL_CONTROLLERDEVICEADDED    = 0x653
  SDL_CONTROLLERDEVICEREMOVED  = 0x654
  SDL_CONTROLLERDEVICEREMAPPED = 0x655

  #  Touch events
  SDL_FINGERDOWN   = 0x700
  SDL_FINGERUP     = 0x701
  SDL_FINGERMOTION = 0x702

  #  Gesture events
  SDL_DOLLARGESTURE = 0x800
  SDL_DOLLARRECORD  = 0x801
  SDL_MULTIGESTURE  = 0x802

  #  Clipboard events
  SDL_CLIPBOARDUPDATE = 0x900

  #  Drag and drop events
  SDL_DROPFILE = 0x1000

  #  Render events
  SDL_RENDER_TARGETS_RESET = 0x2000

  SDL_USEREVENT = 0x8000

  SDL_LASTEVENT = 0xFFFF

  #
  # Struct
  #

  # Fields shared by every event
  SDL_CommonEvent = struct(["unsigned int type",
                            "unsigned int timestamp"])

  # Window state change event data (event.window.*)
  SDL_WindowEvent = struct([
    "unsigned int type",
    "unsigned int timestamp",
    "unsigned int windowID",
    "unsigned char event",
    "unsigned char padding1",
    "unsigned char padding2",
    "unsigned char padding3",
    "int data1",
    "int data2"])

  # Keyboard button event structure (event.key.*)
  SDL_KeyboardEvent = struct([
    "unsigned int type",
    "unsigned int timestamp",
    "unsigned int windowID",
    "unsigned char state",
    "unsigned char repeat",
    "unsigned char padding2",
    "unsigned char padding3",
    # [NOTE] Fiddle::Importer.struct disallows to write struct member directly.
    #        So the member keysym (SDL_Keysym) is decomposed into these elements:
    "int keysym_scancode",
    "int keysym_sym",
    "unsigned short keysym_mod",
    "unsigned int keysym_unused"])

  # Keyboard text editing event structure (event.edit.*)
  SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32

  SDL_TextEditingEvent = struct([
    "unsigned int type",
    "unsigned int timestamp",
    "unsigned int windowID",
    "char text[32]", # 32 == SDL_TEXTEDITINGEVENT_TEXT_SIZE
    "int start",
    "int length"])

  # Keyboard text input event structure (event.text.*)
  SDL_TEXTINPUTEVENT_TEXT_SIZE = 32

  SDL_TextInputEvent = struct([
    "unsigned int type",
    "unsigned int timestamp",
    "unsigned int windowID",
    "char text[32]"]) # SDL_TEXTINPUTEVENT_TEXT_SIZE

  # SDL_eventaction
  SDL_ADDEVENT  = 0
  SDL_PEEKEVENT = 1
  SDL_GETEVENT  = 2

  # state for SDL_EventState
  SDL_QUERY   = -1
  SDL_IGNORE  =  0
  SDL_DISABLE =  0
  SDL_ENABLE  =  1


  class SDL_Event

    attr_accessor :entity

    def initialize
      #
      # sizeof(union SDL_Event) == 56 (SDL 2.0.3)
      #
      @entity = Fiddle::Pointer.malloc(56)
    end

    def to_ptr
      @entity
    end

    def type
      @entity[0, 4].unpack('I')[0]
    end

    def timestamp
      @entity[4, 4].unpack('I')[0]
    end

    def common
      SDL_CommonEvent.new(@entity)
    end

    def window
      SDL_WindowEvent.new(@entity)
    end

    def key
      SDL_KeyboardEvent.new(@entity)
    end

    def edit
      SDL_TextEditingEvent.new(@entity)
    end

    def text
      SDL_TextInputEvent.new(@entity)
    end

  end

  def self.import_events_symbols
    # function
    extern 'void SDL_PumpEvents()'
    extern 'int SDL_PeepEvents(SDL_Event*, int, int, unsigned int, unsigned int)'

    extern 'int SDL_HasEvent(unsigned int)'
    extern 'int SDL_HasEvents(unsigned int, unsigned int)'

    extern 'void SDL_FlushEvent(unsigned int)'
    extern 'void SDL_FlushEvents(unsigned int, unsigned int)'

    extern 'int SDL_PollEvent(SDL_Event*)'
    extern 'int SDL_WaitEvent(SDL_Event*)'

    extern 'int SDL_WaitEventTimeout(SDL_Event*, int)'
    extern 'int SDL_PushEvent(SDL_Event*)'

    # TODO : SDL_EventFilter

    extern 'unsigned char SDL_EventState(unsigned int, int)'

    # TODO : #define SDL_GetEventState(type) SDL_EventState(type, SDL_QUERY)

    extern 'unsigned int SDL_RegisterEvents(int)'
  end

end

