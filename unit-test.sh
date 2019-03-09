#!/usr/bin/env bash

set -o errexit
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace
set -o nounset

###############################################################################
# Functions
###############################################################################

# UAT (User Acceptance Testing)
# By Pascal Andy @askpascalandy 2017-10-02_21h04

CTN_NAME="resilio-UAT"
IMG_TO_TEST="devmtl/resilio:2.6.3"

TEST_01="uname -a"
TEST_02="ls -AlhF /"
TEST_03="rslsync --help"


echo; echo "--- Unit Test for image: <$IMG_TO_TEST> - Start ---"; echo;

#1
docker run -it --rm --name $CTN_NAME \
$IMG_TO_TEST \
$TEST_01; echo; sleep 0.1;

#2
docker run -it --rm --name $CTN_NAME \
$IMG_TO_TEST \
$TEST_02; echo; sleep 0.1;

#3
docker run -it --rm --name $CTN_NAME \
$IMG_TO_TEST \
$TEST_03; echo; sleep 0.1;


echo; echo "--- Unit Test for image: <$IMG_TO_TEST> - End ---"; echo;
