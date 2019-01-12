module sdlraii.testmock.sdl;

const(char)* SDL_GetError()
{
    return SDL_GetError_value.ptr;
}

string SDL_GetError_value;