#!/usr/bin/env nextflow

params.stre = 'Hello world!'

process splitLetters {

    output:
    file 'chunk_*' into letters

    """
    printf '${params.stre}' | split -b 6 - chunk_
    """
}


process convertToUpper {

    input:
    file x from letters

    output:
    stdout result

    """
    rev $x
    """
}

result.subscribe {
    println it.trim()
}