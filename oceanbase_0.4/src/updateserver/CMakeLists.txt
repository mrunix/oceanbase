
SET(UPDATESERVER_FLAGS  "${COMMON_CXXFLAGS} -D__VERSION_ID__=\"updateserver 1.0.0.0\" -D_BTREE_ENGINE_ -Wno-error=psabi")

SET(updateserver_lib_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_async_log_applier.cpp
	ob_btree_engine_alloc.cpp
	ob_cached_pos_log_reader.cpp
	ob_data_block.cpp
	ob_fetched_log.cpp
	ob_located_log_reader.cpp
	ob_lock_mgr.cpp
	ob_log_buffer.cpp
	ob_log_replay_worker.cpp
	ob_log_src.cpp
	ob_log_sync_delay_stat.cpp
	ob_memtable.cpp
	ob_memtable_rowiter.cpp
	ob_multi_file_utils.cpp
	ob_on_disk_log_locator.cpp
	ob_pos_log_reader.cpp
	ob_prefetch_log_buffer.cpp
	ob_query_engine.cpp
	ob_remote_log_src.cpp
	ob_replay_log_src.cpp
	ob_ring_data_buffer.cpp
	ob_schema_mgrv2.cpp
	ob_session_mgr.cpp
	ob_sessionctx_factory.cpp
	ob_slave_sync_type.cpp
	ob_sstable_mgr.cpp
	ob_store_mgr.cpp
	ob_table_engine.cpp
	ob_table_mgr.cpp
	ob_trans_buffer.cpp
	ob_trans_executor.cpp
	ob_trans_mgr.cpp
	ob_transfer_sstable_query.cpp
	ob_update_callback.cpp
	ob_update_server.cpp
	ob_update_server_main.cpp
	ob_ups_cache.cpp
	ob_ups_clog_status.cpp
	ob_ups_compact_cell_iterator.cpp
	ob_ups_compact_cell_writer.cpp
	ob_ups_fetch_runnable.cpp
	ob_ups_log_mgr.cpp
	ob_ups_log_utils.cpp
	ob_ups_mutator.cpp
	ob_ups_replay_runnable.cpp
	ob_ups_rpc_stub.cpp
	ob_ups_slave_mgr.cpp
	ob_ups_stat.cpp
	ob_ups_table_mgr.cpp
	ob_ups_timer_task.cpp
	ob_ups_utils.cpp
	ob_update_server_config.cpp
	ob_ups_phy_operator_factory.cpp
	ob_table_list_query.cpp
	ob_ups_lock_filter.cpp
	ob_ups_inc_scan.cpp
	ob_clog_stat.cpp
	ob_memtable_modify.cpp
	ob_trigger_handler.cpp
	ob_update_reload_config.cpp
	ob_inc_seq.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "updateserver")
SET(LOCAL_CXX_FLAGS  "${UPDATESERVER_FLAGS}")
SET(LOCAL_CXX_FILES  ${updateserver_lib_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	sql.static
	sstable.static
	comp.static
	common.static
	btree.static
	timezone.static
)
BUILD_STATIC_LIBRARY()
ADD_DEPENDENCIES(updateserver.static gen_svn_version)


SET(updateserver_sources
	main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "updateserver")
SET(LOCAL_CXX_FLAGS  "${UPDATESERVER_FLAGS}")
SET(LOCAL_CXX_FILES  ${updateserver_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	updateserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(updateserver.bin gen_svn_version)


SET(ob_ping_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ups_mon.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "ob_ping")
SET(LOCAL_CXX_FLAGS  "${UPDATESERVER_FLAGS}")
SET(LOCAL_CXX_FILES  ${ob_ping_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	updateserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(ob_ping.bin gen_svn_version)

