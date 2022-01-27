cmake_minimum_required(VERSION 3.0.0)
project(helloworld VERSION 0.1.0)

include(CTest)
enable_testing()
set(CTEST_CONFIGURATION_TYPE Debug)
message("Generated with config types: ${CMAKE_CONFIGURATION_TYPES}")

include(${helloworld_SOURCE_DIR}/test/CTestTestfile.cmake)

add_executable(helloworld helloworld.c)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
