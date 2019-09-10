#!/bin/bash

DIRNAME=`dirname $0`
SCRIPT_HOME=`realpath $DIRNAME`

ANSIBLE_BIN=`command -v ansible-playbook /bin/ansible-playbook /usr/bin/ansible-playbook | head -1`

set -e
set -x

function dryrun {
	${ANSIBLE_BIN} \
        -vv -i hosts \
    $1 $2 $3 $4 $5 $6 $7 $8 $9 \
        site.yml
}

function install {
	${ANSIBLE_BIN} \
        -vv -i hosts \
        --extra-vars "dryrun=false" \
    $1 $2 $3 $4 $5 $6 $7 $8 $9 \
        site.yml
}


main() {
	INSTALL_CMDS="dryrun install"

    CMDS="$@"

    if [[ "${CMDS}" == "" ]]; then
        CMDS="help"
    fi

    if [[ "${CMDS}" == *"help"* ]]; then
        set +x
        echo -e "\nusage: $0 <commands>\n"
        echo -e "\n dryrun - do a dry run, showing what we're doing but don't change anything"
        echo -e "\n install - run the install for real"
    fi

    if [[ "${CMDS}" == *"dryrun"* ]]; then
        dryrun
    elif [[ "${CMDS}" == *"install"* ]]; then
        install
    fi


}

main "$@"



