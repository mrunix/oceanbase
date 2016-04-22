
SET(obsql_sources
	ob_sql_atomic.cpp
	ob_sql_curl.cpp
	ob_sql_cluster_config.cpp
	ob_sql_update_worker.cpp
	ob_sql_data_source_utility.cpp
	ob_sql_group_data_source.cpp
	ob_sql_init.cpp
	ob_sql_conn_acquire.cpp
	ob_sql_util.cpp
	ob_sql_real_func.cpp
	ob_sql_cluster_select.cpp
	ob_sql_ms_select.cpp
	ob_sql_mysql_adapter.cpp
	ob_sql_list.cpp
	ob_sql_select_method_impl.cpp
	ob_sql_global.cpp
	ob_sql_conn_recycle.cpp
	ob_sql_parser.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "obsql")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -Wl,-static,-ltbnet -Wl,-static,-ltbsys -Wl,-e,so_main")
SET(LOCAL_CXX_FILES  ${obsql_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	common.static
	rootserver.static
)
BUILD_LIBRARY()

