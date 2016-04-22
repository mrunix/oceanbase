
SET(BTREE_SOURCES
	btree_default_alloc.cpp
	btree_node.cpp
	btree_read_param.cpp
	btree_write_handle.cpp
	id_btree.cpp
	key_btree.cpp
	btree_base.cpp
	btree_read_handle_new.cpp
	btree_base_handle.cpp
	btree_root_pointer.cpp
	btree_array_list.cpp
	btree_write_param.cpp
	id_key_btree.cpp
)

#-DOCEAN_BASE_BTREE_USE_SYS_MALLOC -DOCEAN_BASE_BTREE_DEBUG
CLEAR_VARS()
SET(LOCAL_MODULE     "btree")
SET(LOCAL_C_FLAGS    "${COMMON_CFLAGS}")
SET(LOCAL_CXX_FLAGS  "${COMMON_CXXFLAGS}")
SET(LOCAL_CXX_FILES  ${BTREE_SOURCES})
SET(LOCAL_LIBRARIES  ${SYSLIBS})
BUILD_STATIC_LIBRARY()

