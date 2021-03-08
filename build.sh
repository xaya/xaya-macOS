brew tap vitalyster/homebrew-header-only
brew uninstall gloox
brew install cmake autoconf autoconf-archive automake libtool libjson-rpc-cpp jsoncpp cppzmq lmdb glog gflags googletest protobuf openssl sqlite
cmake .
make
