/**
  Provizas esceptojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.except;

import std.conv : to;
import std.exception : basicExceptionCtors;

version (unittest)
{
    import dunit.toolkit;
    import sdlraii.testmock.sdl;
}
else
{
    import derelict.sdl2.sdl;
}

/** Escepto de la SDL biblioteko. */
class SDL_Exception : Exception
{
    mixin basicExceptionCtors;
}

/**
  Ekzekuto esprimon, kiu povas malsukcesi.

  Params: exp = Esprimo, kiu revenas negativan nombron se ĝi malsukcesas.

  Throws: SDL_Exception Kiam la esprimo malsukcesas.
 */
void SDL_Try(lazy int exp)
{
    if (exp < 0)
    {
        throw new SDL_Exception(SDL_GetError().to!string);
    }
}

unittest
{
    SDL_GetError.value = `Alice`;

    SDL_Try(1);
    SDL_Try(0);

    SDL_Try(-1).assertThrow!SDL_Exception(`Alice`);
    SDL_Try(-2).assertThrow!SDL_Exception(`Alice`);
}
