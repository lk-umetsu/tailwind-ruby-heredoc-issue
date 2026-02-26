#!/bin/sh
set -e

docker build -t repro .
rm -f output.css
docker run --rm -v "$PWD:/app" repro bundle exec tailwindcss -i input.css -o output.css
echo "---- compile result ---"
grep -q "\.w-100" output.css && echo "w-100 (heredoc)     : found" || echo "w-100 (heredoc)     : not found"
grep -q "\.w-99"  output.css && echo "w-99 (interpolation): found" || echo "w-99 (interpolation): not found"
grep -q "\.w-98"  output.css && echo "w-98 (plain)        : found" || echo "w-98 (plain)        : not found"
