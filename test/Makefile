# This software is dedicated to Public Domain and, as such, bears no
# copyright. Please see LICENSE file for details.

include ../RPi.mk

CXXFLAGS+=-std=gnu++14

test_obj=test.o

testpp_obj=testpp.o

all: build 
	
build: test testpp

test: $(test_obj)
	$(CLANG) $(CLANG_LINK_FLAGS) -o $@ $^
	
testpp: $(testpp_obj)
	$(CLANG_CC) $(CLANG_CC_LINK_FLAGS) -o $@ $^

clean: clean_test clean_testpp

clean_test:
	-rm test $(test_obj)

clean_testpp:
	-rm testpp $(testpp_obj)

.PHONY: build clean clean_test clean_testpp
 
