cmake_minimum_required(VERSION 3.10)
project(hello LANGUAGES C CXX VERSION 0.0.1)

set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
add_library(hello STATIC src/hello.cc)
target_include_directories(hello PUBLIC include)
set_target_properties(
  hello PROPERTIES
  POSITION_INDEPENDENT_CODE ON
  CXX_STANDARD 11
  CXX_STANDARD_REQUIRED ON)
