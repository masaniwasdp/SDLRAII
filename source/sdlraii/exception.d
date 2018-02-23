/**
  Manipulas esceptojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.exception;

import std.exception : basicExceptionCtors;

/** Escepto de la SDL biblioteko. */
class SDL_Exception : Exception
{
    mixin basicExceptionCtors;
}

void SDL_Try(lazy scope int expression)
{
    if (expression < 0) throw new SDL_Exception(`An error occurred.`);
}
