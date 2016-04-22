
SET(mergeserver_lib_sources
	ob_chunk_server_task_dispatcher.cpp
	ob_merge_callback.cpp
	ob_merge_server.cpp
	ob_merge_server_main.cpp
	ob_merge_server_service.cpp
	ob_merger_groupby_operator.cpp
	ob_ms_server_counter.cpp
	ob_merger_operator.cpp
	ob_merger_reverse_operator.cpp
	ob_merger_sorted_operator.cpp
	ob_ms_lease_task.cpp
	ob_ms_monitor_task.cpp
	ob_ms_rpc_proxy.cpp
	ob_ms_async_rpc.cpp
	ob_rpc_event.cpp
	ob_ms_rpc_event.cpp
	ob_ms_request.cpp
	ob_ms_scan_request.cpp
	ob_ms_sub_scan_request.cpp
	ob_ms_get_request.cpp
	ob_ms_sub_get_request.cpp
	ob_ms_scan_param.cpp
	ob_ms_scanner_encoder.cpp
	ob_ms_schema_proxy.cpp
	ob_ms_schema_task.cpp
	ob_ms_service_monitor.cpp
	ob_ms_sql_sorted_operator.cpp
	ob_ms_sql_operator.cpp
	ob_sql_rpc_event.cpp
	ob_ms_sql_rpc_event.cpp
	ob_ms_sql_request.cpp
	ob_ms_sql_scan_request.cpp
	ob_ms_sql_sub_scan_request.cpp
	ob_ms_sql_get_request.cpp
	ob_ms_sql_sub_get_request.cpp
	ob_ms_ups_task.cpp
	ob_mutator_param_decoder.cpp
	ob_param_decoder.cpp
	ob_query_cache.cpp
	ob_read_param_decoder.cpp
	ob_read_param_modifier.cpp
	ob_rs_rpc_proxy.cpp
	ob_merge_server_config.cpp
	ob_ms_sql_proxy.cpp
	ob_get_privilege_task.cpp
	ob_bloom_filter_task_queue_thread.cpp
	ob_insert_cache.cpp
	ob_merge_reload_config.cpp
	ob_frozen_data_cache.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "mergeserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${mergeserver_lib_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sql.static
	obmysql.static
	common.static
	btree.static
	timezone.static
)
BUILD_STATIC_LIBRARY()


SET(mergeserver_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "mergeserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${mergeserver_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sql.static
	obmysql.static
	common.static
	timezone.static
	mergeserver.static
	chunkserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(mergeserver.bin gen_svn_version)
