#!/bin/bash

echo "args count: $#"
echo "args list: $@"


TRCLI_PARAMS=""

function append_param {
    local param=$1
    local value=$2
    echo "$param : $value"
    if [ ! -z "$value" ]; then 
        TRCLI_PARAMS="$TRCLI_PARAMS $param $value"; 
    fi
}

function append_param_no_val {
    local param=$1
    local value=$2
    echo "$param : $value"
    if [[ "${value^^}" == "TRUE" ]]; then
        TRCLI_PARAMS="$TRCLI_PARAMS $param"; 
    fi
}

# General parameters
append_param -c $2
append_param -h $3
append_param -u $4
append_param -p $5
append_param --project $6
append_param --project-id $7
append_param_no_val -v $8
append_param_no_val --verify $9
append_param_no_val --insecure ${10}
append_param -b ${11}
append_param -t ${12}
append_param_no_val -y ${13}
append_param_no_val -n ${14}
append_param_no_val -s ${15}

# JUnit parser parameters
TRCLI_PARAMS="$TRCLI_PARAMS parse_junit"
append_param -f ${16}
append_param --title ${17}
append_param_no_val --close-run ${18}
append_param --case-matcher ${19}
append_param --suite-id ${20}
append_param --run-id ${21}
append_param --milestone-id ${22}
append_param --run-description ${23}
append_param --special-parser ${24}
append_param_no_val --allow-ms ${25}
TRCLI_PARSE_JUNIT_EXTRA_PARAMS=${26}

# Install and execute trcli
#pip --disable-pip-version-check install trcli
ALL_TRCLI_PARAMS="$TRCLI_PARAMS $TRCLI_PARSE_JUNIT_EXTRA_PARAMS"
echo $ALL_TRCLI_PARAMS
#trcli --help
#trcli $ALL_TRCLI_PARAMS
