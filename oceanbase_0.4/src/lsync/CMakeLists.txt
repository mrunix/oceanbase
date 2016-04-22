
SET(LSYNCSERVER_CXX_FLAGS  "${COMMON_CXXFLAGS} -DORDER_SERIALIZE -D__LSYNC_DEBUG__")

SET(lsyncserver_lib_sources
	ob_lsync_server_param.cpp
	ob_lsync_server.cpp
	ob_seekable_log_reader2.cpp
	ob_lsync_callback.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "lsyncserver")
SET(LOCAL_CXX_FLAGS  "${LSYNCSERVER_CXX_FLAGS}")
SET(LOCAL_CXX_FILES  ${lsyncserver_lib_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	updateserver.static
	rootserver.static
	mergeserver.static
	sstable.static
	common.static
	comp.static
	sql.static
	btree.static
)
BUILD_STATIC_LIBRARY()


SET(lsyncserver_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	main.cpp
	ob_lsync_server_main.cpp
	ob_lsync_server_param.cpp
	ob_lsync_server.cpp
	ob_seekable_log_reader2.cpp
	ob_lsync_callback.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "lsyncserver")
SET(LOCAL_CXX_FLAGS  "${LSYNCSERVER_CXX_FLAGS}")
SET(LOCAL_CXX_FILES  ${lsyncserver_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	lsyncserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(lsyncserver.bin gen_svn_version)

