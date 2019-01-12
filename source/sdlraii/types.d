/**
  Provizas aliasojn de administrantoj.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.types;

import derelict.sdl2.sdl;
import sdlraii.raii : SDL_RAII;

/** Aliaso de administranto. */
alias SDL_RAII_Window = SDL_RAII!SDL_Window;

/** ditto */
alias SDL_RAII_Renderer = SDL_RAII!SDL_Renderer;

/** ditto */
alias SDL_RAII_Texture = SDL_RAII!SDL_Texture;

/** ditto */
alias SDL_RAII_Surface = SDL_RAII!SDL_Surface;

/** ditto */
alias SDL_RAII_PixelFormat = SDL_RAII!SDL_PixelFormat;

/** ditto */
alias SDL_RAII_Palette = SDL_RAII!SDL_Palette;

/** ditto */
alias SDL_RAII_Cursor = SDL_RAII!SDL_Cursor;

/** ditto */
alias SDL_RAII_Joystick = SDL_RAII!SDL_Joystick;

/** ditto */
alias SDL_RAII_GameController = SDL_RAII!SDL_GameController;

/** ditto */
alias SDL_RAII_Haptic = SDL_RAII!SDL_Haptic;
