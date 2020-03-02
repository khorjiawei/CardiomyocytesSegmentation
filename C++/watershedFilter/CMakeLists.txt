cmake_minimum_required(VERSION 3.13)
project(watershedFilter)

set(CMAKE_CXX_STANDARD 14)

#find itk
set(ITK_DIR /home/jwk114/ITK-Source/ITK/bin)
FIND_PACKAGE(ITK REQUIRED)
INCLUDE(${ITK_USE_FILE})

add_executable(watershedFilter main.cpp)
TARGET_LINK_LIBRARIES(watershedFilter ${ITK_LIBRARIES})