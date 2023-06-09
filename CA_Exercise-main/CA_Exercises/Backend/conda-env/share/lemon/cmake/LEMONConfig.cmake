SET(LEMON_INCLUDE_DIR "/users/students/r0757781/Documents/COMP-ARCH/CA_Exercise-main/CA_Exercises/Backend/conda-env/include" CACHE PATH "LEMON include directory")
SET(LEMON_INCLUDE_DIRS "${LEMON_INCLUDE_DIR}")

IF(UNIX)
  SET(LEMON_LIB_NAME "libemon.a")
ELSEIF(WIN32)
  SET(LEMON_LIB_NAME "lemon.lib")
ENDIF(UNIX)

SET(LEMON_LIBRARY "/users/students/r0757781/Documents/COMP-ARCH/CA_Exercise-main/CA_Exercises/Backend/conda-env/lib/${LEMON_LIB_NAME}" CACHE FILEPATH "LEMON library")
SET(LEMON_LIBRARIES "${LEMON_LIBRARY}")

MARK_AS_ADVANCED(LEMON_LIBRARY LEMON_INCLUDE_DIR)
