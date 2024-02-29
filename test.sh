#!/bin/bash

set -e

. ../scripts/setdevenv.sh

LD_LIBRARY_PATH="/opt/instantclient_19_9:/opt/instantclient_19_9/lib:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH

export PYTEST="python3 -m pytest -vv -p no:sugar --color=no"

# Run C++ tests
make quicktest

(cd autotest && $PYTEST)
