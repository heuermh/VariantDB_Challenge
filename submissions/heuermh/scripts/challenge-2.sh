#!/bin/bash

#
# https://github.com/Steven-N-Hart/VariantDB_Challenge/wiki#challenge-2-the-continuous-integration-problem

wget https://s3-us-west-2.amazonaws.com/mayo-bic-tools/variant_miner/gvcfs/NA12878.chr22.g.vcf.gz
wget https://s3-us-west-2.amazonaws.com/mayo-bic-tools/variant_miner/gvcfs/NA12891.chr22.g.vcf.gz
wget https://s3-us-west-2.amazonaws.com/mayo-bic-tools/variant_miner/gvcfs/NA12892.chr22.g.vcf.gz
gunzip NA12878.chr22.g.vcf.gz
gunzip NA12891.chr22.g.vcf.gz
gunzip NA12892.chr22.g.vcf.gz

#
# install Apache Spark and ADAM manually
#
# https://spark.apache.org/downloads.html
# https://github.com/bigdatagenomics/adam/releases
#
# or via homebrew
#
# $ brew install adam
#
# note file:/// url is to prevent shell expansion
#
#adam-submit vcf2adam file:///`pwd`/NA*.vcf chr22.g.adam

# or use docker
docker run -v `pwd`:/data heuermh/adam adam-submit vcf2adam file:///data/NA*.vcf /data/chr22.g.adam
