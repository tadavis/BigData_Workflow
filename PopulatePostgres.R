# Revisit this using better practices
require(RpostgreSQL)
drv = dbDriver("PostgreSQL")
con = dbConnect(drv,dbname="test_with_r",host="localhost",user="TAD",password="1234")
for (i in 1:100) {
   print(i)
   w1 = rnorm(100000,1.0,0.2)
   w2 = rnorm(100000,2.0,0.3)
   w3 = rnorm(100000,1.0,0.1)
   z = w1 - 2.0*w2 + 3.0*w3
   a = cbind(w1,w2,w3,z)
   df = as.data.frame(a)
   colnames(df) = c("X1","X2","X3","Y")
   if (i == 1){
      print("writing data frame to PostgreSQL table -- overwriting")
      dbWriteTable(con, "table1_r", value=df,overwrite=TRUE, row.names=FALSE)
   } else {
      print("writing data frame to PostgreSQL table -- appending")
      dbWriteTable(con, "table1_r", value=df,append=TRUE, row.names=FALSE)
   }   
}
dbDisconnect(con)
# comment