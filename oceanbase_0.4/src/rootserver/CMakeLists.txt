
SET(rootserver_lib_sources
	ob_root_server_state.cpp
	ob_daily_merge_checker.cpp
	ob_heartbeat_checker.cpp
	ob_rs_trigger_event_util.cpp
	ob_root_inner_table_task.cpp
	ob_root_async_task_queue.cpp
	ob_chunk_server_manager.cpp
	ob_root_sql_proxy.cpp
	ob_migrate_info.cpp
	ob_restart_server.cpp
	ob_root_balancer.cpp
	ob_root_balancer_runnable.cpp
	ob_root_bootstrap.cpp
	ob_root_callback.cpp
	ob_root_ddl_operator.cpp
	ob_root_fetch_thread.cpp
	ob_root_log_manager.cpp
	ob_root_log_replay.cpp
	ob_root_log_worker.cpp
	ob_root_meta2.cpp
	ob_root_ms_provider.cpp
	ob_root_rpc_stub.cpp
	ob_root_server2.cpp
	ob_root_stat_key.cpp
	ob_root_table2.cpp
	ob_root_ups_provider.cpp
	ob_root_util.cpp
	ob_root_worker.cpp
	ob_schema_service_ms_provider.cpp
	ob_schema_service_ups_provider.cpp
	ob_server_balance_info.cpp
	ob_tablet_info_manager.cpp
	ob_ups_check_runnable.cpp
	ob_ups_heartbeat_runnable.cpp
	ob_ups_manager.cpp
	ob_root_server_config.cpp
	ob_root_monitor_table.cpp
	ob_rs_after_restart_task.cpp
	ob_root_operation_helper.cpp
	ob_root_operation_data.cpp
	ob_rs_schema_operation.cpp
	ob_root_table_operation.cpp
	ob_root_timer_task.cpp
	ob_root_reload_config.cpp
	ob_data_source_mgr.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "rootserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${rootserver_lib_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	roottable.static
	sql.static
	common.static
	timezone.static
)
BUILD_STATIC_LIBRARY()


SET(rootserver_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_root_main.cpp
	main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "rootserver")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${rootserver_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(rootserver.bin gen_svn_version)


SET(schema_reader_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_schema_reader.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "schema_reader")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${schema_reader_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(schema_reader.bin gen_svn_version)


SET(checkpoint2str_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_check_point2str.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "checkpoint2str")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${checkpoint2str_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(checkpoint2str.bin gen_svn_version)


SET(str2checkpoint_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_str2check_point.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "str2checkpoint")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${str2checkpoint_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(str2checkpoint.bin gen_svn_version)


SET(rs_admin_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_root_admin2.cpp
	ob_root_admin2_main.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "rs_admin")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -Wno-sizeof-pointer-memaccess")
SET(LOCAL_CXX_FILES  ${rs_admin_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(rs_admin.bin gen_svn_version)


SET(rs_stress_sources
	${PROJECT_SOURCE_DIR}/svn_version.cpp
	ob_rs_stress.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "rs_stress")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -Wno-sizeof-pointer-memaccess")
SET(LOCAL_CXX_FILES  ${rs_stress_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	rootserver.static
)
BUILD_EXECUTABLE()
ADD_DEPENDENCIES(rs_stress.bin gen_svn_version)
