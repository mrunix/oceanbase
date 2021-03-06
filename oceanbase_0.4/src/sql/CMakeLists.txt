SET(sql_parser_sources
	build_plan.cpp
	dml_build_plan.cpp
	ob_alter_table_stmt.cpp
	ob_alter_sys_cnf_stmt.cpp
	ob_create_table_stmt.cpp
	ob_deallocate_stmt.cpp
	ob_delete_stmt.cpp
	ob_drop_table_stmt.cpp
	ob_dual_table_scan.cpp
	ob_execute_stmt.cpp
	ob_explain_stmt.cpp
	ob_insert_stmt.cpp
	ob_logical_plan.cpp
	ob_multi_logic_plan.cpp
	ob_multi_phy_plan.cpp
	ob_physical_plan.cpp
	ob_prepare_stmt.cpp
	ob_raw_expr.cpp
	ob_schema_checker.cpp
	ob_select_stmt.cpp
	ob_show_schema_manager.cpp
	ob_show_stmt.cpp
	ob_stmt.cpp
	ob_sys_params_mgr.cpp
	ob_transformer.cpp
	ob_update_stmt.cpp
	ob_variable_set_stmt.cpp
	ob_kill_stmt.cpp
	parse_malloc.cpp

	priv_build_plan.cpp
	ob_drop_user_stmt.cpp
	ob_set_password_stmt.cpp
	ob_rename_user_stmt.cpp
	ob_lock_user_stmt.cpp
	ob_grant_stmt.cpp
	ob_revoke_stmt.cpp

	ob_priv_executor.cpp
	ob_change_obi_stmt.cpp
)

SET(sql_parser_c_sources
	parse_node.c
	sql_parser.lex.c	
	sql_parser.tab.c
	type_name.c

	ob_non_reserved_keywords.c
)
	
SET(operators_sources
	ob_add_project.cpp
	ob_aggregate_function.cpp
	ob_alter_sys_cnf.cpp
	ob_alter_table.cpp
	ob_column_group_scanner.cpp
	ob_create_table.cpp
	ob_create_user_stmt.cpp
	ob_deallocate.cpp
	ob_delete.cpp
	ob_double_children_phy_operator.cpp
	ob_drop_table.cpp
	ob_execute.cpp
	ob_explain.cpp
	ob_filter.cpp
	ob_groupby.cpp
	ob_in_memory_sort.cpp
	ob_insert.cpp
	ob_join.cpp
	ob_limit.cpp
	ob_merge_distinct.cpp
	ob_merge_except.cpp
	ob_merge_groupby.cpp
	ob_merge_intersect.cpp
	ob_merge_join.cpp
	ob_merge_sort.cpp
	ob_merge_union.cpp
	ob_multi_cg_scanner.cpp
	ob_phy_operator.cpp
	ob_postfix_expression.cpp
	ob_prepare.cpp
	ob_project.cpp
	ob_rename.cpp
	ob_result_set.cpp
	ob_rowkey_phy_operator.cpp
	ob_rpc_scan.cpp
	ob_run_file.cpp
	ob_scalar_aggregate.cpp
	ob_set_operator.cpp
	ob_single_child_phy_operator.cpp
	ob_sort.cpp
	ob_sql.cpp
	ob_sql_expression.cpp
	ob_sql_read_param.cpp
	ob_sql_scan_param.cpp
	ob_sql_get_param.cpp
	ob_sql_session_info.cpp
	ob_sql_session_mgr.cpp
	ob_sql_session_info_traversal.cpp
	ob_sstable_block_scanner.cpp
	ob_sstable_scan.cpp
	ob_sstable_scanner.cpp
	ob_table_mem_scan.cpp
	ob_table_rename.cpp
	ob_table_rpc_scan.cpp
	ob_tablet_join.cpp
	ob_tablet_cache_join.cpp
	ob_tablet_direct_join.cpp
	ob_tablet_scan.cpp
	ob_ups_multi_get.cpp
	ob_ups_scan.cpp
	ob_values.cpp
	ob_variable_set.cpp
	ob_ups_modify.cpp
	ob_inc_scan.cpp
	ob_update.cpp
	ob_phy_operator_type.cpp
	ob_mem_sstable_scan.cpp
	ob_multiple_merge.cpp
	ob_inc_scan.cpp
	ob_insert_dbsem_filter.cpp
	ob_cs_create_plan.cpp
	ob_phy_operator_factory.cpp
	ob_lock_filter.cpp
	ob_ups_executor.cpp
	ob_start_trans.cpp
	ob_end_trans.cpp
	ob_expr_values.cpp
	ob_sstable_get.cpp
	ob_tablet_get_fuse.cpp
	ob_tablet_scan_fuse.cpp
	ob_tablet_read.cpp
	ob_tablet_get.cpp
	ob_sql_read_param.cpp
	ob_multiple_scan_merge.cpp
	ob_multiple_get_merge.cpp
	ob_empty_row_filter.cpp
	ob_sql_read_strategy.cpp
	ob_tablet_join_cache.cpp
	ob_direct_trigger_event_util.cpp
	ob_multi_children_phy_operator.cpp
	ob_row_count.cpp
	ob_when_filter.cpp
	ob_get_cur_time_phy_operator.cpp
	ob_kill_session.cpp
	ob_sql_id_mgr.cpp
	ob_change_obi.cpp
	ob_sql_query_cache.cpp
	ob_sql_id_mgr.cpp
	ob_ps_store_item.cpp
	ob_ps_store.cpp
	ob_sql_character_set.cpp
)

SET(misc_sources						
	ob_ups_result.cpp		
	ob_sql_result_set.cpp	
	ob_sys_params_mgr.cpp
)


CLEAR_VARS()
SET(LOCAL_MODULE     "sql")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS} -Wno-error=format-security")	# tblog.h error: format not a string literal and no format arguments [-Werror=format-security]
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -Wno-error=format-security") # tblog.h error: format not a string literal and no format arguments [-Werror=format-security]
SET(LOCAL_C_FILES    ${sql_parser_c_sources})
SET(LOCAL_CXX_FILES  ${sql_parser_sources} ${operators_sources} ${misc_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	common.static
	compactsstablev2.static
	mergeserver.static
)
BUILD_STATIC_LIBRARY()


