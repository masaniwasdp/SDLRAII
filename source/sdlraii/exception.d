/**
  Modulo, kiu provizas la esceptojn de la SDL-biblioteko.

  Copyright: 2018 masaniwa
  License:   MIT
 */

module sdlraii.exception;

import std.exception : basicExceptionCtors;

/** Escepto de la SDL-biblioteko. */
class SDLException : Exception
{
    mixin basicExceptionCtors;
}
