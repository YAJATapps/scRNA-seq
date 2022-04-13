# Attempt to convert tsv to csv compatible with scvis by using pandas package

# Source: https://www.geeksforgeeks.org/python-convert-tsv-to-csv-file/
# https://stackoverflow.com/questions/59970956/delete-first-rows-of-csv-file-in-python

import pandas as pd  
import os
  
tsv_file='bipolar_pca100.tsv'
  
# readinag given tsv file
csv_table=pd.read_table(tsv_file,sep='\t')
  
# converting tsv file into csv
csv_table.to_csv('output.csv',index=False)
  
df = pd.read_csv('output.csv', skiprows=1)
df.to_csv('out.csv', index=False)  

# output
print("Successfully made csv file: out.csv")

# delete the intermediate csv file. the final file is named out.csv
if os.path.exists("output.csv"):
	os.remove("output.csv")
