
SET(ROOTTABLE_SOURCES
	ob_old_root_table_schema.cpp
	ob_tablet_meta_table_row.cpp
	ob_first_tablet_entry_meta.cpp
	ob_first_tablet_entry_schema.cpp
	ob_first_tablet_entry.cpp
	ob_scan_helper_impl.cpp
	ob_meta_table_schema.cpp
	ob_meta_table3.cpp
	ob_root_table3.cpp
	ob_root_table_service.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "roottable")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${ROOTTABLE_SOURCES})
SET(LOCAL_LIBRARIES  ${SYSLIBS} ${EASYLIB} ${TBSYSLIB})
BUILD_STATIC_LIBRARY()

