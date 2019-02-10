/**
  Provizas aliasojn de administrantoj.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT
 */
module sdlraii.types;

import sdlraii.raii : SDL_RAII;

version (unittest)
{
    import dunit.toolkit;
    import sdlraii.except : SDL_Exception;
    import sdlraii.testmock.sdl;
}
else
{
    import derelict.sdl2.sdl;
}

mixin template SDL_Gen_RAIIHolder(T)
{
    SDL_RAII!T SDL_RAIIHolder(lazy T* exp)
    {
        return typeof(return)(exp);
    }
}

mixin SDL_Gen_RAIIHolder!SDL_Window;
mixin SDL_Gen_RAIIHolder!SDL_Renderer;
mixin SDL_Gen_RAIIHolder!SDL_Texture;
mixin SDL_Gen_RAIIHolder!SDL_Surface;
mixin SDL_Gen_RAIIHolder!SDL_PixelFormat;
mixin SDL_Gen_RAIIHolder!SDL_Palette;
mixin SDL_Gen_RAIIHolder!SDL_Cursor;
mixin SDL_Gen_RAIIHolder!SDL_Joystick;
mixin SDL_Gen_RAIIHolder!SDL_GameController;
mixin SDL_Gen_RAIIHolder!SDL_Haptic;

unittest
{
    {
        SDL_DestroyWindow.callcount = 0;

        SDL_Window window;

        SDL_RAIIHolder(&window).ptr.assertTruthy;

        SDL_DestroyWindow.callcount.assertEqual(1);
    }
    {
        SDL_GetError.value = `Alice`;

        SDL_RAIIHolder(cast(SDL_Window*) null).assertThrow!SDL_Exception(`Alice`);
    }
}