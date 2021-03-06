#!/bin/bash

paragraph_extraction ()
{
    SOURCE_DIR=$1
    TARGET_DIR=$2
    TSV_FILE_NAME=$3
    echo "Start paragraph extraction, this may take a few hours"
    echo "Source dir: $SOURCE_DIR"
    echo "Target dir: $TARGET_DIR"
    echo "TSV file name: $TSV_FILE_NAME"

#    echo "Processing testset"
#    cat $SOURCE_DIR/testset/search.test.json | python paragraph_extraction.py test \
#            > $TARGET_DIR/testset/search.test.json
#    cat $SOURCE_DIR/testset/zhidao.test.json | python paragraph_extraction.py test \
#            > $TARGET_DIR/testset/zhidao.test.json
#
#    echo "Processing trainset"
#    cat $SOURCE_DIR/trainset/search.train.json | python paragraph_extraction.py train \
#            > $TARGET_DIR/trainset/search.train.json
#    cat $SOURCE_DIR/trainset/zhidao.train.json | python paragraph_extraction.py train \
#            > $TARGET_DIR/trainset/zhidao.train.json
#
    echo "Processing devset"
    cat $SOURCE_DIR/devset/search.dev.json | python paragraph_extraction_qp.py dev $TSV_FILE_NAME \
            > $TARGET_DIR/devset/search-qp.dev.json
    cat $SOURCE_DIR/devset/zhidao.dev.json | python paragraph_extraction_qp.py dev $TSV_FILE_NAME \
            > $TARGET_DIR/devset/zhidao-qp.dev.json

    echo "Paragraph extraction done!"
}


TSV_FILE_NAME=${1:-qpmodel-bert-chinese.tsv}
paragraph_extraction  ../../data/ ../../data/extracted $TSV_FILE_NAME
