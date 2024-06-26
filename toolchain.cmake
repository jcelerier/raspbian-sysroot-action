set(CMAKE_SYSROOT "@SYSROOT@")
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_C_COMPILER "clang-15")
set(CMAKE_CXX_COMPILER "clang++-15")
set(CMAKE_LIBRARY_ARCHITECTURE "@TARGET_TRIPLE@")

set(_cxxflags " --target=@TARGET_TRIPLE@ -Wl,-rpath-link,${CMAKE_SYSROOT}/opt/vc/lib  -march=armv8-a -mfpu=neon-fp-armv8 -mcpu=cortex-a53 -Ofast ")
set(_linkflags " ${_cxxflags} /usr/lib/arm-linux-gnueabihf/libblas.so.3 /usr/lib/arm-linux-gnueabihf/liblapacke.so.3 ")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${_cxxflags} ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${_cxxflags} ")

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${_linkflags} ")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${_linkflags} ")

set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)

set(CMAKE_SYSTEM_LIBRARY_PATH
    "${CMAKE_SYSROOT}/lib/@TARGET_TRIPLE@"
    "${CMAKE_SYSROOT}/lib"
    "${CMAKE_SYSROOT}/usr/lib/@TARGET_TRIPLE@"
    "${CMAKE_SYSROOT}/usr/lib/"
    "${CMAKE_SYSROOT}/opt/vc/lib"
)

set(PKG_CONFIG_LIBDIR_LIST
    "${CMAKE_SYSROOT}/usr/lib/@TARGET_TRIPLE@/pkgconfig"
    "${CMAKE_SYSROOT}/usr/lib/pkgconfig"
    "${CMAKE_SYSROOT}/usr/share/pkgconfig"
    "${CMAKE_SYSROOT}/opt/vc/lib/pkgconfig"
)
string(REPLACE ";" ":" PKG_CONFIG_LIBDIR_ "${PKG_CONFIG_LIBDIR_LIST}")

set(ENV{PKG_CONFIG_DIR} "")
set(ENV{PKG_CONFIG_LIBDIR} ${PKG_CONFIG_LIBDIR_})
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})
