INCLUDE(ExternalProject)

SET(GLEW_PREFIX ${PROJECT_BINARY_DIR}/glew)

ExternalProject_Add(glew
    PREFIX ${GLEW_PREFIX}
    
	DOWNLOAD_COMMAND git submodule update --init -- ${CMAKE_CURRENT_SOURCE_DIR}/glew
	BUILD_COMMAND ""
	CONFIGURE_COMMAND ""
	INSTALL_COMMAND COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/glew/include ${DMG_DEPENDENCIES_DIR}/include/glew
					COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/glew/src ${DMG_DEPENDENCIES_DIR}/src/glew
)
