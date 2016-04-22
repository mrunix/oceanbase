
SET(OBLOG_FLAGS  "${COMMON_CXXFLAGS} -D__DENSE_AVAILABLE__")
SET(OBLOG_FLAGS  "${OBLOG_FLAGS} -rdynamic")
SET(OBLOG_FLAGS  "${OBLOG_FLAGS} -Wl,-Bsymbolic -Wl,-e,so_main")

INCLUDE_DIRECTORIES(
	${PROJECT_SOURCE_DIR}/external/ds/include/drcmessage
	/usr/include/lua5.1
)

SET(oblog_cxx_sources
	liboblog.cpp
	MetaData.cpp
	BinlogRecord.cpp
	ob_log_rpc_stub.cpp
	ob_log_filter.cpp
	ob_log_router.cpp
	ob_log_meta_manager.cpp
	ob_log_formator.cpp
	ob_log_fetcher.cpp
	ob_log_spec.cpp
	ob_log_config.cpp
	ob_log_entity.cpp
	ob_log_partitioner.cpp
	ob_log_server_selector.cpp
	ob_log_mysql_adaptor.cpp
)

SET(oblog_c_sources
	ob_log_main.c
	${PROJECT_SOURCE_DIR}/svn_version.c
)


CLEAR_VARS()
SET(LOCAL_MODULE     "oblog")
SET(LOCAL_C_FLAGS    "${OBLOG_FLAGS}")
SET(LOCAL_CXX_FLAGS  "${OBLOG_FLAGS} -Wno-error=psabi") # ob_priority_scheduler.h:34:33: error: AVX vector return without AVX enabled changes the ABI [-Werror=psabi]
SET(LOCAL_C_FILES    ${oblog_c_sources})
SET(LOCAL_CXX_FILES  ${oblog_cxx_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	sstable.static
	comp.static
	curl
	lua5.1
	${PROJECT_SOURCE_DIR}/external/ds/lib64/libdrcmsg.so
)
BUILD_LIBRARY()

