#
# Copyright (C) 2020 Bithium S.A.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

CMAKE_VERSION := 3.13.4
CMAKE_PATH := $(HOST_OUT)/bin/cmake
CMAKE_ARCHIVE := cmake-$(CMAKE_VERSION)-Linux-x86_64.tar.gz
CMAKE_PACKAGE_URL := https://github.com/Kitware/CMake/releases/download/v$(CMAKE_VERSION)
CMAKE_MODULE_ARCHIVE := $(OUT_DIR)/$(CMAKE_ARCHIVE)

LOCAL_MODULE := cmake-prebuilt
LOCAL_IS_HOST_MODULE := true

LOCAL_ADDITIONAL_DEPENDENCIES = $(CMAKE_PATH)

$(CMAKE_PATH): $(CMAKE_MODULE_ARCHIVE)
	tar -xmvf $< -C $(HOST_OUT) --strip 1
	touch $@

$(CMAKE_MODULE_ARCHIVE):
	wget '$(CMAKE_PACKAGE_URL)/$(CMAKE_ARCHIVE)' -O '$@'
	touch $@

include $(BUILD_PHONY_PACKAGE)

$(LOCAL_MODULE): $(CMAKE_PATH)
