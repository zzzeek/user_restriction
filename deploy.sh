#!/bin/bash

DIRNAME=`dirname $0`
SCRIPT_HOME=`realpath $DIRNAME`

ANSIBLE_BIN=`command -v ansible-playbook /bin/ansible-playbook /usr/bin/ansible-playbook | head -1`

if [[ ! $ANSIBLE_BIN ]]; then
    echo "can't locate ansible-playbook executable"
    exit -1
fi

set -e
set -x

function install {
	${ANSIBLE_BIN} \
        -vv -i hosts \
    $1 $2 $3 $4 $5 $6 $7 $8 $9 \
        write_apc.yml
}

function revert {
    ${ANSIBLE_BIN} \
        -vv -i hosts \
    $1 $2 $3 $4 $5 $6 $7 $8 $9 \
        revert_apc.yml
}


main() {
	INSTALL_CMDS="install revert"

    CMD="$1"
    shift

    if [[ "${CMD}" == "" ]]; then
        CMD="help"
    fi

    if [[ "${CMD}" == *"help"* ]]; then
        set +x
        echo -e "\nusage: $0 <commands>\n"
        echo -e "\n install - run the install for real"
        echo -e "\n revert - revert the per-controller configurations"
    fi

    if [[ "${CMD}" == *"revert"* ]]; then
        revert $@
    elif [[ "${CMD}" == *"install"* ]]; then
        install $@
    fi


}

main "$@"



