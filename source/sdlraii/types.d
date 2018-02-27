/**
  Provizas aliasojn de administrantoj.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */
module sdlraii.types;

import derelict.sdl2.sdl;
import sdlraii.raii : SDL_RAII;

/** Aliaso de administranto. */
public
{
    alias SDL_RAII_Window = SDL_RAII!SDL_Window;

    alias SDL_RAII_Renderer = SDL_RAII!SDL_Renderer;

    alias SDL_RAII_Texture = SDL_RAII!SDL_Texture;

    alias SDL_RAII_Surface = SDL_RAII!SDL_Surface;

    alias SDL_RAII_PixelFormat = SDL_RAII!SDL_PixelFormat;

    alias SDL_RAII_Palette = SDL_RAII!SDL_Palette;

    alias SDL_RAII_Cursor = SDL_RAII!SDL_Cursor;

    alias SDL_RAII_Joystick = SDL_RAII!SDL_Joystick;

    alias SDL_RAII_GameController = SDL_RAII!SDL_GameController;

    alias SDL_RAII_Haptic = SDL_RAII!SDL_Haptic;
}
