#!/bin/zsh

set -e

goreleaser check
goreleaser healthcheck

goreleaser build --clean

token="$(op read "op://employee/GitHub Personal Access Token/token")"
export GITHUB_TOKEN="$token"

goreleaser release