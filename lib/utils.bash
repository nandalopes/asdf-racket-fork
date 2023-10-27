#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="racket"
TOOL_TEST="racket --version"

# simulate tac on macOS
if ! command -v tac &>/dev/null; then
	tac() {
		tail -r
	}
fi

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if racket is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	curl -s https://download.racket-lang.org/all-versions.html | grep -E -o 'Version [0-9.]+' | cut -d' ' -f 2 | tac
}

download_release() {
	local version filename url platform
	version="$1"
	filename="$2"
	platform="racket"

	if [ "${ASDF_RACKET_MINIMAL-}" ]; then
		platform="racket-minimal"
	fi

	url="https://mirror.racket-lang.org/installers/${version}/${platform}-${version}-src-builtpkgs.tgz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	ASDF_RACKET_CONFIG_FLAGS="${ASDF_RACKET_CONFIG_FLAGS-} --prefix ${install_path}"

	if [ "$(uname -s)" == "Darwin" ]; then
		ASDF_RACKET_CONFIG_FLAGS="${ASDF_RACKET_CONFIG_FLAGS} --enable-macprefix"
	fi

	(
		mkdir -p "$install_path"

		cd "$ASDF_DOWNLOAD_PATH"/src
		xargs ./configure <<<"${ASDF_RACKET_CONFIG_FLAGS}"
		make -j"${ASDF_CONCURRENCY}"
		make -j"${ASDF_CONCURRENCY}" install

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
