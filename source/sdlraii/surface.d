/**
  Modulo, kiu provizas strukturon de surfaco.

  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.surface;

import derelict.sdl2.sdl;
import sdlraii.exception : SDLException;
import std.conv : to;

/**
  Strukturo, kiu administras surfacon rimedon.

  Uzi tion postulas la SDL-bibliotekon.
 */
struct Surface
{
    /**
      Konstruas la strukturon kaj surfacon.

      Params:
        width  = La larĝo de la surfaco.
        height = La alceto de la surfaco.

      Throws:
        SDLException Kiam konstruado malsukcesas.
     */
    this(in int width, in int height)
    {
        data = SDL_CreateRGBSurface(0, width, height, 32, 0, 0, 0, 0);

        if (!data) throw new SDLException(SDL_GetError().to!string);
    }

    this(this) @disable;

    ~this()
    {
        SDL_FreeSurface(data);
    }

    private SDL_Surface* data; /// Surfaco rimedo, kiu estas administrata.

    invariant
    {
        assert(data);
    }
}

/**
  Akiras surfacon rimedon, kiu estas administrata.

  Params:
    surface = Strukturo, kiu administras surfacon rimedon.

  Returns: Surfaco rimedo.
 */
SDL_Surface* get(ref Surface surface) @nogc nothrow pure @safe
{
    return surface.data;
}
