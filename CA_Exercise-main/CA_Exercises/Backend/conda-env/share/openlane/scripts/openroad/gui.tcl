# Copyright 2022 Efabless Corporation
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
source $::env(SCRIPTS_DIR)/openroad/common/io.tcl
read

if { [info exists ::env(CURRENT_SPEF)] } {
    puts "Reading '$::env(CURRENT_SPEF)'..."
    read_spefs
} else {
    puts "\[WARNING\] No SPEF found."

    puts "You may run estimate_parasitics -placement or estimate_parasitics -global_routing to get basic timing information."
}