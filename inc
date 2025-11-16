#!/bin/bash

_source_perso() {
	if ! grep -q "^perso $1" ${S_FILE_INSTALL_DONE}; then
		_echoA "\n> perso $1"
		local file="${_PATH_BASE}/perso/sub/$1"
		! [ -f "${file}" ] && _exite "Unable to find file: ${file}"
		if . "${file}"; then
			echo "perso $1" >> ${S_FILE_INSTALL_DONE}
			_echoA "< perso $1\n"
			_askno "Validate to continue"
		else
			_echoE "See file log $1 for errors"
			exit
		fi
	fi
}
