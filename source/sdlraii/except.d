/**
  Provizas esceptojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */
module sdlraii.except;

import derelict.sdl2.sdl;
import std.exception : basicExceptionCtors;

/** Escepto de la SDL biblioteko. */
class SDL_Exception : Exception
{
    mixin basicExceptionCtors;
}

/**
  Ekzekuto esprimon, kiu povas malsukcesi.

  Params:
    exp = Esprimo, kiu revenas negativan nombron se ĝi malsukcesas.

  Throws:
    SDL_Exception Kiam la esprimo malsukcesas.
 */
void SDL_Try(lazy int exp)
{
    int result = void;

    try
    {
        result = exp;
    }
    catch (Throwable t)
    {
        throw new SDL_Exception(`An error occurred.`, t);
    }

    if (result < 0) throw new SDL_Exception(`An error occurred.`);
}

unittest
{
    import dunit.toolkit;
    import std.stdio : writeln;

    debug (CI)
    {
        writeln(__FILE__ ~ `: Some tests using GUI are not available.`);
    }
    else
    {
        DerelictSDL2.load;

        SDL_Init(SDL_INIT_EVERYTHING).assertEqual(0);

        scope (exit) SDL_Quit();

        SDL_Try(-1).assertThrow!SDL_Exception;
    }
}
