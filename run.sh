#!/bin/sh
# The MIT License (MIT)
#
# Copyright (c) 2019 Data Intensive Applications and Systems Laboratory (DIAS)
#                    Ecole Polytechnique Federale de Lausanne
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Import settings
: ${SPATIAL_SEARCH_HOME:="${PWD}"}
. ${SPATIAL_SEARCH_HOME}/settings.sh

# Permanent storage
if [ ! -d ${KG_SPATIAL_SEARCH_DATA} ];
then
	mkdir -p ${KG_SPATIAL_SEARCH_DATA}
	sudo chown ${KG_SPATIAL_SEARCH_USER_ID}:${KG_SPATIAL_SEARCH_GROUP_ID} ${KG_SPATIAL_SEARCH_DATA}
fi

# Generate Configuration from templates
for f in ${KG_CONF_FILE_JETTY} ${KG_CONF_FILE_CONTEXT}
do
	for v in $(grep '^:' settings.default.sh|cut -c 5- |cut -d: -f1)
	do
		eval "t=\"s#${v}#\${${v}}#g\""
		script="${script}${t};"
		sed -e "${script}" $f.in > $f
	done
done

docker-compose $@
