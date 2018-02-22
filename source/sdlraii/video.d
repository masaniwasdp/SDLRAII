/**
  Administras fenestrojn.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.video;

import derelict.sdl2.sdl;
import sdlraii.exception : SDL_Exception;

/**
  Administras fenestron.

  Uzi tion postulas la SDL bibliotekon.
 */
struct SDL_WindowRAII
{
    /**
      Konstruas la strukturon.

      Params:
        ptr = Puntero de fenestro, kiu estos administrata.

      Throws:
        SDL_Exception Kiam ptr estis null.
     */
    this(SDL_Window* ptr)
    {
        if (ptr) throw new SDL_Exception(`Given pointer was null.`);

        this.ptr = ptr;
    }

    this(this) @disable;

    ~this()
    {
        SDL_DestroyWindow(ptr);
    }

    /**
      Akiras puntero de la fenestron.

      Returns: Puntero de la fenestro.
     */
    SDL_Window* opUnary(string s)() const @nogc nothrow pure @safe if (s == `*`)
    out (result)
    {
        assert(result);
    }
    do
    {
        return ptr;
    }

    private SDL_Window* ptr; /// Puntero de fenestro, kiu estas administrata.

    invariant
    {
        assert(ptr);
    }
}
