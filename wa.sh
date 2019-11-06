#!/bin/sh

# wa.sh
#
# Usage: wa.sh
#
# Passes input to clipboard surrounded by Whatsapp's
# monospace macro lines.
#
# wa.sh uses 'cat -' to process input, so standard
# input is read if no input is provided.

if ! type xsel >/dev/null; then
	echo "xsel not found: wa.sh depends on xsel." 1>&2
	exit 1
fi

echo '```' | xsel -bi
cat - | xsel -ba
echo -n '```' | xsel -ba
