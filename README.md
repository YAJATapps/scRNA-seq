# scRNA-seq

Comparison of Deep Learning and PCA analysis for dimensionality reduction of scRNA-seq data

This project will use two algorithms:

- OnlinePCA (for PCA)
- scvis (for Deep learning)


# Setup
Enter julia environment by writing julia into terminal and paste the following commands to set up. After setting up the environment you can use the shell files. algorithm971.sh

```
import Pkg;
Pkg.add("ArgParse")
Pkg.add("Blink")
Pkg.add("PlotlyJS")
Pkg.add("Distributions")
Pkg.add("DataFrames")
]add https://github.com/rikenbit/OnlinePCA.jl
```
