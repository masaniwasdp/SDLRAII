/**
  Administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.raii;

import sdlraii.except : SDL_Exception;
import sdlraii.release : SDL_Release;
import std.conv : to;
import std.exception : enforce;

version (unittest)
{
    import dunit.toolkit;
}

version (testmock)
{
    import sdlraii.testmock.sdl;
}
else
{
    import derelict.sdl2.sdl;
}

/**
  Administras rimedon.

  Params: T = Tipo de puntero de la rimedo.
 */
struct SDL_RAII(T)
{
    /**
      Konstruas la strukturon.

      Params: exp = Esprimo por akiri rimedon de la SDL biblioteko.
                    Ĉi tiu rimedo estos administrata.

      Throws: `SDL_Exception` Kiam malsukcesas akiri rimedon.
     */
    this(lazy T exp) @trusted
    {
        res = exp.enforce(new SDL_Exception(SDL_GetError().to!string));
    }

    this(this) @disable;

    ~this()
    {
        SDL_Release!T(res);
    }

    /**
      Akiras punteron de la rimedo.

      Returns: La puntero de la rimedo.
     */
    T ptr() @nogc nothrow pure @safe
    out (val)
    {
        assert(val, `The return value should not be null.`);
    }
    do
    {
        return res;
    }

    private T res; // Puntero de rimedo, kiu estas administrata.

    invariant
    {
        assert(res, `The resource should not be null.`);
    }
}

@system unittest
{
    {
        SDL_DestroyWindow.callcount = 0;

        SDL_Window window;

        SDL_RAII!(SDL_Window*)(&window).ptr.assertTruthy;

        SDL_DestroyWindow.callcount.assertEqual(1);
    }
    {
        SDL_DestroyRenderer.callcount = 0;

        SDL_Renderer renderer;

        SDL_RAII!(SDL_Renderer*)(&renderer).ptr.assertTruthy;

        SDL_DestroyRenderer.callcount.assertEqual(1);
    }
    {
        SDL_DestroyTexture.callcount = 0;

        SDL_Texture texture;

        SDL_RAII!(SDL_Texture*)(&texture).ptr.assertTruthy;

        SDL_DestroyTexture.callcount.assertEqual(1);
    }
    {
        SDL_FreeSurface.callcount = 0;

        SDL_Surface surface;

        SDL_RAII!(SDL_Surface*)(&surface).ptr.assertTruthy;

        SDL_FreeSurface.callcount.assertEqual(1);
    }
    {
        SDL_FreeFormat.callcount = 0;

        SDL_PixelFormat format;

        SDL_RAII!(SDL_PixelFormat*)(&format).ptr.assertTruthy;

        SDL_FreeFormat.callcount.assertEqual(1);
    }
    {
        SDL_FreePalette.callcount = 0;

        SDL_Palette palette;

        SDL_RAII!(SDL_Palette*)(&palette).ptr.assertTruthy;

        SDL_FreePalette.callcount.assertEqual(1);
    }
    {
        SDL_FreeCursor.callcount = 0;

        SDL_Cursor cursor;

        SDL_RAII!(SDL_Cursor*)(&cursor).ptr.assertTruthy;

        SDL_FreeCursor.callcount.assertEqual(1);
    }
    {
        SDL_JoystickClose.callcount = 0;

        SDL_Joystick joystick;

        SDL_RAII!(SDL_Joystick*)(&joystick).ptr.assertTruthy;

        SDL_JoystickClose.callcount.assertEqual(1);
    }
    {
        SDL_GameControllerClose.callcount = 0;

        SDL_GameController controller;

        SDL_RAII!(SDL_GameController*)(&controller).ptr.assertTruthy;

        SDL_GameControllerClose.callcount.assertEqual(1);
    }
    {
        SDL_HapticClose.callcount = 0;

        SDL_Haptic haptic;

        SDL_RAII!(SDL_Haptic*)(&haptic).ptr.assertTruthy;

        SDL_HapticClose.callcount.assertEqual(1);
    }
    {
        Mix_FreeChunk.callcount = 0;

        Mix_Chunk chunk;

        SDL_RAII!(Mix_Chunk*)(&chunk).ptr.assertTruthy;

        Mix_FreeChunk.callcount.assertEqual(1);
    }
    {
        Mix_FreeMusic.callcount = 0;

        Mix_Music music;

        SDL_RAII!(Mix_Music*)(&music).ptr.assertTruthy;

        Mix_FreeMusic.callcount.assertEqual(1);
    }
    {
        TTF_CloseFont.callcount = 0;

        TTF_Font font;

        SDL_RAII!(TTF_Font*)(&font).ptr.assertTruthy;

        TTF_CloseFont.callcount.assertEqual(1);
    }
    {
        SDLNet_FreePacket.callcount = 0;

        UDPpacket packet;

        SDL_RAII!(UDPpacket*)(&packet).ptr.assertTruthy;

        SDLNet_FreePacket.callcount.assertEqual(1);
    }
    {
        SDLNet_FreePacketV.callcount = 0;

        UDPpacket* packetV;

        SDL_RAII!(UDPpacket**)(&packetV).ptr.assertTruthy;

        SDLNet_FreePacketV.callcount.assertEqual(1);
    }
    {
        SDLNet_FreeSocketSet.callcount = 0;

        _SDLNet_SocketSet set;

        SDL_RAII!(SDLNet_SocketSet)(&set).ptr.assertTruthy;

        SDLNet_FreeSocketSet.callcount.assertEqual(1);
    }
    {
        SDL_GetError.value = `Alice`;

        SDL_RAII!(SDL_Window*)(null).assertThrow!SDL_Exception(`Alice`);
    }
}
