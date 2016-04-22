
SET(sstable_sources
	ob_aio_buffer_mgr.cpp
	ob_aio_event_mgr.cpp
	ob_block_index_cache.cpp
	ob_blockcache.cpp
	ob_column_group_scanner.cpp
	ob_seq_sstable_scanner.cpp
	ob_sstable_block_builder.cpp
	ob_sstable_block_getter.cpp
	ob_sstable_block_index_buffer.cpp
	ob_sstable_block_index_builder.cpp
	ob_sstable_block_index_v2.cpp
	ob_sstable_block_reader.cpp
	ob_sstable_block_scanner.cpp
	ob_sstable_getter.cpp
	ob_sstable_merger.cpp
	ob_sstable_reader.cpp
	ob_sstable_row.cpp
	ob_sstable_row_cache.cpp
	ob_sstable_scan_param.cpp
	ob_sstable_scanner.cpp
	ob_sstable_schema.cpp
	ob_sstable_schema_cache.cpp
	ob_sstable_trailer.cpp
	ob_sstable_writer.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "sstable")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${sstable_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
	comp.static
	common.static
)
BUILD_STATIC_LIBRARY()

