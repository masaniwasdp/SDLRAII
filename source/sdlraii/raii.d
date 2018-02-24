/**
  Administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.raii;

import derelict.sdl2.sdl;
import sdlraii.exception : SDL_Exception;

/** Administras rimedon. */
struct SDL_RAII(T)
{
    static assert(
        !__traits(isSame, SDL_Release!T, SDL_DummyFunc),
        `The type ` ~ __traits(identifier, T) ~ ` is not supported.`);

    /**
      Konstruas la strukturon.

      Params:
        expression = Esprimo por akiri rimedon de la SDL biblioteko. Ĉi tiu rimedo estos administrata.

      Throws:
        SDL_Exception Kiam malsukcesis akiri rimedon.
     */
    this(lazy scope T* expression)
    {
        ptr_ = expression;

        if (!ptr_) throw new SDL_Exception(`Failed to get the resource.`);
    }

    this(this) @disable;

    ~this()
    {
        SDL_Release!T(ptr_);
    }

    /** Puntero de la rimedo. */
    @property
    {
        T* ptr() @nogc nothrow pure @safe
        out (result)
        {
            assert(result, `The result should not be null.`);
        }
        do
        {
            return ptr_;
        }
    }

    private T* ptr_; /// Puntero de rimedo, kiu estas administrata.

    invariant
    {
        assert(ptr_);
    }
}

private alias SDL_Release(T) = SDL_DummyFunc;

private alias SDL_Release(T : SDL_Window) = SDL_DestroyWindow;

private alias SDL_Release(T : SDL_Renderer) = SDL_DestroyRenderer;

private alias SDL_Release(T : SDL_Texture) = SDL_DestroyTexture;

private alias SDL_Release(T : SDL_Surface) = SDL_FreeSurface;

private void SDL_DummyFunc() @nogc nothrow pure @safe
{
    assert(0);
}

unittest
{
    import std.string : toStringz;

    DerelictSDL2.load;

    assert(SDL_Init(SDL_INIT_EVERYTHING) == 0);

    scope (exit) SDL_Quit();

    auto window = SDL_RAII!SDL_Window(
        SDL_CreateWindow(toStringz(``), 0, 0, 77, 16, SDL_WINDOW_HIDDEN));

    assert(window.ptr);

    auto renderer = SDL_RAII!SDL_Renderer(
        SDL_CreateRenderer(window.ptr, -1, SDL_RENDERER_ACCELERATED));

    assert(renderer.ptr);
}
