
INCLUDE_DIRECTORIES(
	${PROJECT_SOURCE_DIR}/tools/getquerytest/include/mysql
)

SET(getquery_sources
	getquery.cpp
	get_query_test.cpp
	ob_sql_client.cpp
	ob_sql_generator.cpp
	ob_sql_db_creater.cpp
	ob_sql_writer.cpp
	ob_sql_reader.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "getquery")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS} -D__STDC_LIMIT_MACROS -DORDER_SERIALIZE")
SET(LOCAL_CXX_FILES  ${getquery_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	mysqlclient
)
BUILD_EXECUTABLE()

