# This software is dedicated to Public Domain and, as such, bears no
# copyright. Please see LICENSE file for details.

CURRENT_FILE=$(lastword $(MAKEFILE_LIST))

RPiTemplate_SYSROOT=$(dir $(CURRENT_FILE))sysroot
BREW_LLVM_PREFIX=$(shell brew --prefix llvm)
BREW_BINUTILS_PREFIX=$(shell brew --prefix arm-linux-gnueabihf-binutils)

CLANG=$(BREW_LLVM_PREFIX)/bin/clang
CLANG_CC=$(BREW_LLVM_PREFIX)/bin/clang++

CLANG_COMPILE_FLAGS=--target=arm-linux-gnueabihf
CLANG_COMPILE_FLAGS+=-isysroot $(RPiTemplate_SYSROOT)
CLANG_COMPILE_FLAGS+=-isystem $(RPiTemplate_SYSROOT)/usr/include/c++/GCC_Version
CLANG_COMPILE_FLAGS+=-isystem $(RPiTemplate_SYSROOT)/usr/include/arm-linux-gnueabihf/c++/GCC_Version
CLANG_COMPILE_FLAGS+=-isystem $(RPiTemplate_SYSROOT)/usr/include
CLANG_COMPILE_FLAGS+=-isystem $(RPiTemplate_SYSROOT)/usr/include/arm-linux-gnueabihf
CLANG_COMPILE_FLAGS+=-gcc-toolchain $(BREW_BINUTILS_PREFIX)

CLANG_CC_COMPILE_FLAGS=$(CLANG_COMPILE_FLAGS)
CLANG_CC_COMPILE_FLAGS+=-cxx-isystem $(RPiTemplate_SYSROOT)/usr/include/c++/GCC_Version
CLANG_CC_COMPILE_FLAGS+=-cxx-isystem $(RPiTemplate_SYSROOT)/usr/include/arm-linux-gnueabihf/c++/GCC_Version

CLANG_LINK_FLAGS=--target=arm-linux-gnueabihf
CLANG_LINK_FLAGS+=--sysroot=$(RPiTemplate_SYSROOT)
CLANG_LINK_FLAGS+=-L$(RPiTemplate_SYSROOT)/usr/lib/gcc/arm-linux-gnueabihf/GCC_Version
CLANG_LINK_FLAGS+=-L$(RPiTemplate_SYSROOT)/usr/lib/arm-linux-gnueabihf
CLANG_LINK_FLAGS+=-B$(RPiTemplate_SYSROOT)/usr/lib/gcc/arm-linux-gnueabihf/GCC_Version
CLANG_LINK_FLAGS+=-B$(RPiTemplate_SYSROOT)/usr/lib/arm-linux-gnueabihf

CLANG_CC_LINK_FLAGS=$(CLANG_LINK_FLAGS)

%.o: %.c
	$(CLANG) -c $(CLANG_COMPILE_FLAGS) $(CFLAGS) -o $@ $<

define COMPILE_CLANG_CC
$(CLANG_CC) -c $(CLANG_CC_COMPILE_FLAGS) $(CXXFLAGS) -o $@ $^
endef

%.o: %.cxx
	$(COMPILE_CLANG_CC)

%.o: %.cpp
	$(COMPILE_CLANG_CC)

%.o: %.cc
	$(COMPILE_CLANG_CC)

%.o: %.c++
	$(COMPILE_CLANG_CC)

