#!/usr/bin/env nextflow

process test {

    """
    docker run --name MPCM1 -v my-vol:/op ebensma/mpcm:first
    """
}



