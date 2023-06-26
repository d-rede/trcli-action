#!/bin/sh -l

echo "args count: $#"
echo "args list: $@"


TRCLI_PARAMS=""

function append_param {
    local param=$1
    local value=$2
    if [ ! -z "$value" ]; then TRCLI_PARAMS="$TRCLI_PARAMS $param $value"; fi
}

TRCLI_PARAMS=$INSTANCE_PARAMS
append_param -h $1
append_param -u $2
append_param -p $3
TRCLI_PARAMS="$TRCLI_PARAMS parse_junit"
append_param -f $4

echo "Result: $TRCLI_PARAMS"

pip install trcli
trcli --help
