/**
  Modulo, kiu provizas strukturon de rendisto.

  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.renderer;

import derelict.sdl2.sdl;
import sdlraii.exception : SDLException;
import sdlraii.window : Window, get;
import std.conv : to;

/**
  Strukturo, kiu administras rendiston rimedon.

  Uzi tion postulas la SDL-bibliotekon.
 */
struct Renderer
{
    /**
      Konstruas la strukturon kaj rendiston.

      Params:
        window = Fenestro uzota por konstrui rendiston.

      Throws:
        SDLException Kiam konstruado malsukcesas.
     */
    this(ref Window window)
    {
        data = SDL_CreateRenderer(window.get, -1, SDL_RENDERER_PRESENTVSYNC | SDL_RENDERER_ACCELERATED);

        if (!data) throw new SDLException(SDL_GetError().to!string);
    }

    this(this) @disable;

    ~this()
    {
        SDL_DestroyRenderer(data);
    }

    private SDL_Renderer* data; /// Rendisto rimedo, kiu estas administrata.

    invariant
    {
        assert(data);
    }
}

/**
  Akiras rendiston rimedon, kiu estas administrata.

  Params:
    renderer = Strukturo, kiu administras rendiston rimedon.

  Returns: Rendisto rimedo.
 */
SDL_Renderer* get(ref Renderer renderer) @nogc nothrow pure @safe
{
    return renderer.data;
}
