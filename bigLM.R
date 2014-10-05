# Seems that it's important to use bigglm.ffdf, and not biglm.  Type coercion
# may take place with biglm, in the sense that the ffdf data may be converted to a 
# conventional data frame.  This we don't want.  We want the data handled via chunks.
#
require(biglm)
Sys.time() -> start
model = bigglm.ffdf(Y ~ X1 + X2 + X3, fromPostgres_ff)
#model = biglm(Y ~ X1 + X2 + X3, fromPostgres_ff)
print(Sys.time()-start)
summary(model)