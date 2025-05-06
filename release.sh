#!/bin/zsh

set -e

goreleaser check
goreleaser healthcheck

goreleaser build --clean

token="$(op read "op://employee/gh_mactop_deploy_token/password")"
export GITHUB_TOKEN="$token"

goreleaser release --clean