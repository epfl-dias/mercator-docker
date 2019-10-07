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

#Settings are taken in the following order of precedence:
#  1. Shell Environment, or on the command line

#  2. Node-specific settings `settings.local.<Alias>.sh`
if test ! -z "$1" && test -f ${SPATIAL_SEARCH_HOME}/settings.local.$1.sh;
then
	. ${SPATIAL_SEARCH_HOME}/settings.local.$1.sh;
fi

#  3. Federation-specific `settings.local.sh`
if test -f ${SPATIAL_SEARCH_HOME}/settings.local.sh;
then
	. ${SPATIAL_SEARCH_HOME}/settings.local.sh;
fi

#  4. Default settings `settings.default.sh`
if test -f ${SPATIAL_SEARCH_HOME}/settings.default.sh;
then
	. ${SPATIAL_SEARCH_HOME}/settings.default.sh;
fi

if ${SHOW_SETTINGS};
then
	echo "Current settings:"
fi

for v in $(grep '^:' ${SPATIAL_SEARCH_HOME}/settings.default.sh|cut -c 5- |cut -d: -f1)
do
	eval "export $v=\"\$$v\""
	if ${SHOW_SETTINGS};
	then
		eval "echo $v=\$$v"
	fi
done

if ${SHOW_SETTINGS};
then
	echo
fi
