cmake_minimum_required( VERSION 3.6 )

project( DMG )

#
#IMGUI
#
include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/external/include/imgui")

set( IMGUI_SRC
	${CMAKE_CURRENT_SOURCE_DIR}/external/src/imgui/imgui.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/external/src/imgui/imgui_demo.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/external/src/imgui/imgui_draw.cpp
)

#
# GLEW
#
include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/external/include/glew")

set( GLEW_SRC
	${CMAKE_CURRENT_SOURCE_DIR}/external/src/glew/glew.c
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DGLEW_STATIC")


#
#DMG
#
include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/src")

set( DMG_SRC
	src/platformWin32.cpp
)

set( DMG_HDR
	src/platformWin32.h
	src/types.h
)

#
# SDL2
#
include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/external/include/sdl2")
find_library(SDL2_LIBRARY sdl2 HINTS "${CMAKE_CURRENT_SOURCE_DIR}/external/lib")

#
# Setup project
#
set (EXTRA_LIBS ${EXTRA_LIBS} ${SDL2_LIBRARY} opengl32.lib winmm.lib version.lib)
set_property( DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT DMG )
add_executable(DMG WIN32 ${IMGUI_SRC} ${GLEW_SRC} ${DMG_SRC} ${DMG_HDR} )
target_link_libraries (DMG  ${EXTRA_LIBS})