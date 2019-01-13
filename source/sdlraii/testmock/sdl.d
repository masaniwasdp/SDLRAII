module sdlraii.testmock.sdl;

import sdlraii.testmock.framework;

mixin(DefineStruct!`SDL_Window`);
mixin(DefineStruct!`SDL_Renderer`);
mixin(DefineStruct!`SDL_Texture`);
mixin(DefineStruct!`SDL_Surface`);
mixin(DefineStruct!`SDL_PixelFormat`);
mixin(DefineStruct!`SDL_Palette`);
mixin(DefineStruct!`SDL_Cursor`);
mixin(DefineStruct!`SDL_Joystick`);
mixin(DefineStruct!`SDL_GameController`);
mixin(DefineStruct!`SDL_Haptic`);

mixin(DefineFunctionMock!(`SDL_GetError`, `const(char)*`));
mixin(DefineFunctionMock!(`SDL_DestroyWindow`, `void`, `SDL_Window*`));
mixin(DefineFunctionMock!(`SDL_DestroyRenderer`, `void`, `SDL_Renderer*`));
mixin(DefineFunctionMock!(`SDL_DestroyTexture`, `void`, `SDL_Texture*`));
mixin(DefineFunctionMock!(`SDL_FreeSurface`, `void`, `SDL_Surface*`));
mixin(DefineFunctionMock!(`SDL_FreeFormat`, `void`, `SDL_PixelFormat*`));
mixin(DefineFunctionMock!(`SDL_FreePalette`, `void`, `SDL_Palette*`));
mixin(DefineFunctionMock!(`SDL_FreeCursor`, `void`, `SDL_Cursor*`));
mixin(DefineFunctionMock!(`SDL_JoystickClose`, `void`, `SDL_Joystick*`));
mixin(DefineFunctionMock!(`SDL_GameControllerClose`, `void`, `SDL_GameController*`));
mixin(DefineFunctionMock!(`SDL_HapticClose`, `void`, `SDL_Haptic*`));