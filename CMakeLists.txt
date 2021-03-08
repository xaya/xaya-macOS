if(MSVC)
  cmake_minimum_required (VERSION 3.16.4)
  cmake_policy(SET CMP0091 NEW)
else()
  cmake_minimum_required (VERSION 3.0)
endif()

project(Xaya LANGUAGES C CXX)

include(ExternalProject)

ExternalProject_Add(xayagame
    GIT_REPOSITORY "https://github.com/xaya/libxayagame.git"
    GIT_TAG 8f7d34553081702f9cd61cefadcafb0dcc10855a
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    PATCH_COMMAND patch -d <SOURCE_DIR> -p0 < ${CMAKE_CURRENT_SOURCE_DIR}/patches/libxayagame.patch
    CONFIGURE_COMMAND autoreconf -if <SOURCE_DIR> && <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} OPENSSL_CFLAGS=-I/usr/local/opt/openssl@1.1/include OPENSSL_LIBS="-L/usr/local/opt/openssl@1.1/lib -lssl -lcrypto"
    BUILD_COMMAND make V=1 CXXFLAGS=-I/usr/local/opt/sqlite/include LDFLAGS=-L/usr/local/opt/sqlite/lib
    UPDATE_COMMAND ""
  )
ExternalProject_Add(xid
    GIT_REPOSITORY "https://github.com/xaya/xid.git"
    GIT_TAG 45d33b9c0171a2235ecce9ad49c24a5b21d7d829
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND autoreconf -if <SOURCE_DIR> && <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} XAYAGAME_CFLAGS=-I/usr/local/include XAYAGAME_LIBS=-lxayagame XAYAUTIL_CFLAGS=-I/usr/local/include XAYAUTIL_LIBS=-lxayautil OPENSSL_CFLAGS=-I/usr/local/opt/openssl@1.1/include OPENSSL_LIBS="-L/usr/local/opt/openssl@1.1/lib -lssl -lcrypto"
    BUILD_COMMAND make V=1 CXXFLAGS=-I/usr/local/opt/sqlite/include LDFLAGS=-L/usr/local/opt/sqlite/lib
    UPDATE_COMMAND ""
    DEPENDS xayagame
  )
ExternalProject_Add(gloox
    URL "https://camaya.net/download/gloox-1.0.24.tar.bz2"
    URL_HASH SHA256=ae1462be2a2eb8fe5cd054825143617c53c2c9c7195606cb5a5ba68c0f68f9c9
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} --disable-getaddrinfo
    BUILD_COMMAND ${MAKE_EXE}
    UPDATE_COMMAND ""
  )
ExternalProject_Add(charon
    GIT_REPOSITORY "https://github.com/xaya/charon.git"
    GIT_TAG 04910b475f642bf574950d753309ed6fc44ba0f4
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND autoreconf -if <SOURCE_DIR> && <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} XAYAGAME_CFLAGS=-I/usr/local/include XAYAGAME_LIBS=-lxayagame XAYAUTIL_CFLAGS=-I/usr/local/include XAYAUTIL_LIBS=-lxayautil OPENSSL_CFLAGS=-I/usr/local/opt/openssl@1.1/include OPENSSL_LIBS="-L/usr/local/opt/openssl@1.1/lib -lssl -lcrypto"
    BUILD_COMMAND make V=1 CXXFLAGS=-I/usr/local/opt/sqlite/include LDFLAGS=-L/usr/local/opt/sqlite/lib
    UPDATE_COMMAND ""
    DEPENDS xayagame;xid;gloox
  )
ExternalProject_Add(xmppbroadcast
    GIT_REPOSITORY "https://github.com/xaya/xmppbroadcast.git"
    GIT_TAG 776385ca9a2a318e36df72847d749af38dda9d53
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND autoreconf -if <SOURCE_DIR> && <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} XAYAGAME_CFLAGS=-I/usr/local/include XAYAGAME_LIBS=-lxayagame GAMECHANNEL_CFLAGS=-I/usr/local/include GAMECHANNEL_LIBS=-lgamechannel CHARON_CFLAGS=-I/usr/local/include CHARON_LIBS=-lcharon XAYAUTIL_CFLAGS=-I/usr/local/include XAYAUTIL_LIBS=-lxayautil OPENSSL_CFLAGS=-I/usr/local/opt/openssl@1.1/include OPENSSL_LIBS="-L/usr/local/opt/openssl@1.1/lib -lssl -lcrypto"
    BUILD_COMMAND make V=1 CXXFLAGS=-I/usr/local/opt/sqlite/include LDFLAGS=-L/usr/local/opt/sqlite/lib
    UPDATE_COMMAND ""
    DEPENDS xayagame;xid;gloox
  )
