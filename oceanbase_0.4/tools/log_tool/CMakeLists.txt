SET(LOG_TOOL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	updateserver.static
	common.static
)

INCLUDE_DIRECTORIES(
	${PROJECT_SOURCE_DIR}/tests/updateserver
	${PROJECT_SOURCE_DIR}/tests/common
)

SET(LOG_TOOL_FLAGS  "${COMMON_CXXFLAGS} -DROWKEY_IS_OBJ=1 -DUSE_LIBEASY=1")

SET(log_tool_sources
	log_tool.cpp
	ob_utils.cpp
	${PROJECT_SOURCE_DIR}/src/updateserver/ob_ups_stat.cpp
	${PROJECT_SOURCE_DIR}/svn_version.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "log_tool")
SET(LOCAL_CXX_FLAGS  "${LOG_TOOL_FLAGS}")
SET(LOCAL_CXX_FILES  ${log_tool_sources})
SET(LOCAL_LIBRARIES  ${LOG_TOOL_LIBRARIES})
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(log_tool.bin gen_svn_version)


SET(client_sources
	ob_client2.cpp
	ob_utils.cpp
	${PROJECT_SOURCE_DIR}/src/updateserver/ob_ups_stat.cpp
	${PROJECT_SOURCE_DIR}/svn_version.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "client")
SET(LOCAL_CXX_FLAGS  "${LOG_TOOL_FLAGS}")
SET(LOCAL_CXX_FILES  ${client_sources})
SET(LOCAL_LIBRARIES  ${LOG_TOOL_LIBRARIES})
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(client.bin gen_svn_version)
