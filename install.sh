#!/usr/bin/env bash
set -e
PROJECT_PATH=$(cd `dirname $0`; pwd)
DEIN_PATH=${PROJECT_PATH}/dein
START_UP_SCRIPT=${PROJECT_PATH}/start_up.sh
if [ ! -d ${DEIN_PATH} ]; then
    mkdir -p ${DEIN_PATH}
fi
echo "Installing dein.vim..."
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ${DEIN_PATH} >/dev/null
echo "Install dein success!"

echo "Installing Plugins..."
${START_UP_SCRIPT} --headless +"call dein#install()" +qall
echo "Install Plugins success"

