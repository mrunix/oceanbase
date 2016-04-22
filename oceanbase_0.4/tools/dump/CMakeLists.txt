
INCLUDE_DIRECTORIES(
	${PROJECT_SOURCE_DIR}/tools/dump
)

SET(ob_import_sources
	tokenizer.cpp
	ob_import.cpp
	ob_import_producer.cpp
	db_utils.cpp
	file_reader.cpp
	oceanbase_db.cpp
	db_record_set.cpp
	ob_import_comsumer.cpp
	ob_import_param.cpp
	ob_import_main.cpp
	db_table_info.cpp
	db_record.cpp
	${PROJECT_SOURCE_DIR}/src/updateserver/ob_ups_stat.cpp
	file_appender.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "ob_import")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${ob_import_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	updateserver.static
)
BUILD_EXECUTABLE()

