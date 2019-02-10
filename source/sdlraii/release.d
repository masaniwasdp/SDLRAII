/*
  Provizas aliasojn de funkcioj por liberigi rimedojn de SDL.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.release;

version (unittest)
{
    import sdlraii.testmock.sdl;
}
else
{
    import derelict.sdl2.sdl;
}

package mixin SDL_Gen_Release!(SDL_Window, SDL_DestroyWindow);
package mixin SDL_Gen_Release!(SDL_Renderer, SDL_DestroyRenderer);
package mixin SDL_Gen_Release!(SDL_Texture, SDL_DestroyTexture);
package mixin SDL_Gen_Release!(SDL_Surface, SDL_FreeSurface);
package mixin SDL_Gen_Release!(SDL_PixelFormat, SDL_FreeFormat);
package mixin SDL_Gen_Release!(SDL_Palette, SDL_FreePalette);
package mixin SDL_Gen_Release!(SDL_Cursor, SDL_FreeCursor);
package mixin SDL_Gen_Release!(SDL_Joystick, SDL_JoystickClose);
package mixin SDL_Gen_Release!(SDL_GameController, SDL_GameControllerClose);
package mixin SDL_Gen_Release!(SDL_Haptic, SDL_HapticClose);

/* Generas aliason de funkcio por liberigi rimedojn. */
private mixin template SDL_Gen_Release(U, alias f)
{
    /* Aliaso de funkcio por liberigi rimedojn. */
    alias SDL_Release(T : U) = f;
}