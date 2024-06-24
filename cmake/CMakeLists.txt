cmake_minimum_required(VERSION 3.15)
project(GoocarProxy)
set(CMAKE_CXX_FLAGS "-std=c++0x")

add_executable(GoocarProxy src/common.cpp
        src/goocarProxyI.cpp
        src/main.cpp
        src/ProxyService.cpp
        src/UserBO.cpp
        src/FenceBO.cpp
        src/OrderBO.cpp
        src/UserGroupBo.cpp
        src/LocationBO.cpp
        src/ShortMessageBO.cpp
        src/SearchBO.cpp
        src/ConfigBo.cpp
        src/EnterpriseBO.cpp
        src/NoticeBo.cpp
        src/GpnsChannelMgrBo.cpp
        src/IoTBo.cpp
        src/BusIdGenOp.cpp
        src/Curlplus.cpp
        ../ServantBo/src/PbTrans.cpp
        ../../busline/busidgen/src/busidgen.cpp
        ../common/CgiFrame/src/MYCommon.cpp
        ../../public/common/src/src/TraceThread.cpp
        ../../common_srv/COMMON_TRACE/common/trace.pb.cc
        ../../public/dirtyfilter/trie.cpp
        src/UpdateThread.cpp
        )


target_compile_options(GoocarProxy PRIVATE -g -Wall -std=c++0x)
target_compile_definitions(GoocarProxy PRIVATE _LINUX_OS_ RAPIDJSON_HAS_STDSTRING __STDC_FORMAT_MACROS)

target_include_directories(GoocarProxy PRIVATE src
        /Users/yajunli/Develop/root/usr/include/
        /Users/yajunli/Develop/root/usr/local/include/
        ../common/libgoocar/include
        ../common/Interface/Ice
        ../common/Interface/Protobuf
        ../common/CgiFrame/include
        ../../common_srv/COMMON_TRACE/common
        ../GIMEI/GIMEI/src
        ../Glname/Glname/src
        ../../idgen/src
        ../../rvsgeo/src
        ../ServantBo/src
        /usr/local/include
        /usr/include
        /opt/Ice-3.4.2/include
        ../../public
        ../../public/common/src/include
        ../../public/gmlogapi/src/include
        ../../public/auth/src/include
        ../../busline/busidgen/src
        ../../public/netframe2/include
        ../../public/dirtyfilter/
        )


target_link_directories(GoocarProxy PRIVATE src
        ../../public/libexe
        /usr/lib/nptl
        /usr/lib
        /usr/local/lib
        /usr/Ice_3.4.2/lib
        /usr/Ice_3.4.2/lib64)

target_link_libraries(GoocarProxy PRIVATE -lgoocar -pthread -lrt -lIce -lIceUtil -lcommon -lauthapi -lgmlogapi -llog4cxx -ljson -lboost_thread-mt -lboost_regex -l_redis_cpp_client -lprotobuf
        -lboost_regex -lb64 -lctemplate -lssl -lcmxsece -lcurl -lcrypto -lnframe2)