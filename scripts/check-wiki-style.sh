#!/usr/bin/env sh

# Check wiki content for style violations: non-ASCII characters and curly quotes.
# Usage: sh scripts/check-wiki-style.sh
# Exits 0 if clean, 1 if violations found.
# Portable: uses perl (available on Linux and macOS) instead of GNU grep -P.

FILES="wiki/ AGENTS.md .opencode/skills/ .opencode/command/ README.md GEMINI.md .github/copilot-instructions.md"

found=0

echo "--- Non-ASCII check ---"
nonascii=""
for f in $FILES; do
    if [ -f "$f" ]; then
        out=$(perl -C -ne 'print if /[^\x00-\x7F]/' "$f" 2>/dev/null)
        if [ -n "$out" ]; then
            echo "$f:"
            echo "$out"
            found=1
        fi
    elif [ -d "$f" ]; then
        out=$(find "$f" -name "*.md" -exec perl -C -ne 'print if /[^\x00-\x7F]/' {} + 2>/dev/null)
        if [ -n "$out" ]; then
            echo "$out"
            found=1
        fi
    fi
done
if [ "$found" -eq 0 ]; then
    echo "Clean"
fi

echo ""
echo "--- Curly quotes check ---"
found=0
for f in $FILES; do
    if [ -f "$f" ]; then
        out=$(perl -C -ne 'print if /[\x{2018}\x{2019}\x{201C}\x{201D}]/' "$f" 2>/dev/null)
        if [ -n "$out" ]; then
            echo "$f:"
            echo "$out"
            found=1
        fi
    elif [ -d "$f" ]; then
        out=$(find "$f" -name "*.md" -exec perl -C -ne 'print if /[\x{2018}\x{2019}\x{201C}\x{201D}]/' {} + 2>/dev/null)
        if [ -n "$out" ]; then
            echo "$out"
            found=1
        fi
    fi
done
if [ "$found" -eq 0 ]; then
    echo "Clean"
fi

if [ "$found" -eq 1 ]; then
    echo ""
    echo "Fix: replace with ASCII equivalents (left/right single/double quotes -> ' ' \" \")."
    exit 1
fi

echo ""
echo "All checks passed."
exit 0
