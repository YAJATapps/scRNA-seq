import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cluster import KMeans

dataset= pd.read_csv('test.csv')
X=dataset.iloc[:, [0,1]].values

kmeans = KMeans(n_clusters=26)
kmeans.fit(X)
y_kmeans = kmeans.predict(X)

plt.scatter(X[:, 0], X[:, 1], c=y_kmeans)
plt.show()

