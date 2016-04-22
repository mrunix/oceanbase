ADD_SUBDIRECTORY(client)

SET(syschecker_sources
	main.cpp
	ob_syschecker_main.cpp
	ob_syschecker.cpp
	ob_syschecker_param.cpp
	ob_write_worker.cpp
	ob_read_worker.cpp
	ob_syschecker_stat.cpp
	ob_syschecker_rule.cpp
	ob_syschecker_schema.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "syschecker")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${syschecker_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	client.static
	chunkserver.static
)
BUILD_EXECUTABLE()

