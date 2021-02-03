#!/bin/bash

CUDNN_BRANCH=R7 # for cudnn7
CUDNN_WORK_DIR=.cudnn

install_cudnn()
{
    rm -fr $CUDNN_WORK_DIR
    git clone https://github.com/soumith/cudnn.torch.git -b $CUDNN_BRANCH $CUDNN_WORK_DIR
    cd $CUDNN_WORK_DIR
    /content/torch/install/bin/luarocks make cudnn-scm-1.rockspec
    cd ..
    rm -fr $CUDNN_WORK_DIR
}

/content/torch/install/bin/luarocks install graphicsmagick
/content/torch/install/bin/luarocks install lua-csnappy
/content/torch/install/bin/luarocks install md5
/content/torch/install/bin/luarocks install uuid
/content/torch/install/bin/luarocks install csvigo
/content/torch/install/bin/install_cudnn
PREFIX=$HOME/torch/install /content/torch/install/bin/luarocks install turbo
