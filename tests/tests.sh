#! /bin/sh

try () {
    echo TEST "$@"
    eval "$@"
    echo
}

cd $(dirname $0)

PATH=..:$PATH

{
    try tandem-genotypes --help
    try tandem-genotypes microsat.txt nano.maf
    try tandem-genotypes -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes -v -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes -g refGene.txt rmsk.txt nano.maf
    try tandem-genotypes -g refFlat.txt rmsk.out nano.maf
    try tandem-genotypes -s0 -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes -s1 -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes near-beg.bed near-beg.maf
    try tandem-genotypes small-rep.bed small-rep.maf
    try tandem-genotypes far.bed far.maf
    try tandem-genotypes -u1 -s1 -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes -u3 -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes slop3.bed slop3.maf
    try tandem-genotypes -p900 -g refFlat.txt simpleRepeat.txt nano.maf
    try tandem-genotypes ../hg38-disease-tr.txt far.maf
} 2>&1 |
diff -u $(basename $0 .sh).out -
