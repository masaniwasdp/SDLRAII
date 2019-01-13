/**
  Administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.raii;

import sdlraii.except : SDL_Exception;
import std.conv : to;
import std.exception : enforce;

version (unittest)
{
    import dunit.toolkit;
    import sdlraii.testmock.sdl;
}
else
{
    import derelict.sdl2.sdl;
}

/** Administras rimedon. */
struct SDL_RAII(T)
{
    static assert(!__traits(isSame, SDL_Release!T, SDL_DummyFunc), `Type T is not supported.`);

    /**
      Konstruas la strukturon.

      Params: exp = Esprimo por akiri rimedon de la SDL biblioteko.
                    Ĉi tiu rimedo estos administrata.

      Throws: SDL_Exception Kiam malsukcesas akiri rimedon.
     */
    this(lazy T* exp)
    {
        res = exp.enforce(new SDL_Exception(SDL_GetError().to!string));
    }

    this(this) @disable;

    ~this()
    {
        SDL_Release!T(res);
    }

    /** Puntero de la rimedo. */
    T* ptr() @nogc nothrow pure @safe
    out (val)
    {
        assert(val, `The return value should not be null.`);
    }
    do
    {
        return res;
    }

    private T* res; // Puntero de rimedo, kiu estas administrata.

    invariant
    {
        assert(res);
    }
}

/* Aliaso de funkcio por liberigi rimedojn. */
private alias SDL_Release(T) = SDL_DummyFunc;

private alias SDL_Release(T : SDL_Window) = SDL_DestroyWindow;

private alias SDL_Release(T : SDL_Renderer) = SDL_DestroyRenderer;

private alias SDL_Release(T : SDL_Texture) = SDL_DestroyTexture;

private alias SDL_Release(T : SDL_Surface) = SDL_FreeSurface;

private alias SDL_Release(T : SDL_PixelFormat) = SDL_FreeFormat;

private alias SDL_Release(T : SDL_Palette) = SDL_FreePalette;

private alias SDL_Release(T : SDL_Cursor) = SDL_FreeCursor;

private alias SDL_Release(T : SDL_Joystick) = SDL_JoystickClose;

private alias SDL_Release(T : SDL_GameController) = SDL_GameControllerClose;

private alias SDL_Release(T : SDL_Haptic) = SDL_HapticClose;

/* Dummy-funkcio, kiu ne povas esti vokata. */
private void SDL_DummyFunc() @nogc nothrow pure @safe
{
    assert(0);
}

unittest
{
    {
        SDL_DestroyWindow.callcount = 0;

        SDL_Window window;

        SDL_RAII!SDL_Window(&window).ptr.assertTruthy;

        SDL_DestroyWindow.callcount.assertEqual(1);
    }
    {
        SDL_DestroyRenderer.callcount = 0;

        SDL_Renderer renderer;

        SDL_RAII!SDL_Renderer(&renderer).ptr.assertTruthy;

        SDL_DestroyRenderer.callcount.assertEqual(1);
    }
    {
        SDL_DestroyTexture.callcount = 0;

        SDL_Texture texture;

        SDL_RAII!SDL_Texture(&texture).ptr.assertTruthy;

        SDL_DestroyTexture.callcount.assertEqual(1);
    }
    {
        SDL_FreeSurface.callcount = 0;

        SDL_Surface surface;

        SDL_RAII!SDL_Surface(&surface).ptr.assertTruthy;

        SDL_FreeSurface.callcount.assertEqual(1);
    }
    {
        SDL_FreeFormat.callcount = 0;

        SDL_PixelFormat format;

        SDL_RAII!SDL_PixelFormat(&format).ptr.assertTruthy;

        SDL_FreeFormat.callcount.assertEqual(1);
    }
    {
        SDL_FreePalette.callcount = 0;

        SDL_Palette palette;

        SDL_RAII!SDL_Palette(&palette).ptr.assertTruthy;

        SDL_FreePalette.callcount.assertEqual(1);
    }
    {
        SDL_FreeCursor.callcount = 0;

        SDL_Cursor cursor;

        SDL_RAII!SDL_Cursor(&cursor).ptr.assertTruthy;

        SDL_FreeCursor.callcount.assertEqual(1);
    }
    {
        SDL_JoystickClose.callcount = 0;

        SDL_Joystick joystick;

        SDL_RAII!SDL_Joystick(&joystick).ptr.assertTruthy;

        SDL_JoystickClose.callcount.assertEqual(1);
    }
    {
        SDL_GameControllerClose.callcount = 0;

        SDL_GameController controller;

        SDL_RAII!SDL_GameController(&controller).ptr.assertTruthy;

        SDL_GameControllerClose.callcount.assertEqual(1);
    }
    {
        SDL_HapticClose.callcount = 0;

        SDL_Haptic haptic;

        SDL_RAII!SDL_Haptic(&haptic).ptr.assertTruthy;

        SDL_HapticClose.callcount.assertEqual(1);
    }
    {
        SDL_GetError.value = `Alice`;

        SDL_RAII!SDL_Window(null).assertThrow!SDL_Exception(`Alice`);
    }
}
