SET(PROXYSERVER_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sstable.static
	sql.static
	common.static
	compactsstable.static
	compactsstablev2.static
	comp.static
	btree.static
)

SET(proxyserver_lib_sources
	ob_proxy_server.cpp
	ob_proxy_server_main.cpp
	ob_proxy_service.cpp
	ob_proxy_server_config.cpp
	ob_yunti_proxy.cpp
	ob_yunti_meta.cpp
	ob_proxy_callback.cpp
	ob_proxy_reader.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "proxyserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${proxyserver_lib_sources})
SET(LOCAL_LIBRARIES  ${PROXYSERVER_LIBRARIES})
BUILD_STATIC_LIBRARY()


SET(proxyserver_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "proxyserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${proxyserver_sources})
SET(LOCAL_LIBRARIES  ${PROXYSERVER_LIBRARIES} proxyserver.static)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(proxyserver.bin gen_svn_version)

