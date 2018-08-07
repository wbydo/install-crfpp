#!/bin/bash

set -e
cd `dirname $0`

crf="CRF++-0.58"

curl -L -o $crf.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ"

mkdir -p $crf
cd $crf
mkdir -p src && tar zxvf ../$crf.tar.gz -C src --strip-components 1
rm ../$crf.tar.gz

cd src
./configure --prefix=`cd .. ; pwd`
make
make install

cd ..
rm -r src
