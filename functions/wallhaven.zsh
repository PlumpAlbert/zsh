#!/bin/zsh
# vim:ft=sh:ts=4:sw=0:nospell:noet
# Author: Plump Albert (plumpalbert@gmail.com)

function wallhaven() {
	PROJECT_DIR="$HOME/.local/share/wallhaven-favs"
	if ! [ -d "$PROJECT_DIR" ]; then
		which git >/dev/null 2>&1
		if [ $? -eq 1 ]; then
			printf "git is not installed!" > /dev/stderr
			exit 1
		fi
		echo ">>> Cloning project sources..."
		git clone 'https://github.com/PlumpAlbert/wallhaven-favs' "$PROJECT_DIR" >/dev/null
	fi

	if ! [ -d "$PROJECT_DIR/.venv" ]; then
		echo ">>> Creating virtual environment"
		python3 -m venv --prompt 'wallhaven-favs' "$PROJECT_DIR/.venv" > /dev/null
	fi

	source "$PROJECT_DIR/.venv/bin/activate"
	echo ">>> Installing dependencies"
	pip install -r "$PROJECT_DIR/requirements.txt" >/dev/null
	python "$PROJECT_DIR/source.py" -u "${1:-PlumpAlbert}" $@
	deactivate
}
