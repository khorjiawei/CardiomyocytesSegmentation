cmake_minimum_required(VERSION 3.13)
project(medianFilter)

#find itk
set(ITK_DIR /home/jwk114/ITK-Source/ITK/bin)
FIND_PACKAGE(ITK REQUIRED)
INCLUDE(${ITK_USE_FILE})

add_executable(medianFilter main.cpp)
TARGET_LINK_LIBRARIES(medianFilter ${ITK_LIBRARIES})