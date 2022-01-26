appname := helloworld

CXX := gcc
CXXFLAGS := -Wall -g

srcfiles := $(shell find . -maxdepth 1 -name "*.c")
objects  := $(patsubst %.c, %.o, $(srcfiles))
cleanfiles := $(appname)

all: $(appname)

## Platform Detection Variables
ifeq ($(OS),Windows_NT)
  PLATFORM ?= win
else
  UNAME_S ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
  UNAME_M ?= $(shell uname -m | tr '[:upper:]' '[:lower:]')
  ifeq ($(UNAME_S),linux)
    PLATFORM ?= lin
  endif
  ifeq ($(UNAME_S),darwin)
    PLATFORM_VERSION=$(shell sw_vers | awk '/^ProductVersion:/ { print $2 }')
    PLATFORM_MAJOR_VERSION=$(shell echo "$(PLATFORM_VERSION)" | cut -d. -f1,2)
    # x86_64 Apple hardware often runs 32-bit kernels (see OHAI-63)
    # macOS Monterey + Apple M1 Silicon (arm64) gives empty string for this x86_64 check
    x86_64 := $(shell sysctl -n hw.optional.x86_64)
    arm64 := $(shell sysctl -n hw.optional.arm64)
    ifeq ($(x86_64),1)
      MACHINE := x86_64
    endif
    ifeq ($(arm64),1)
      MACHINE := arm64
    endif
    PLATFORM ?= mac
  endif
  # uname -m will return x86_64 in Rosetta terminal
  TARGET_ARCH ?= $(UNAME_M)
endif

debug:
	echo appname=$(appname)
	echo objects=$(objects)
	echo srcfiles=$(srcfiles)
	echo OS=$(OS)
	echo x86_64=$(x86_64)
	echo arm64=$(arm64)
	echo PLATFORM=$(PLATFORM)
	echo UNAME_S=$(UNAME_S)
	echo UNAME_M=$(UNAME_M)
	echo MACHINE=$(MACHINE)
	echo TARGET_ARCH=$(TARGET_ARCH)

# MacOS M1 / arm64 specific targets
ifeq ($(PLATFORM),mac)
  ifeq ($(MACHINE),arm64)

cleanfiles := $(cleanfiles) $(appname).arm64 $(appname).x86_64
LIPOFLAGS := -create
CLEAN_DSYM_DIRS := rm -rf ./$(appname)*.dSYM
objects_x86_64  := $(patsubst %.c, %.o.x86_64, $(srcfiles))
objects_arm64   := $(patsubst %.c, %.o.arm64,  $(srcfiles))

CXXFLAGS := -arch x86_64 -arch arm64 $(CXXFLAGS)
$(objects): $(objects_arm64) $(objects_x86_64)
	echo TODO
$(appname): $(srcfiles)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

#$(objects_arm64): $(srcfiles)
#	$(CXX) -arch arm64  $(CXXFLAGS) $(LDFLAGS) -o $@.arm64  $^ $(LDLIBS)
#$(objects_x86_64): $(srcfiles)
#	$(CXX) -arch x86_64 $(CXXFLAGS) $(LDFLAGS) -o $@.x86_64 $^ $(LDLIBS)

#$(appname).x86_64: $(objects_x86_64)
#	$(CXX) -arch x86_64 $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
#$(appname).arm64: $(objects_arm64)
#	$(CXX) -arch arm64  $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

#$(appname): $(appname).arm64 $(appname).x86_64
#	$(LIPO) $(LIPOFLAGS) -output $@ $^

  endif
else
# Other OS single target
$(appname): $(objects)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
endif

clean:
	rm -f $(objects)
	rm -f ./$(cleanfiles)
	$(CLEAN_DSYM_DIRS)

dist-clean: clean
	rm -f *~ .depend
