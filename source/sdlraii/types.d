/**
  Provizas aliasojn de administrantoj.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT
 */
module sdlraii.types;

import derelict.sdl2.sdl;
import sdlraii.raii : SDL_RAII;

/** Administranto de SDL_Window. */
alias SDL_RAII_Window = SDL_RAII!SDL_Window;

/** Administranto de SDL_Renderer. */
alias SDL_RAII_Renderer = SDL_RAII!SDL_Renderer;

/** Administranto de SDL_Texture. */
alias SDL_RAII_Texture = SDL_RAII!SDL_Texture;

/** Administranto de SDL_Surface. */
alias SDL_RAII_Surface = SDL_RAII!SDL_Surface;

/** Administranto de SDL_PixelFormat. */
alias SDL_RAII_PixelFormat = SDL_RAII!SDL_PixelFormat;

/** Administranto de SDL_Palette. */
alias SDL_RAII_Palette = SDL_RAII!SDL_Palette;

/** Administranto de SDL_Cursor. */
alias SDL_RAII_Cursor = SDL_RAII!SDL_Cursor;

/** Administranto de SDL_Joystick. */
alias SDL_RAII_Joystick = SDL_RAII!SDL_Joystick;

/** Administranto de SDL_GameController. */
alias SDL_RAII_GameController = SDL_RAII!SDL_GameController;

/** Administranto de SDL_Haptic. */
alias SDL_RAII_Haptic = SDL_RAII!SDL_Haptic;
