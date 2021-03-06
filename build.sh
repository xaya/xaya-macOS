brew tap vitalyster/homebrew-header-only
brew install cmake autoconf autoconf-archive automake libtool libjson-rpc-cpp jsoncpp cppzmq lmdb glog gflags googletest protobuf openssl sqlite gloox
cmake .
make
