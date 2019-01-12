/**
  Administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.raii;

import derelict.sdl2.sdl;
import sdlraii.except : SDL_Exception;
import std.conv : to;
import std.exception : enforce;

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
    T* ptr() @nogc nothrow @property pure @safe
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
    import dunit.toolkit;

    static if (0)
    {
        DerelictSDL2.load;

        SDL_Init(SDL_INIT_EVERYTHING).assertEqual(0);

        scope (exit) SDL_Quit();

        auto window = SDL_RAII!SDL_Window(SDL_CreateWindow(null, 0, 0, 77, 16, SDL_WINDOW_HIDDEN));

        window.ptr.assertTruthy;

        auto renderer = SDL_RAII!SDL_Renderer(SDL_CreateRenderer(window.ptr, -1, SDL_RENDERER_ACCELERATED));

        renderer.ptr.assertTruthy;

        SDL_RAII!SDL_Surface(null).assertThrow!SDL_Exception;
    }
}
