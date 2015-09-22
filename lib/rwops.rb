module SDL2

  extend Fiddle::Importer

  # RWops Types
  SDL_RWOPS_UNKNOWN   = 0
  SDL_RWOPS_WINFILE   = 1
  SDL_RWOPS_STDFILE   = 2
  SDL_RWOPS_JNIFILE   = 3
  SDL_RWOPS_MEMORY    = 4
  SDL_RWOPS_MEMORY_RO = 5

  RW_SEEK_SET = 0
  RW_SEEK_CUR = 1
  RW_SEEK_END = 2

  def self.import_rwops_symbols
    # function
    extern 'SDL_RWops* SDL_RWFromFile(const char*, const char*)'
    extern 'SDL_RWops* SDL_RWFromFP(void*, int)'
    extern 'SDL_RWops* SDL_RWFromMem(void*, int)'
    extern 'SDL_RWops* SDL_RWFromConstMem(const void*, int)'
    extern 'SDL_RWops* SDL_AllocRW()'
    extern 'void SDL_FreeRW(SDL_RWops*)'

    extern 'unsigned char SDL_ReadU8(SDL_RWops*)'
    extern 'unsigned short SDL_ReadLE16(SDL_RWops*)'
    extern 'unsigned short SDL_ReadBE16(SDL_RWops*)'
    extern 'unsigned int SDL_ReadLE32(SDL_RWops*)'
    extern 'unsigned int SDL_ReadBE32(SDL_RWops*)'
    extern 'unsigned long SDL_ReadLE64(SDL_RWops*)'
    extern 'unsigned long SDL_ReadBE64(SDL_RWops*)'

    extern 'size_t SDL_WriteU8(SDL_RWops*, unsigned char)'
    extern 'size_t SDL_WriteLE16(SDL_RWops*, unsigned short)'
    extern 'size_t SDL_WriteBE16(SDL_RWops*, unsigned short)'
    extern 'size_t SDL_WriteLE32(SDL_RWops*, unsigned int)'
    extern 'size_t SDL_WriteBE32(SDL_RWops*, unsigned int)'
    extern 'size_t SDL_WriteLE64(SDL_RWops*, unsigned long)'
    extern 'size_t SDL_WriteBE64(SDL_RWops*, unsigned long)'
  end

end

