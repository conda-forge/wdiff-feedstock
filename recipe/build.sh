#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

autoreconf --force --verbose --install
./configure --prefix="${PREFIX}"
make
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
make check
fi
make install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
make installcheck
fi
