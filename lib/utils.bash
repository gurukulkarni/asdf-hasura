#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for hasura-cli.
GH_REPO="https://github.com/hasura/graphql-engine"

fail() {
  echo -e "hasura-cli: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if hasura-cli is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
  # TODO: Adapt this. By default we simply list the tag names from GitHub releases.
  # Change this function if hasura-cli has other means of determining installable versions.
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  # TODO: Adapt the release URL convention for hasura-cli
  url="$GH_REPO/releases/download/v${version}/${filename}"

  echo "* Downloading hasura-cli release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"
  local platform=$(uname | tr '[:upper:]' '[:lower:]')

  if [ "$install_type" != "version" ]; then
    fail "hasura-cli supports release installs only"
  fi

  local release_file="cli-hasura-${platform}-amd64"
  (
    mkdir -p "$install_path"
    download_release "$version" "$release_file"
    mkdir -pv "$install_path/bin"
    mv -v "$release_file" "$install_path/bin/hasura" || fail "Could not find $release_file"
    rm -f "$release_file"

    export HASURA_GRAPHQL_ENABLE_TELEMETRY=false
    local tool_cmd
    tool_cmd=hasura
    (chmod u+x "$install_path/bin/$tool_cmd" && test -x "$install_path/bin/$tool_cmd") || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "hasura-cli $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing hasura-cli $version."
  )
}
