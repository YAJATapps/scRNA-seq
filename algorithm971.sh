export JULIA_BIN_PATH=~/.julia/packages/OnlinePCA/isnHZ/bin

rm -Rf out
mkdir out

# CSV → Julia Binary
julia $JULIA_BIN_PATH/csv2bin \
    --csvfile out.csv --binfile out/Data.zst

# Summary statistics extracted from Julia Binary
julia $JULIA_BIN_PATH/sumr \
    --binfile out/Data.zst \
    --outdir out

# PCA
julia $JULIA_BIN_PATH/algorithm971 \
    --input out/Data.zst \
    --rowmeanlist out/Feature_LogCPMEDMeans.csv --colsumlist out/Sample_NoCounts.csv \
    --dim 2 --cper 11629 --niter 2 --scale "log"