
SET(client_sources
	ob_client.cpp
	ob_server_manager.cpp
	ob_server_rpc.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "client")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${client_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
)
BUILD_STATIC_LIBRARY()

