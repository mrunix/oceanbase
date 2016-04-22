
SET(MIXED_TEST_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
)

INCLUDE_DIRECTORIES(
	${PROJECT_SOURCE_DIR}/tests/common
	${PROJECT_SOURCE_DIR}/tests/updateserver
)

SET(MIXED_TEST_FLAGS  "${COMMON_CXXFLAGS} -D_BTREE_ENGINE_")

SET(updateserver_sources
	mutator_builder.cpp
	rowkey_builder.cpp
	utils.cpp
	cellinfo_builder.cpp
	client_wrapper.cpp
	row_checker.cpp
	${PROJECT_SOURCE_DIR}/tests/updateserver/test_utils.cpp
	${PROJECT_SOURCE_DIR}/src/updateserver/ob_ups_stat.cpp
)


SET(multi_write_sources
	multi_write.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "multi_write")
SET(LOCAL_CXX_FLAGS  "${MIXED_TEST_FLAGS}")
SET(LOCAL_CXX_FILES  ${multi_write_sources} ${updateserver_sources})
SET(LOCAL_LIBRARIES  ${MIXED_TEST_LIBRARIES} updateserver.static)
BUILD_EXECUTABLE()


SET(total_scan_sources
	total_scan.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "total_scan")
SET(LOCAL_CXX_FLAGS  "${MIXED_TEST_FLAGS}")
SET(LOCAL_CXX_FILES  ${total_scan_sources} ${updateserver_sources})
SET(LOCAL_LIBRARIES  ${MIXED_TEST_LIBRARIES} updateserver.static)
BUILD_EXECUTABLE()


SET(random_read_sources
	random_read.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "random_read")
SET(LOCAL_CXX_FLAGS  "${MIXED_TEST_FLAGS}")
SET(LOCAL_CXX_FILES  ${random_read_sources} ${updateserver_sources})
SET(LOCAL_LIBRARIES  ${MIXED_TEST_LIBRARIES} updateserver.static)
BUILD_EXECUTABLE()


SET(launcher_sources
	launcher.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "launcher")
SET(LOCAL_CXX_FLAGS  "${MIXED_TEST_FLAGS}")
SET(LOCAL_CXX_FILES  ${launcher_sources})
SET(LOCAL_LIBRARIES  ${MIXED_TEST_LIBRARIES})
BUILD_EXECUTABLE()

