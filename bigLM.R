require(biglm)
Sys.time() -> start
model = bigglm.ffdf(Y ~ X1 + X2 + X3, fromPostgres_ff)
#model = biglm(Y ~ X1 + X2 + X3, fromPostgres_ff)
print(Sys.time()-start)
summary(model)