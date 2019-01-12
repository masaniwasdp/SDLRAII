/**
  Provizas strukturojn, kiuj administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2019 masaniwa
  License:   MIT

  Examples:
    ---
    import sdlraii;
    import std.string : toStringz;

    void main()
    {
        // Komencas SDL bibliotekon. Escepto estas ĵetita se ĝi malsukcesas.
        DerelictSDL2.load;

        SDL_Try(SDL_Init(SDL_INIT_EVERYTHING));

        scope (exit) SDL_Quit();

        // Kreas fenestron kaj rendiston, kiuj estos liberigitaj de RAII.
        auto window = SDL_RAII_Window(SDL_CreateWindow(toStringz(`Alice`), 0, 0, 77, 16, SDL_WINDOW_SHOWN));

        auto renderer = SDL_RAII_Renderer(SDL_CreateRenderer(window.ptr, -1, SDL_RENDERER_ACCELERATED));

        // Plenigas la ekranon. Escepto estos ĵetita se ĝi malsukcesas.
        SDL_Try(SDL_SetRenderDrawColor(renderer.ptr, 7, 7, 1, 6));

        SDL_Try(SDL_RenderFillRect(renderer.ptr, null));

        SDL_RenderPresent(renderer.ptr);

        // Atendas 7.716 sekundojn.
        SDL_Delay(7716);
    }
    ---
 */
module sdlraii;

public import derelict.sdl2.sdl;
public import sdlraii.except;
public import sdlraii.raii;
public import sdlraii.types;
