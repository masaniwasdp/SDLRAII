/**
  Modulo, kiu provizas strukturon de teksturo.

  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.texture;

import derelict.sdl2.sdl;
import sdlraii.exception : SDLException;
import sdlraii.renderer : Renderer, get;
import sdlraii.surface : Surface, get;
import std.conv : to;

/**
  Strukturo, kiu administras teksturon rimedon.

  Uzi tion postulas la SDL-bibliotekon.
 */
struct Texture
{
    /**
      Konstruas la strukturon kaj teksturon.

      Params:
        renderer = Rendisto uzota por konstrui teksturon.
        surface  = Surfaco uzota por konstrui teksturon.

      Throws:
        SDLException Kiam konstruado malsukcesas.
     */
    this(ref Renderer renderer, ref Surface surface)
    {
        data = SDL_CreateTextureFromSurface(renderer.get, surface.get);

        if (!data) throw new SDLException(SDL_GetError().to!string);
    }

    this(this) @disable;

    ~this()
    {
        SDL_DestroyTexture(data);
    }

    private SDL_Texture* data; /// Teksturo rimedo, kiu estas administrata.

    invariant
    {
        assert(data);
    }
}

/**
  Akiras teksturon rimedon, kiu estas administrata.

  Params:
    texture = Strukturo, kiu administras teksturon rimedon.

  Returns: Teksturo rimedo.
 */
SDL_Texture* get(ref Texture texture) @nogc nothrow pure @safe
{
    return texture.data;
}
