#!/bin/zsh

function venv() {
	ROOT="$(pwd)"

	if ! [ -d "$ROOT/.venv" ]; then
		python3 -m venv \
			--prompt "${1:-$(basename "$ROOT")}" \
			"$ROOT/.venv"
	fi

	source "$ROOT/.venv/bin/activate"

	[ -f "$ROOT/requirements.txt" ] && pip install -r "$ROOT/requirements.txt"
}
