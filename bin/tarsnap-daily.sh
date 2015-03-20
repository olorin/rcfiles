#! /bin/bash

set -e

export PATH="${HOME}/bin:${PATH}"

tarsnap-generations.sh -f ${HOME}/.tarsnap/backup-paths -h 1 -d 3 -w 2 -m 4
touch ${HOME}/.tarsnap/last-backup
