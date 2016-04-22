
IF(NOT BUILD_LIB_TYPE)
	SET(BUILD_LIB_TYPE "SHARED")	# prefer shared to static library
ENDIF()

IF(BUILD_LIB_TYPE MATCHES "STATIC")
	SET(LIB_TYPE ".static")
ELSE()
	SET(LIB_TYPE ".shared")			# prefer shared to static library
ENDIF()

IF(CMAKE_SYSTEM MATCHES "Linux")
    INCLUDE(linux.os)
ENDIF(CMAKE_SYSTEM MATCHES "Linux")
# Defines functions and macros useful for building project

MACRO(CLEAR_VARS)
	SET(LOCAL_C_FLAGS "")
	SET(LOCAL_CXX_FLAGS "")
	SET(LOCAL_SHARED_LINKER_FLAGS "")
	SET(LOCAL_MODULE_LINKER_FLAGS "")
	SET(LOCAL_EXE_LINKER_FLAGS "")
	SET(LOCAL_ASM_FLAGS "")

	SET(LOCAL_C_FILES "")
	SET(LOCAL_CXX_FILES "")
	SET(LOCAL_ASM_FILES "")
	SET(LOCAL_PATH "")
	SET(LOCAL_MODULE "")
	SET(LOCAL_LIBRARIES "")
ENDMACRO()

MACRO(PRINT_VARS)
	MESSAGE("")
	MESSAGE("LOCAL_COMMON_FLAGS        : ${LOCAL_COMMON_FLAGS}")
	MESSAGE("LOCAL_C_FLAGS             : ${LOCAL_C_FLAGS}")
	MESSAGE("LOCAL_CXX_FLAGS           : ${LOCAL_CXX_FLAGS}")
	MESSAGE("LOCAL_SHARED_LINKER_FLAGS : ${LOCAL_SHARED_LINKER_FLAGS}")
	MESSAGE("LOCAL_MODULE_LINKER_FLAGS : ${LOCAL_MODULE_LINKER_FLAGS}")
	MESSAGE("LOCAL_EXE_LINKER_FLAGS    : ${LOCAL_EXE_LINKER_FLAGS}")
	MESSAGE("LOCAL_ASM_FLAGS           : ${LOCAL_ASM_FLAGS}")
	
	MESSAGE("LOCAL_C_FILES             : ${LOCAL_C_FILES}")
	MESSAGE("LOCAL_CXX_FILES           : ${LOCAL_CXX_FILES}")
	MESSAGE("LOCAL_ASM_FILES           : ${LOCAL_ASM_FILES}")
	MESSAGE("LOCAL_PATH                : ${LOCAL_PATH}")
	MESSAGE("LOCAL_MODULE              : ${LOCAL_MODULE}")
	MESSAGE("LOCAL_LIBRARIES           : ${LOCAL_LIBRARIES}")
ENDMACRO()

MACRO(SET_FILES_FLAGS)
	IF(LOCAL_C_FILES AND LOCAL_C_FLAGS)
		SET_SOURCE_FILES_PROPERTIES(
			${LOCAL_C_FILES}
			PROPERTIES
			COMPILE_FLAGS "${LOCAL_C_FLAGS}"
		)
	ENDIF()

	IF(LOCAL_CXX_FILES AND LOCAL_CXX_FLAGS)
		SET_SOURCE_FILES_PROPERTIES(
			${LOCAL_CXX_FILES}
			PROPERTIES
			COMPILE_FLAGS "${LOCAL_CXX_FLAGS}"
		)
	ENDIF()

	IF(LOCAL_ASM_FILES AND LOCAL_ASM_FLAGS)
		SET_SOURCE_FILES_PROPERTIES(
			${LOCAL_ASM_FILES}
			PROPERTIES
			COMPILE_FLAGS "${LOCAL_ASM_FLAGS}"
		)
	ENDIF()
ENDMACRO()

