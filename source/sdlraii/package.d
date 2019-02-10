/**
  Provizas strukturojn, kiuj administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT

  Examples:
    ---
    import sdlraii; // derelict.sdl2.sdl, sdlraii.except, sdlraii.types
    import std.string : toStringz;

    void main()
    {
        // Komencas SDL bibliotekon. Escepto estas ĵetita se ĝi malsukcesas.
        DerelictSDL2.load;

        SDL_Try(SDL_Init(SDL_INIT_EVERYTHING));

        scope (exit) { SDL_Quit(); }

        // Kreas fenestron kaj rendiston, kiuj estos liberigitaj de RAII.
        auto w = SDL_RAII_Holder(SDL_CreateWindow(toStringz(`Alice`), 0, 0, 77, 16, SDL_WINDOW_SHOWN));
        auto r = SDL_RAII_Holder(SDL_CreateRenderer(w.ptr, -1, SDL_RENDERER_ACCELERATED));

        // Plenigas la ekranon. Escepto estos ĵetita se ĝi malsukcesas.
        SDL_Try(SDL_SetRenderDrawColor(r.ptr, 0xC0, 0xBE, 0xBE, 0xEF));
        SDL_Try(SDL_RenderFillRect(r.ptr, null));

        SDL_RenderPresent(r.ptr);

        // Atendas iomete.
        SDL_Delay(5000);
    }
    ---
 */
module sdlraii;

public import derelict.sdl2.sdl;
public import sdlraii.except;
public import sdlraii.types;
