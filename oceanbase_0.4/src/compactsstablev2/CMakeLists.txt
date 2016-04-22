
SET(compactsstablev2_sources
	ob_sstable_buffer.cpp
	ob_sstable_block_builder.cpp
	ob_sstable_block_endkey_builder.cpp
	ob_sstable_block_index_builder.cpp
	ob_sstable_table_index_builder.cpp
	ob_sstable_table_schema_builder.cpp
	ob_sstable_table_range_builder.cpp
	ob_sstable_table.cpp
	ob_sstable_schema.cpp
	ob_sstable.cpp
	ob_compact_sstable_writer_buffer.cpp
	ob_compact_sstable_writer.cpp
	ob_sstable_block_index_mgr.cpp
	ob_sstable_block_index_cache.cpp
	ob_sstable_aio_event_mgr.cpp
	ob_sstable_aio_buffer_mgr.cpp
	ob_sstable_block_cache.cpp
	ob_sstable_schema_cache.cpp
	ob_compact_sstable_reader.cpp
	ob_sstable_block_reader.cpp
	ob_sstable_block_scanner.cpp
	ob_sstable_scan_column_indexes.cpp
	ob_compact_sstable_scanner.cpp
	ob_sstable_block_getter.cpp
	ob_compact_sstable_getter.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "compactsstablev2")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -pg -D_SSTABLE_NO_STAT_")
SET(LOCAL_CXX_FILES  ${compactsstablev2_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	common.static
	sstable.static
)
BUILD_STATIC_LIBRARY()