MACRO(SET_MAKE_FLAGS)
	IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
	    SET(LOCAL_C_FLAGS   "${LOCAL_C_FLAGS} ${P_COMMON_FLAGS} ${P_C_FLAGS} ${P_C_FLAGS_DEBUG}")
	    SET(LOCAL_CXX_FLAGS "${LOCAL_CXX_FLAGS} ${P_COMMON_FLAGS} ${P_CXX_FLAGS} ${P_CXX_FLAGS_DEBUG}")
	    SET(LOCAL_ASM_FLAGS "${LOCAL_ASM_FLAGS} ${P_COMMON_FLAGS} ${P_ASM_FLAGS}")
	ENDIF()

	IF(CMAKE_BUILD_TYPE STREQUAL "Release")
		SET(LOCAL_C_FLAGS   "${LOCAL_C_FLAGS} ${P_COMMON_FLAGS} ${P_C_FLAGS} ${P_C_FLAGS_RELEASE}")
	    SET(LOCAL_CXX_FLAGS "${LOCAL_CXX_FLAGS} ${P_COMMON_FLAGS} ${P_CXX_FLAGS} ${P_CXX_FLAGS_RELEASE}")
	    SET(LOCAL_ASM_FLAGS "${LOCAL_ASM_FLAGS} ${P_COMMON_FLAGS} ${P_ASM_FLAGS}")
	ENDIF()

	IF(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
		SET(LOCAL_C_FLAGS   "${LOCAL_C_FLAGS} ${P_COMMON_FLAGS} ${P_C_FLAGS} ${P_C_FLAGS_RELWITHDEBINFO}")
	    SET(LOCAL_CXX_FLAGS "${LOCAL_CXX_FLAGS} ${P_COMMON_FLAGS} ${P_CXX_FLAGS} ${P_CXX_FLAGS_RELWITHDEBINFO}")
	    SET(LOCAL_ASM_FLAGS "${LOCAL_ASM_FLAGS} ${P_COMMON_FLAGS} ${P_ASM_FLAGS}")
	ENDIF()

	IF(P_SHARED_LINKER_FLAGS)
		SET(LOCAL_SHARED_LINKER_FLAGS "${LOCAL_SHARED_LINKER_FLAGS} ${P_SHARED_LINKER_FLAGS}")
	ENDIF()

	IF(P_MODULE_LINKER_FLAGS)
		SET(LOCAL_MODULE_LINKER_FLAGS "${LOCAL_MODULE_LINKER_FLAGS} ${P_MODULE_LINKER_FLAGS}")
	ENDIF()

	IF(P_EXE_LINKER_FLAGS)
		SET(LOCAL_EXE_LINKER_FLAGS    "${LOCAL_EXE_LINKER_FLAGS} ${P_EXE_LINKER_FLAGS}")
	ENDIF()

	STRING(STRIP "${LOCAL_C_FLAGS}" LOCAL_C_FLAGS)
	STRING(STRIP "${LOCAL_CXX_FLAGS}" LOCAL_CXX_FLAGS)
	STRING(STRIP "${LOCAL_ASM_FLAGS}" LOCAL_ASM_FLAGS)
	STRING(STRIP "${LOCAL_SHARED_LINKER_FLAGS}" LOCAL_SHARED_LINKER_FLAGS)
	STRING(STRIP "${LOCAL_MODULE_LINKER_FLAGS}" LOCAL_MODULE_LINKER_FLAGS)
	STRING(STRIP "${LOCAL_EXE_LINKER_FLAGS}" LOCAL_EXE_LINKER_FLAGS)

	SET_FILES_FLAGS()
ENDMACRO()

MACRO(BUILD_EXECUTABLE)
	SET_MAKE_FLAGS()

	SET(LOCAL_TARGET_NAME "${LOCAL_MODULE}.bin")
	ADD_EXECUTABLE(${LOCAL_TARGET_NAME} ${LOCAL_C_FILES} ${LOCAL_CXX_FILES} ${LOCAL_ASM_FILES})
	SET_TARGET_PROPERTIES(${LOCAL_TARGET_NAME} PROPERTIES OUTPUT_NAME ${LOCAL_MODULE})

	IF(LOCAL_EXE_LINKER_FLAGS)
		TARGET_COMPILE_OPTIONs(${LOCAL_MODULE} PRIVATE ${LOCAL_EXE_LINKER_FLAGS})
	ENDIF()

	IF(LOCAL_LIBRARIES)
		FOREACH(LIB "${LOCAL_LIBRARIES}")
			TARGET_LINK_LIBRARIES(${LOCAL_TARGET_NAME} ${LIB}) 
		ENDFOREACH() 
	ENDIF()
ENDMACRO()

MACRO(BUILD_STATIC_LIBRARY)
	SET_MAKE_FLAGS()

	SET(LOCAL_TARGET_NAME "${LOCAL_MODULE}.static")
	ADD_LIBRARY(${LOCAL_TARGET_NAME} STATIC ${LOCAL_C_FILES} ${LOCAL_CXX_FILES} ${LOCAL_ASM_FILES})
	SET_TARGET_PROPERTIES(${LOCAL_TARGET_NAME} PROPERTIES OUTPUT_NAME ${LOCAL_MODULE})

	IF(LOCAL_MODULE_LINKER_FLAGS)
		TARGET_COMPILE_OPTIONs(${LOCAL_TARGET_NAME} PRIVATE ${LOCAL_MODULE_LINKER_FLAGS})
	ENDIF()

	IF(LOCAL_LIBRARIES)
		FOREACH(LIB "${LOCAL_LIBRARIES}")
			TARGET_LINK_LIBRARIES(${LOCAL_TARGET_NAME} ${LIB}) 
		ENDFOREACH() 
	ENDIF()
ENDMACRO()

MACRO(BUILD_SHARED_LIBRARY)
	SET_MAKE_FLAGS()

	SET(LOCAL_TARGET_NAME "${LOCAL_MODULE}.shared")
	ADD_LIBRARY(${LOCAL_TARGET_NAME} SHARED ${LOCAL_C_FILES} ${LOCAL_CXX_FILES} ${LOCAL_ASM_FILES})
	SET_TARGET_PROPERTIES(${LOCAL_TARGET_NAME} PROPERTIES OUTPUT_NAME ${LOCAL_MODULE})

	IF(LOCAL_SHARED_LINKER_FLAGS)
		TARGET_COMPILE_OPTIONs(${LOCAL_TARGET_NAME} PRIVATE ${LOCAL_SHARED_LINKER_FLAGS})
	ENDIF()

	IF(LOCAL_LIBRARIES)
		FOREACH(LIB "${LOCAL_LIBRARIES}")
			TARGET_LINK_LIBRARIES(${LOCAL_TARGET_NAME} ${LIB}) 
		ENDFOREACH() 
	ENDIF()
ENDMACRO()

MACRO(BUILD_LIBRARY)
	IF(BUILD_LIB_TYPE MATCHES "BOTH")
		BUILD_STATIC_LIBRARY()
		BUILD_SHARED_LIBRARY()
	ELSEIF(BUILD_LIB_TYPE MATCHES "SHARED")
		BUILD_SHARED_LIBRARY()
	ELSE()
		BUILD_STATIC_LIBRARY()
	ENDIF()
ENDMACRO()

MACRO(BUILD_UNITTEST)
    SET(LOCAL_C_FLAGS          "${LOCAL_C_FLAGS} ${P_COMMON_FLAGS} ${P_C_UNITTEST_FLAGS} ${P_C_FLAGS_DEBUG}")
    SET(LOCAL_CXX_FLAGS        "${LOCAL_CXX_FLAGS} ${P_COMMON_FLAGS} ${P_CXX_UNITTEST_FLAGS} ${P_CXX_FLAGS_DEBUG}")
    SET(LOCAL_ASM_FLAGS        "${LOCAL_ASM_FLAGS} ${P_COMMON_FLAGS} ${P_ASM_FLAGS}")
    SET(LOCAL_EXE_LINKER_FLAGS "${LOCAL_EXE_LINKER_FLAGS} ${P_UNITTEST_LINKER_FLAGS}")

    STRING(STRIP "${LOCAL_C_FLAGS}" LOCAL_C_FLAGS)
	STRING(STRIP "${LOCAL_CXX_FLAGS}" LOCAL_CXX_FLAGS)
	STRING(STRIP "${LOCAL_ASM_FLAGS}" LOCAL_ASM_FLAGS)
	STRING(STRIP "${LOCAL_SHARED_LINKER_FLAGS}" LOCAL_SHARED_LINKER_FLAGS)
	STRING(STRIP "${LOCAL_MODULE_LINKER_FLAGS}" LOCAL_MODULE_LINKER_FLAGS)
	STRING(STRIP "${LOCAL_EXE_LINKER_FLAGS}" LOCAL_EXE_LINKER_FLAGS)

	SET_FILES_FLAGS()

	ADD_EXECUTABLE(${LOCAL_MODULE} ${LOCAL_C_FILES} ${LOCAL_CXX_FILES} ${LOCAL_ASM_FILES})

	IF(LOCAL_EXE_LINKER_FLAGS)
		TARGET_COMPILE_OPTIONs(${LOCAL_MODULE} PRIVATE ${LOCAL_EXE_LINKER_FLAGS})
	ENDIF()

	IF(LOCAL_LIBRARIES)
		FOREACH(LIB "${LOCAL_LIBRARIES}")
			TARGET_LINK_LIBRARIES(${LOCAL_MODULE} ${LIB}) 
		ENDFOREACH() 
	ENDIF()
	ADD_TEST(${LOCAL_MODULE} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${LOCAL_MODULE})
	SETUP_TARGET_FOR_COVERAGE("${LOCAL_MODULE}" "" "${PROJECT_BINARY_DIR}/lcov_report/${name}")
ENDMACRO()

