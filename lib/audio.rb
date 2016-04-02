module SDL2

  extend Fiddle::Importer

  # typedef Uint16 SDL_AudioFormat
  SDL_AUDIO_MASK_BITSIZE      = (0xFF)
  SDL_AUDIO_MASK_DATATYPE     = (1 << 8)
  SDL_AUDIO_MASK_ENDIAN       = (1 << 12)
  SDL_AUDIO_MASK_SIGNED       = (1 << 15)
  def self.SDL_AUDIO_BITSIZE(x);        (x & SDL_AUDIO_MASK_BITSIZE); end
  def self.SDL_AUDIO_ISFLOAT(x);        (x & SDL_AUDIO_MASK_DATATYPE); end
  def self.SDL_AUDIO_ISBIGENDIAN(x)     (x & SDL_AUDIO_MASK_ENDIAN); end
  def self.SDL_AUDIO_ISSIGNED(x)        (x & SDL_AUDIO_MASK_SIGNED); end
  def self.SDL_AUDIO_ISINT(x)           (!SDL_AUDIO_ISFLOAT(x)); end
  def self.SDL_AUDIO_ISLITTLEENDIAN(x)  (!SDL_AUDIO_ISBIGENDIAN(x)); end
  def self.SDL_AUDIO_ISUNSIGNED(x)      (!SDL_AUDIO_ISSIGNED(x)); end

  # Audio format flags
  AUDIO_U8        = 0x0008
  AUDIO_S8        = 0x8008
  AUDIO_U16LSB    = 0x0010
  AUDIO_S16LSB    = 0x8010
  AUDIO_U16MSB    = 0x1010
  AUDIO_S16MSB    = 0x9010
  AUDIO_U16       = AUDIO_U16LSB
  AUDIO_S16       = AUDIO_S16LSB

  # int32 support
  AUDIO_S32LSB    = 0x8020
  AUDIO_S32MSB    = 0x9020
  AUDIO_S32       = AUDIO_S32LSB

  # float32 support
  AUDIO_F32LSB    = 0x8120
  AUDIO_F32MSB    = 0x9120
  AUDIO_F32       = AUDIO_F32LSB

  if SDL_BYTEORDER == SDL_BIG_ENDIAN
    self.const_set("AUDIO_U16SYS", AUDIO_U16MSB)
    self.const_set("AUDIO_S16SYS", AUDIO_S16MSB)
    self.const_set("AUDIO_S32SYS", AUDIO_S32MSB)
    self.const_set("AUDIO_F32SYS", AUDIO_F32MSB)
  else
    self.const_set("AUDIO_U16SYS", AUDIO_U16LSB)
    self.const_set("AUDIO_S16SYS", AUDIO_S16LSB)
    self.const_set("AUDIO_S32SYS", AUDIO_S32LSB)
    self.const_set("AUDIO_F32SYS", AUDIO_F32LSB)
  end

  # Allow change flags
  SDL_AUDIO_ALLOW_FREQUENCY_CHANGE    = 0x00000001
  SDL_AUDIO_ALLOW_FORMAT_CHANGE       = 0x00000002
  SDL_AUDIO_ALLOW_CHANNELS_CHANGE     = 0x00000004
  SDL_AUDIO_ALLOW_ANY_CHANGE          = (SDL_AUDIO_ALLOW_FREQUENCY_CHANGE|SDL_AUDIO_ALLOW_FORMAT_CHANGE|SDL_AUDIO_ALLOW_CHANNELS_CHANGE)

  # TODO : SDL_AudioCallback

  SDL_AudioSpec = struct(["int freq",
                          "unsigned short format", # SDL_AudioFormat => unsigned short
                          "unsigned char channels",
                          "unsigned char silence",
                          "unsigned short samples",
                          "unsigned short padding",
                          "unsigned int size",
                          "void* callback", # SDL_AudioCallback => void*
                          "void *userdata"])

  # TODO : SDL_AudioFilter

  SDL_AudioCVT = struct(["int needed",
                         "unsigned short src_format", # SDL_AudioFormat => unsigned short
                         "unsigned short dst_format", # SDL_AudioFormat => unsigned short
                         "double rate_incr",
                         "unsigned char *buf",
                         "int len",
                         "int len_cvt",
                         "int len_mult",
                         "double len_ratio",
                         "void* filters[10]", # SDL_AudioFilter => void*
                         "int filter_index"])

  # SDL_AudioStatus
  SDL_AUDIO_STOPPED = 0
  SDL_AUDIO_PLAYING = 1
  SDL_AUDIO_PAUSED  = 2

  SDL_MIX_MAXVOLUME = 128


  def self.SDL_LoadWAV(file, spec, audio_buf, audio_len)
    SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"),1, spec,audio_buf,audio_len)
  end

  def self.import_audio_symbols
    typealias("SDL_AudioFormat", "unsigned short")
    typealias("SDL_AudioDeviceID", "unsigned int")
    typealias("SDL_AudioStatus", "int")

    # function
    extern 'int SDL_GetNumAudioDrivers()'
    extern 'const char *SDL_GetAudioDriver(int)'

    extern 'int SDL_AudioInit(const char*)'
    extern 'void SDL_AudioQuit()'

    extern 'const char *SDL_GetCurrentAudioDriver()'

    extern 'int SDL_OpenAudio(SDL_AudioSpec*, SDL_AudioSpec*)'

    extern 'int SDL_GetNumAudioDevices(int)'

    extern 'const char *SDL_GetAudioDeviceName(int, int)'

    extern 'SDL_AudioDeviceID SDL_OpenAudioDevice(const char*, int, const SDL_AudioSpec*, SDL_AudioSpec*, int)'

    extern 'SDL_AudioStatus SDL_GetAudioStatus()'

    extern 'SDL_AudioStatus SDL_GetAudioDeviceStatus(SDL_AudioDeviceID)'

    extern 'void SDL_PauseAudio(int)'
    extern 'void SDL_PauseAudioDevice(SDL_AudioDeviceID, int)'

    extern 'SDL_AudioSpec *SDL_LoadWAV_RW(SDL_RWops*, int, SDL_AudioSpec*, unsigned char**, unsigned int*)'

    extern 'void SDL_FreeWAV(unsigned char*)'

    extern 'int SDL_BuildAudioCVT(SDL_AudioCVT*, SDL_AudioFormat, unsigned char, int, SDL_AudioFormat, unsigned char, int)'

    extern 'int SDL_ConvertAudio(SDL_AudioCVT*)'

    extern 'void SDL_MixAudio(unsigned char*, const unsigned char*, unsigned int, int)'

    extern 'void SDL_MixAudioFormat(unsigned char*, const unsigned char*, SDL_AudioFormat, unsigned int, int)'

    extern 'int SDLCALL SDL_QueueAudio(SDL_AudioDeviceID, const void*, unsigned int)' rescue $stderr.puts "[Warning] Failed to import SDL_QueueAudio (Available since SDL 2.0.4)."
    extern 'unsigned int SDL_GetQueuedAudioSize(SDL_AudioDeviceID)' rescue $stderr.puts "[Warning] Failed to import SDL_GetQueuedAudioSize (Available since SDL 2.0.4)."
    extern 'void SDL_ClearQueuedAudio(SDL_AudioDeviceID)' rescue $stderr.puts "[Warning] Failed to import SDL_ClearQueuedAudio (Available since SDL 2.0.4)."

    extern 'void SDL_LockAudio()'
    extern 'void SDL_LockAudioDevice(SDL_AudioDeviceID)'
    extern 'void SDL_UnlockAudio()'
    extern 'void SDL_UnlockAudioDevice(SDL_AudioDeviceID)'

    extern 'void SDL_CloseAudio()'
    extern 'void SDL_CloseAudioDevice(SDL_AudioDeviceID)'
  end

end

