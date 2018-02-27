#
# Find FreeImage
#
# Try to find FreeImage.
# This module defines the following variables:
# - FREEIMAGE_INCLUDE_DIRS
# - FREEIMAGE_LIBRARIES
# - FREEIMAGE_FOUND
#
# The following variables can be set as arguments for the module.
# - FREEIMAGE_ROOT_DIR : Root library directory of FreeImage
#

# Additional modules
include(FindPackageHandleStandardArgs)

if (WIN32)
	# Find include files
	find_path(
		FREEIMAGE_INCLUDE_DIR
		NAMES FreeImage.h
		PATHS
			$ENV{PROGRAMFILES}/include
			${FREEIMAGE_ROOT_DIR}/include
			${CMAKE_SOURCE_DIR}/../../LIBRARY/include
		DOC "The directory where FreeImage.h resides")

	MESSAGE( STATUS "CMAKE_SOURCE_DIR:         " ${CMAKE_SOURCE_DIR} )
	# Find library files
	find_library(
		FREEIMAGE_LIBRARY
		NAMES FreeImage.lib
		PATHS
			$ENV{PROGRAMFILES}/lib
			${FREEIMAGE_ROOT_DIR}/lib
			${CMAKE_SOURCE_DIR}/../../LIBRARY/lib_x64)
else()
	# Find include files
	find_path(
		FREEIMAGE_INCLUDE_DIR
		NAMES FreeImage.h
		PATHS
			/usr/include
			/usr/local/include
			/sw/include
			/opt/local/include
		DOC "The directory where FreeImage.h resides")

	# Find library files
	find_library(
		FREEIMAGE_LIBRARY
		NAMES freeimage
		PATHS
			/usr/lib64
			/usr/lib
			/usr/lib/x86_64-linux-gnu
			/usr/local/lib64
			/usr/local/lib
			/sw/lib
			/opt/local/lib
			${FREEIMAGE_ROOT_DIR}/lib
		DOC "The FreeImage library")
endif()

# Handle REQUIRED argument, define *_FOUND variable
find_package_handle_standard_args(FreeImage DEFAULT_MSG FREEIMAGE_INCLUDE_DIR FREEIMAGE_LIBRARY)

# Define FREEIMAGE_LIBRARIES and FREEIMAGE_INCLUDE_DIRS
if (FREEIMAGE_FOUND)
	set(FREEIMAGE_LIBRARIES ${FREEIMAGE_LIBRARY})
	set(FREEIMAGE_INCLUDE_DIRS ${FREEIMAGE_INCLUDE_DIR})
endif()

# Hide some variables
mark_as_advanced(FREEIMAGE_INCLUDE_DIR FREEIMAGE_LIBRARY)
