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

        ptr_ = ptr;
    }

    this(this) @disable;

    ~this()
    {
        SDL_DestroyWindow(ptr_);
    }

    /** Puntero de la fenestro. */
    @property
    {
        SDL_Window* ptr() @nogc nothrow pure @safe
        {
            return ptr_;
        }
    }

    private SDL_Window* ptr_; /// Puntero de fenestro, kiu estas administrata.

    invariant
    {
        assert(ptr_);
    }
}
