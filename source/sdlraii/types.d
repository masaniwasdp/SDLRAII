/**
  Provizas aliasojn de la administrantoj.

  `SDL_RAIIHolder(lazy T exp)` estas aliason de `SDL_RAII!T(lazy T exp)`.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT

  Examples:
    ---
    import derelict.sdl2.sdl;
    import sdlraii.types : SDL_RAIIHolder;
    import std.string : toStringz;

    void main()
    {
        DerelictSDL2.load;

        if (SDL_Init(SDL_INIT_EVERYTHING) >= 0)
        {
            scope (exit) { SDL_Quit(); }

            // Kreas fenestron, kiuj estos liberigitaj de RAII.
            auto w = SDL_RAIIHolder(SDL_CreateWindow(toStringz(`Alice`), 0, 0, 77, 16, SDL_WINDOW_SHOWN));
        }
    }
    ---
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
    import derelict.sdl2.mixer;
    import derelict.sdl2.net;
    import derelict.sdl2.sdl;
    import derelict.sdl2.ttf;
}

mixin SDL_Gen_RAIIHolder!(SDL_Window*);
mixin SDL_Gen_RAIIHolder!(SDL_Renderer*);
mixin SDL_Gen_RAIIHolder!(SDL_Texture*);
mixin SDL_Gen_RAIIHolder!(SDL_Surface*);
mixin SDL_Gen_RAIIHolder!(SDL_PixelFormat*);
mixin SDL_Gen_RAIIHolder!(SDL_Palette*);
mixin SDL_Gen_RAIIHolder!(SDL_Cursor*);
mixin SDL_Gen_RAIIHolder!(SDL_Joystick*);
mixin SDL_Gen_RAIIHolder!(SDL_GameController*);
mixin SDL_Gen_RAIIHolder!(SDL_Haptic*);
mixin SDL_Gen_RAIIHolder!(Mix_Chunk*);
mixin SDL_Gen_RAIIHolder!(Mix_Music*);
mixin SDL_Gen_RAIIHolder!(TTF_Font*);
mixin SDL_Gen_RAIIHolder!(UDPpacket*);
mixin SDL_Gen_RAIIHolder!(UDPpacket**);
mixin SDL_Gen_RAIIHolder!(SDLNet_SocketSet);

/*
  Generas funkcion por krei la administrantojn.

  Params: T = Tipo de puntero de la rimedoj, kiuj estos administritaj.
 */
private mixin template SDL_Gen_RAIIHolder(T)
{
    /*
      Kreas la administranton de la rimedo.

      Params: exp = Esprimo por akiri rimedon de la SDL biblioteko.
                    Ĉi tiu rimedo estos administrata per la administranto.

      Returns: Administranto de la rimedo.

      Throws: `SDL_Exception` Kiam malsukcesas akiri rimedon.
     */
    SDL_RAII!T SDL_RAIIHolder(lazy T exp) @trusted
    {
        return typeof(return)(exp);
    }
}

@system unittest
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