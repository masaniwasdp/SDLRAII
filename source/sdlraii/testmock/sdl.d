module sdlraii.testmock.sdl;

import sdlraii.testmock.util;

struct SDL_Window         {}
struct SDL_Renderer       {}
struct SDL_Texture        {}
struct SDL_Surface        {}
struct SDL_PixelFormat    {}
struct SDL_Palette        {}
struct SDL_Cursor         {}
struct SDL_Joystick       {}
struct SDL_GameController {}
struct SDL_Haptic         {}
struct Mix_Chunk          {}
struct Mix_Music          {}
struct TTF_Font           {}
struct UDPpacket          {}
struct _TCPsocket         {}
struct _UDPsocket         {}
struct _SDLNet_SocketSet  {}

alias TCPsocket        = _TCPsocket*;
alias UDPsocket        = _UDPsocket*;
alias SDLNet_SocketSet = _SDLNet_SocketSet*;

FunctionMock!(const(char)*)              SDL_GetError;
FunctionMock!(void, SDL_Window*)         SDL_DestroyWindow;
FunctionMock!(void, SDL_Renderer*)       SDL_DestroyRenderer;
FunctionMock!(void, SDL_Texture*)        SDL_DestroyTexture;
FunctionMock!(void, SDL_Surface*)        SDL_FreeSurface;
FunctionMock!(void, SDL_PixelFormat*)    SDL_FreeFormat;
FunctionMock!(void, SDL_Palette*)        SDL_FreePalette;
FunctionMock!(void, SDL_Cursor*)         SDL_FreeCursor;
FunctionMock!(void, SDL_Joystick*)       SDL_JoystickClose;
FunctionMock!(void, SDL_GameController*) SDL_GameControllerClose;
FunctionMock!(void, SDL_Haptic*)         SDL_HapticClose;
FunctionMock!(void, Mix_Chunk*)          Mix_FreeChunk;
FunctionMock!(void, Mix_Music*)          Mix_FreeMusic;
FunctionMock!(void, TTF_Font*)           TTF_CloseFont;
FunctionMock!(void, UDPpacket*)          SDLNet_FreePacket;
FunctionMock!(void, UDPpacket**)         SDLNet_FreePacketV;
FunctionMock!(void, TCPsocket)           SDLNet_TCP_Close;
FunctionMock!(void, UDPsocket)           SDLNet_UDP_Close;
FunctionMock!(void, SDLNet_SocketSet)    SDLNet_FreeSocketSet;