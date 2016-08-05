#include <stdio.h>
#include <SDL.h>
#include <SDL_syswm.h>

#include "types.h"

b32 running = true;

int CALLBACK WinMain(	HINSTANCE instance,
						HINSTANCE prevInstance,
						LPSTR cmdLine,
						int cmdShow )
{
	SDL_SetMainReady( );

	if( SDL_Init( SDL_INIT_GAMECONTROLLER ) != 0 )
	{
		//TODO: Log error message - "Unable to initialize SDL:  %s\n" , SDL_GetError( )
		return 1;
	}

	SDL_Window* window;

	int width = 1600;
	int height = 800;

	SDL_SetHint( SDL_HINT_VIDEO_HIGHDPI_DISABLED , "1" );
	u32 windowFlags = SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | SDL_WINDOW_INPUT_FOCUS | SDL_WINDOW_MOUSE_FOCUS;

	window = SDL_CreateWindow(	"DMG",
								SDL_WINDOWPOS_UNDEFINED,
								SDL_WINDOWPOS_UNDEFINED,
								width,
								height,
								windowFlags );

	SDL_GetWindowSize( window , &width , &height );
	
	SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION , 2 );
    SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION , 2 );
	SDL_GL_SetAttribute( SDL_GL_STENCIL_SIZE , 8 );

	SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER , 1 );
    SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE , 32 );

	SDL_GLContext context = SDL_GL_CreateContext( window );
	SDL_GL_MakeCurrent( window , context );

	//Use Vsync
    if( SDL_GL_SetSwapInterval( 1 ) < 0 )
    {
        //TODO: Log error message - "Warning: Unable to set VSync! SDL Error: %s\n", SDL_GetError();
    }

	while( running )
	{
		SDL_Event event;
		while( SDL_PollEvent( &event ) != 0 )
		{
			switch( event.type )
			{
				case SDL_QUIT:
				{
					running = false;
				}
				break;
				case SDL_KEYDOWN:
				{
					switch ( event.key.keysym.sym )
					{
						case SDLK_ESCAPE:
						{
							running = false;
						}
						break;
						default:
						{
						}
						break;
					}
				}
				break;
				default:
				{
				}
				break;
			}
		}

		SDL_GL_SwapWindow( window );
	};

	SDL_GL_DeleteContext( context );
	SDL_DestroyWindow( window );
	SDL_Quit( );

	return 0;
}