#
# Copyright (C) 2016-2019 Draios Inc dba Sysdig.
#
# This file is part of falco .
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include(ExternalProject)

set(CATCH_EXTERNAL_URL
    URL https://github.com/catchorg/Catch2/archive/v2.9.1.tar.gz
    URL_HASH MD5=4980778888fed635bf191d8a86f9f89c)
ExternalProject_Add(catch2
    PREFIX ${CMAKE_BINARY_DIR}/catch2-prefix
    ${CATCH_EXTERNAL_URL}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/catch2-prefix/src/catch2/single_include/catch2/catch.hpp
                                            ${CMAKE_BINARY_DIR}/catch2-prefix/include/catch.hpp
)
add_library(catch INTERFACE)
add_dependencies(catch catch2)
target_include_directories(catch INTERFACE ${CMAKE_BINARY_DIR}/catch2-prefix/include)

