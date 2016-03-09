#!/bin/bash

#
# https://github.com/Steven-N-Hart/VariantDB_Challenge/wiki#challenge-1-the-multiple-source-integration-problem

wget https://s3-us-west-2.amazonaws.com/mayo-bic-tools/variant_miner/vcfs/1KG.chr22.anno.infocol.vcf.gz
wget ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/release/20110521/README.sample_cryptic_relations
wget ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/release/20110521/phase1_integrated_calls.20101123.ALL.panel
gunzip 1KG.chr22.anno.infocol.vcf.gz

# no longer necessary, see https://github.com/Steven-N-Hart/VariantDB_Challenge/issues/3
# sed -e 's/,Source="savant",Version="1.1.0"//' -e 's/ /%20/g' -e 's/:\.,\.,\.:/:.:/g' -e 's/:\.,,:/:.:/g' 1KG.chr22.anno.infocol.vcf > 1KG.chr22.anno.infocol.edit.vcf

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
#adam-submit vcf2adam 1KG.chr22.anno.infocol.vcf 1KG.chr22.anno.infocol.adam

# or use docker
docker run -v `pwd`:/data heuermh/adam adam-submit vcf2adam /data/1KG.chr22.anno.infocol.vcf /data/1KG.chr22.anno.infocol.adam
