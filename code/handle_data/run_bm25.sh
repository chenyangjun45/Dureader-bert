#!/bin/bash
export CUDA_VISIBLE_DEVICES=0

paragraph_extraction ()
{
    SOURCE_DIR=$1
    TARGET_DIR=$2
    echo "Start paragraph extraction, this may take a few hours"
    echo "Source dir: $SOURCE_DIR"
    echo "Target dir: $TARGET_DIR"

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
    cat $SOURCE_DIR/devset/search-no-most-related.dev.json | python paragraph_extraction_bm25.py test \
            > $TARGET_DIR/devset/search-bm25.dev.json
    cat $SOURCE_DIR/devset/zhidao-no-most-related.dev.json | python paragraph_extraction_bm25.py test \
            > $TARGET_DIR/devset/zhidao-bm25.dev.json

    echo "Paragraph extraction done!"
}

paragraph_extraction  ../../data/ ../../data/extracted
