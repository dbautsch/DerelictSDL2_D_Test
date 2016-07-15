/*
	The MIT License (MIT)
	Copyright (c) 2016 Dawid Bautsch>

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including without limitation
	the rights to use, copy, modify, merge, publish, distribute, sublicense,
	and/or sell copies of the Software, and to permit persons to whom the Software
	is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
	THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
*/


/*!
*	This is a very basic, working sample of D application using SDL2
*	library (Derelict-SDL2).
*	Enjoy.
*/

import std.stdio;
import derelict.sdl2.sdl;
import derelict.sdl2.image;
import derelict.sdl2.mixer;
import derelict.sdl2.ttf;
import derelict.sdl2.net;

 void main() {
    
    DerelictSDL2.load();

	/*
	uncomment this to enable an extra functionality.

    DerelictSDL2Image.load();
    DerelictSDL2Mixer.load();
    DerelictSDL2ttf.load();
    DerelictSDL2Net.load();
	*/

	SDL_Window * window = SDL_CreateWindow("Derelict SDL Test",
										   20,
										   20,
										   640,
										   480,
										   SDL_WINDOW_RESIZABLE | SDL_WINDOW_SHOWN);

	if (window == null) {
		writeln("Failed to initialize SDL Window.");
		return;
	}

	
	SDL_Event e;

	while (true)
	{
		if (SDL_PollEvent(&e))
		{
			SDL_Surface * surface = SDL_GetWindowSurface(window);

			SDL_Rect r;
			r.x = 0;
			r.y = 0;
			r.w = 640;
			r.h = 480;

			SDL_GetWindowSize(window, &r.w, &r.h);
			DoPainting(surface, &r);
			SDL_UpdateWindowSurface(window);

			if (e.type == SDL_QUIT)
			{
				//	quit application
				break;
			}
		}
	}
}

void DoPainting(SDL_Surface * main_surface, SDL_Rect * rc)
{
	//	Do your drawing in this function.

	SDL_FillRect(main_surface, rc, SDL_MapRGB(main_surface.format, 128, 128, 128));
}
