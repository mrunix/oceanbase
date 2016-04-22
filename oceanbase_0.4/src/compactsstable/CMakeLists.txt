
SET(compactsstable_sources
	ob_block_membuf.cpp
	ob_compactsstable_mem.cpp
	ob_compact_row.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "compactsstable")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${compactsstable_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${EASYLIB}
	${TBSYSLIB}
)
BUILD_STATIC_LIBRARY()

