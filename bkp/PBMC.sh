# Installation (https://github.com/rikenbit/OnlinePCA.jl)
# push the key "]" and type the following command.
add https://github.com/rikenbit/OnlinePCA.jl
add Blink
add PlotlyJS
add Distributions
add DataFrames
# After that, push Ctrl + C to leave from Pkg REPL mode

# Preprocess of CSV

using OnlinePCA
using OnlinePCA: readcsv, writecsv
using Distributions
using DelimitedFiles

# CSV
tmp = mktempdir()

# Summary of data
# The Data.zst PBMC downloaded from Rikenbit website (https://bioinformatics.riken.jp/onlinepca-data/real/PBMCs_Chromium/Data.zst)
sumr(binfile="/home/yajatapps3/Data.zst", outdir=tmp)


# Setting for the plot

using DataFrames
using PlotlyJS

function subplots(respca, group)
	# data frame
	data_left = DataFrame(pc1=respca[1][:,1], pc2=respca[1][:,2], group=group)
	data_right = DataFrame(pc2=respca[1][:,2], pc3=respca[1][:,3], group=group)
	# plot
	p_left = Plot(data_left, x=:pc1, y=:pc2, mode="markers", marker_size=10, group=:group)
	p_right = Plot(data_right, x=:pc2, y=:pc3, mode="markers", marker_size=10,
	group=:group, showlegend=false)
	p_left.data[1]["marker_color"] = "red"
	p_left.data[2]["marker_color"] = "blue"
	p_left.data[3]["marker_color"] = "green"
	p_right.data[1]["marker_color"] = "red"
	p_right.data[2]["marker_color"] = "blue"
	p_right.data[3]["marker_color"] = "green"
	p_left.data[1]["name"] = "group1"
	p_left.data[2]["name"] = "group2"
	p_left.data[3]["name"] = "group3"
	p_left.layout["title"] = "PC1 vs PC2"
	p_right.layout["title"] = "PC2 vs PC3"
	p_left.layout["xaxis_title"] = "pc1"
	p_left.layout["yaxis_title"] = "pc2"
	p_right.layout["xaxis_title"] = "pc2"
	p_right.layout["yaxis_title"] = "pc3"
	plot([p_left p_right])
end

group=vcat(repeat(["group1"],inner=237), repeat(["group2"],inner=237), repeat(["group3"],inner=239))


# Algorithm971
out_algorithm971 = algorithm971(input="/home/yajatapps3/Data.zst",
           rowmeanlist=joinpath(tmp, "Feature_LogCPMEDMeans.csv"), colsumlist=joinpath(tmp, "Sample_NoCounts.csv"), dim=3, cper=11629, niter=2, scale="log")

subplots(out_algorithm971, group)


