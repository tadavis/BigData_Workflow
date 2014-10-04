require(ffbase)
require(RPostgreSQL)
require(ETLUtils)
drv = dbDriver("PostgreSQL")

query = "select * from table1_r"
fromPostgres_ff = read.dbi.ffdf(query=query,dbConnect.args=list(drv=drv,
                                              dbname="test_with_r",
                                              host="localhost",
                                              user="TAD",
                                              password="1234"),
                                VERBOSE=TRUE)
#save.ffdf(fromPostgres_ff) 