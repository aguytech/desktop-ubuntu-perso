#!/bin/bash

######################## CONF

S_TRACE=debug
_PATH_BASE=$( readlink -f ${0%/*} )
_PATH_CONF=/usr/local/conf
_PATH_LOG=/var/log/desktop-install
_CMD="sudo apt"
_CMD_INS="sudo apt install -y"

# inc
file=${_path_base}/bs/inc
! [ -f "${file}" ] && echo "Unable to find file: ${file}" && exit 1
! . ${file} && echo "Errors while sourcing file: ${file}" && exit 1

########################  SUB

subpart=perso
parts_perso="global conf root mozilla"
# sublimetext sublimemerge

for _PART in ${parts_perso}; do
	_source_sub "${_PART}" ${subpart}
done

_echoa "All parts has done"

_exit
