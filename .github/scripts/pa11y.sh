#!/bin/sh

set -u

output=$(npm run pa11y:sitemap 2>&1)
npm_status=$?

printf '%s\n' "$output"

case "$output" in
  *"errno 2"*)
    echo "::error::The site is failing accessibility tests. Please review the comment in the pull request or the pa11y-ci step in the workflow for details."
    exit 1
    ;;
esac

exit "$npm_status"
