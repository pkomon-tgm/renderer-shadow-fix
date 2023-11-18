#############################################################################
# Alpine Terrain Renderer
# Copyright (C) 2023 Adam Celarek <family name at cg tuwien ac at>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################

find_package(Qt6 REQUIRED COMPONENTS Test)
if (NOT TARGET Catch2)
    alp_add_git_repository(catch2 URL https://github.com/catchorg/Catch2.git COMMITISH v3.4.0)
endif()

if (EMSCRIPTEN AND ALP_ENABLE_THREADING)
    target_compile_options(Catch2 PRIVATE -pthread)
endif()

include(${qml_catch2_console_SOURCE_DIR}/src/qml_catch2_console.cmake)

function(alp_add_unittest name)

if(EMSCRIPTEN)
    add_qml_catch2_console_unittests(${name} ${ARGN})
else()
endif()


endfunction()
