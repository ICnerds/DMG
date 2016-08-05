INCLUDE(ExternalProject)

SET(IMGUI_PREFIX ${PROJECT_BINARY_DIR}/imgui)

ExternalProject_Add(imgui
    PREFIX ${IMGUI_PREFIX}
    
	DOWNLOAD_COMMAND git submodule update --init -- ${CMAKE_CURRENT_SOURCE_DIR}/imgui
	BUILD_COMMAND ""
	CONFIGURE_COMMAND ""
	INSTALL_COMMAND COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imgui.h ${DMG_DEPENDENCIES_DIR}/include/imgui/imgui.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imconfig.h ${DMG_DEPENDENCIES_DIR}/include/imgui/imconfig.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imgui_internal.h ${DMG_DEPENDENCIES_DIR}/include/imgui/imgui_internal.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/stb_rect_pack.h ${DMG_DEPENDENCIES_DIR}/include/imgui/stb_rect_pack.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/stb_textedit.h ${DMG_DEPENDENCIES_DIR}/include/imgui/stb_textedit.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/stb_truetype.h ${DMG_DEPENDENCIES_DIR}/include/imgui/stb_truetype.h
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imgui.cpp ${DMG_DEPENDENCIES_DIR}/src/imgui/imgui.cpp
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imgui_draw.cpp ${DMG_DEPENDENCIES_DIR}/src/imgui/imgui_draw.cpp
					COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/imgui/imgui_demo.cpp ${DMG_DEPENDENCIES_DIR}/src/imgui/imgui_demo.cpp
)
