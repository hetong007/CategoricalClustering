source('cluster.R')

# Load Zoo Data
mat = read.csv('../data/soybean-small.data',header=FALSE)
groundTruth = as.numeric(mat[,ncol(mat)])
mat = mat[,-ncol(mat)]
mat = as.matrix(mat)

# Run Clustering
ans = CategorialCluster(mat)

# Result Analysis
tb = table(ans[[1]],groundTruth)
rename = NULL
for (i in unique(groundTruth))
{
    tmp = order(tb[,i],decreasing=TRUE)
    rename[i] = setdiff(tmp,rename)[1]
}

corr = sum(diag(tb[rename,]))
corr/sum(tb)
