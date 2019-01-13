SDLRAII
===

[![Build Status](https://travis-ci.org/masaniwasdp/SDLRAII.svg?branch=master)](https://travis-ci.org/masaniwasdp/SDLRAII)
[![codecov](https://codecov.io/gh/masaniwasdp/SDLRAII/branch/master/graph/badge.svg)](https://codecov.io/gh/masaniwasdp/SDLRAII)

Administras rimedojn de SDL biblioteko.

## Priskribo
La biblioteko provizas strukturon, kiu administras rimedojn de SDL biblioteko.
Ĉi strukturo aŭtomate liberigas la rimedojn kun RAII.
Ĝi ankaŭ provizas funkcion por uzado de eraroj.

## Ekzemplo

``` d
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
```

## Uzado
Vidu [API dokumentadon](https://masaniwasdp.github.com/SDLRAII/sdlraii).

## Permesilo
© 2019, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/SDLRAII/blob/master/LICENCE).
