
SET(chunkserver_lib_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_block_cache_loader.cpp
	ob_block_cache_reader.cpp
	ob_cell_array_helper.cpp
	ob_cell_stream.cpp
	ob_chunk_callback.cpp
	ob_chunk_merge.cpp
	ob_tablet_merger_v1.cpp
	ob_tablet_merger_v2.cpp
	ob_chunk_server.cpp
	ob_chunk_server_main.cpp
	ob_chunk_server_merger_proxy.cpp
	ob_chunk_server_stat.cpp
	ob_chunk_service.cpp
	ob_compactsstable_cache.cpp
	ob_disk_manager.cpp
	ob_file_recycle.cpp
	ob_fileinfo_cache.cpp
	ob_get_cell_stream.cpp
	ob_get_cell_stream_wrapper.cpp
	ob_get_param_cell_iterator.cpp
	ob_get_scan_proxy.cpp
	ob_join_cache.cpp
	ob_join_operator.cpp
	ob_merge_join_operator.cpp
	ob_merge_operator.cpp
	ob_merge_reader.cpp
	ob_multi_tablet_merger.cpp
	ob_query_agent.cpp
	ob_query_service.cpp
	ob_read_param_modifier.cpp
	ob_read_ups_balance.cpp
	ob_row_cell_vec.cpp
	ob_rpc_proxy.cpp
	ob_scan_cell_stream.cpp
	ob_schema_task.cpp
	ob_sql_rpc_stub.cpp
	ob_switch_cache_utility.cpp
	ob_tablet.cpp
	ob_tablet_image.cpp
	ob_tablet_manager.cpp
	ob_tablet_merge_filter.cpp
	ob_ups_blacklist.cpp
	ob_chunk_server_config.cpp
	ob_bypass_sstable_loader.cpp
	ob_tablet_service.cpp
	ob_tablet_writer.cpp
	ob_tablet_reader.cpp
	ob_chunk_reload_config.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "chunkserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${chunkserver_lib_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sstable.static
	compactsstable.static
	common.static
	sql.static
	compactsstablev2.static
	comp.static
	btree.static
	timezone.static
)
BUILD_STATIC_LIBRARY()
ADD_DEPENDENCIES(chunkserver.static gen_svn_version)


SET(chunkserver_sources
	ob_disk_path.cpp
	main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "chunkserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${chunkserver_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sstable.static
	compactsstable.static
	common.static
	sql.static
	compactsstablev2.static
	comp.static
	btree.static
	timezone.static
	chunkserver.static
)
BUILD_EXECUTABLE()

