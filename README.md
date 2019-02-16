# SDLRAII

[![Build Status](https://travis-ci.org/masaniwasdp/SDLRAII.svg?branch=master)](https://travis-ci.org/masaniwasdp/SDLRAII)
[![codecov](https://codecov.io/gh/masaniwasdp/SDLRAII/branch/master/graph/badge.svg)](https://codecov.io/gh/masaniwasdp/SDLRAII)

Administras rimedojn de SDL biblioteko.

## Priskribo

La biblioteko provizas strukturon, kiu administras rimedojn de SDL biblioteko.
Ĉi strukturo aŭtomate liberigas la rimedojn kun RAII.
Ĝi ankaŭ provizas funkcion por uzado de eraroj.
Ĉi tiuj ankaŭ subtenas SDL_image, SDL_mixer, SDL_net kaj SDL_ttf.

## Ekzemplo

``` d
import derelict.sdl2.sdl;
import sdlraii; // sdlraii.except, sdlraii.raii, sdlraii.types
import std.string : toStringz;

void main()
{
    // Komencas SDL bibliotekon. Escepto estas ĵetita se ĝi malsukcesas.
    DerelictSDL2.load;

    SDL_Try(SDL_Init(SDL_INIT_EVERYTHING));

    scope (exit) { SDL_Quit(); }

    // Kreas fenestron kaj rendiston, kiuj estos liberigitaj de RAII.
    auto w = SDL_RAIIHolder(SDL_CreateWindow(toStringz(`Alice`), 0, 0, 77, 16, SDL_WINDOW_SHOWN));
    auto r = SDL_RAIIHolder(SDL_CreateRenderer(w.ptr, -1, SDL_RENDERER_ACCELERATED));

    // Plenigas la ekranon. Escepto estos ĵetita se ĝi malsukcesas.
    SDL_Try(SDL_SetRenderDrawColor(r.ptr, 0xC0, 0xBE, 0xBE, 0xEF));
    SDL_Try(SDL_RenderFillRect(r.ptr, null));

    SDL_RenderPresent(r.ptr);

    // Atendas iomete.
    SDL_Delay(5000);
}
```

## Uzado

Vidu [API dokumentadon](https://masaniwasdp.github.com/SDLRAII/sdlraii).

## Permesilo

© 2019, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/SDLRAII/blob/master/LICENCE).
