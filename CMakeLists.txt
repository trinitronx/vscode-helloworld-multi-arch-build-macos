cmake_minimum_required(VERSION 3.0.0)
set(CMAKE_OSX_ARCHITECTURES x86_64;arm64)
set(CMAKE_CONFIGURATION_TYPES Debug;Release)
project(helloworld VERSION 0.1.0)

set(CTEST_CONFIGURATION_TYPE Debug)
set(CTEST_BINARY_DIRECTORY build)
include(CTest)
enable_testing()
message("Generated with config types: ${CMAKE_CONFIGURATION_TYPES}")

include(${helloworld_SOURCE_DIR}/test/CTestTestfile.cmake)

add_executable(helloworld helloworld.c)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
