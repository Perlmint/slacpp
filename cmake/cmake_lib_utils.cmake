# Set xcode project property
# ref : https://code.google.com/p/ios-cmake/source/browse/toolchain/iOS.cmake
MACRO( SET_XCODE_PROPERTY TARGET XCODE_PROPERTY XCODE_VALUE )
  SET_PROPERTY( TARGET ${TARGET} PROPERTY XCODE_ATTRIBUTE_${XCODE_PROPERTY} ${XCODE_VALUE} )
ENDMACRO( SET_XCODE_PROPERTY )

# Parse GCC Version
# ref : http://stackoverflow.com/questions/4058565/check-gcc-minor-in-cmake
FUNCTION( GET_GCC_VERSION )
  IF( CMAKE_COMPILER_IS_GNUCC )
    EXECUTE_PROCESS( COMMAND ${CMAKE_C_COMPILER} -dumpversion OUTPUT_VARIABLE GCC_VERSION_LOCAL )
    SET( GCC_VERSION ${GCC_VERSION_LOCAL} PARENT_SCOPE )
    STRING( REGEX MATCHALL "[0-9]+" GCC_VERSION_COMPONENTS ${GCC_VERSION_LOCAL} )
    LIST( GET GCC_VERSION_COMPONENTS 0 GCC_MAJOR_LOCAL )
    SET( GCC_MAJOR ${GCC_MAJOR_LOCAL} PARENT_SCOPE )
    LIST( GET GCC_VERSION_COMPONENTS 1 GCC_MINOR_LOCAL )
    SET( GCC_MINOR ${GCC_MINOR_LOCAL} PARENT_SCOPE )
  ENDIF(  )
ENDFUNCTION(  )
