# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jeffrey/sync/programs/exercism/cpp/word-count

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jeffrey/sync/programs/exercism/cpp/word-count/build

# Utility rule file for test_word-count.

# Include the progress variables for this target.
include CMakeFiles/test_word-count.dir/progress.make

CMakeFiles/test_word-count: word-count
	./word-count

test_word-count: CMakeFiles/test_word-count
test_word-count: CMakeFiles/test_word-count.dir/build.make

.PHONY : test_word-count

# Rule to build all files generated by this target.
CMakeFiles/test_word-count.dir/build: test_word-count

.PHONY : CMakeFiles/test_word-count.dir/build

CMakeFiles/test_word-count.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_word-count.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_word-count.dir/clean

CMakeFiles/test_word-count.dir/depend:
	cd /home/jeffrey/sync/programs/exercism/cpp/word-count/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jeffrey/sync/programs/exercism/cpp/word-count /home/jeffrey/sync/programs/exercism/cpp/word-count /home/jeffrey/sync/programs/exercism/cpp/word-count/build /home/jeffrey/sync/programs/exercism/cpp/word-count/build /home/jeffrey/sync/programs/exercism/cpp/word-count/build/CMakeFiles/test_word-count.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_word-count.dir/depend

