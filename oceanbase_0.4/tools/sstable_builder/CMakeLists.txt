
INCLUDE_DIRECTORIES(
	${JAVA_HOME_PATH}/include/linux
	${JAVA_HOME_PATH}/include/
)


SET(mrsstable_sources
	sstable_builder.cpp
	sstable_writer.cpp 
)

CLEAR_VARS()
SET(LOCAL_MODULE     "mrsstable")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${mrsstable_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	sstable.static
	comp.static
)
BUILD_LIBRARY()


SET(test_sstable_builder_sources
	test_sstable_builder.cpp
)

CLEAR_VARS()
SET(LOCAL_MODULE     "test_sstable_builder")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${test_sstable_builder_sources} ${mrsstable_sources})
SET(LOCAL_LIBRARIES
	${SYSLIBS}
	${TBSYSLIB}
	common.static
	sstable.static
	comp.static
)
BUILD_EXECUTABLE()

