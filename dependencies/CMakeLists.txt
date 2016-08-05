cmake_minimum_required( VERSION 3.6 ) #TODO find the actual minimum version of cmake

PROJECT(DMGDependencies)

IF(NOT DMG_DEPENDENCIES_DIR)
    SET(DMG_DEPENDENCIES_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../external/
        CACHE PATH "Choose the root directory where the DMG dependencies will be installed in.")
    MESSAGE("No DMG_DEPENDENCIES_DIR specified, to ${DMG_DEPENDENCIES_DIR}") 
ENDIF(NOT DMG_DEPENDENCIES_DIR)

SET(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)

INCLUDE(ExternalGLEW)
INCLUDE(ExternalIMGUI)
INCLUDE(ExternalSDL2)