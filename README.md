# SDLRAII

[![Build Status](https://travis-ci.com/masaniwasdp/SDLRAII.svg?branch=master)](https://travis-ci.com/github/masaniwasdp/SDLRAII)
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
import sdlraii.except;
import sdlraii.raii;
import std.string : toStringz;

void main()
{
    // Komencas SDL bibliotekon. Escepto estas ĵetita se ĝi malsukcesas.
    DerelictSDL2.load;

    SDL_Try(SDL_Init(SDL_INIT_EVERYTHING));

    scope (exit) { SDL_Quit(); }

    {
        // Kreas fenestron kaj rendiston, kiuj estos liberigitaj de RAII.
        auto window = SDL_RAII!(SDL_Window*)(
            SDL_CreateWindow(toStringz(`Alice`), 256, 256, 256, 256, SDL_WINDOW_SHOWN));

        auto renderer = SDL_RAII!(SDL_Renderer*)(
            SDL_CreateRenderer(window.ptr, -1, SDL_RENDERER_ACCELERATED));

        // Plenigas la ekranon. Escepto estos ĵetita se ĝi malsukcesas.
        SDL_Try(SDL_SetRenderDrawColor(renderer.ptr, 0xC0, 0xBE, 0xBE, 0xEF));
        SDL_Try(SDL_RenderFillRect(renderer.ptr, null));

        SDL_RenderPresent(renderer.ptr);

        // Atendas iomete.
        SDL_Delay(5000);
    }
}
```

## Uzado

Vidu [API dokumentadon](https://masaniwasdp.github.io/SDLRAII).

## Permesilo

© 2019, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/SDLRAII/blob/master/LICENCE).
