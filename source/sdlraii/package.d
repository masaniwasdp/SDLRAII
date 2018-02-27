/**
  Provizas strukturojn, kiuj administras rimedojn de la SDL biblioteko.

  Authors:   masaniwa
  Copyright: 2018 masaniwa
  License:   MIT

  Examples:
    ---
    import sdlraii;
    import std.conv : to;
    import std.stdio : writeln;
    import std.string : toStringz;

    void main()
    {
        DerelictSDL2.load;

        if (SDL_Init(SDL_INIT_EVERYTHING) != 0) return;

        scope (exit) SDL_Quit();

        try
        {
            // Kreas administranton de fenestro.
            auto window = SDL_RAII_Window(
                SDL_CreateWindow(toStringz(`Alice`), 0, 0, 77, 16, SDL_WINDOW_SHOWN));

            // Kreas administranton de rendisto.
            auto renderer = SDL_RAII_Renderer(
                SDL_CreateRenderer(window.ptr, -1, SDL_RENDERER_ACCELERATED));

            // Ŝanĝas desegnan koloron.
            SDL_Try(SDL_SetRenderDrawColor(renderer.ptr, 7, 7, 1, 6));

            // Plenigas la ekranon.
            SDL_Try(SDL_RenderFillRect(renderer.ptr, null));

            // Ĝisdatigas la ekranon.
            SDL_RenderPresent(renderer.ptr);

            // Atendas 7716 sekundojn.
            SDL_Delay(7716);
        }
        catch (SDL_Exception)
        {
            SDL_GetError()
                .to!string
                .writeln;
        }
    }
    ---
 */
module sdlraii;

public import derelict.sdl2.sdl;
public import sdlraii.except;
public import sdlraii.raii;
public import sdlraii.types;
