/**
  Esceptojn de la SDL biblioteko.

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
