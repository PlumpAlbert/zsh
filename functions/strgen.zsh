#!/bin/zsh

function strgen() {
	[ -n $1 ] && [ $1 -eq $1 ] 2>/dev/null
	if [ $? -ne 0 ]; then
		COUNT="$1"
	else
		COUNT=32
	fi

	openssl rand -base64 $COUNT
}
