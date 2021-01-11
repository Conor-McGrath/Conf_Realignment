
library(stringdist)

greedyAssign1 <- function(df1,df2) {
  d <- expand.grid(df1,df2) # Distance matrix in long form
  names(d) <- c("df1","df2")
  d$dist <- stringdist(d$df1,d$df2, method="lcs") # String edit distance (use your favorite function here)
  
  x <- numeric(length(df1)) # assgn variable: 0 for unassigned but assignable, 
    # 1 for already assigned, -1 for unassigned and unassignable
         while(any(x==0)){
               min_d <- min(d$dist[x==0]) # identify closest pair, arbitrarily selecting 1st if multiple pairs
               a_sel <- df1[d$dist==min_d & x==0][1] 
               b_sel <- df2[d$dist==min_d & df1 == a_sel & x==0][1] 
               x[df1==a_sel & df2 == b_sel] <- 1
               x[x==0 & (df1==a_sel|df2==b_sel)] <- -1
           }
    closest_match <- data.frame(cbind(df1=df1[x==1],df2=df2[x==1],d=d$dist[x==1]))
    closest_match <- closest_match %>% 
      filter(!duplicated(paste0(pmax(df1, df2), pmin(df1, df2))))
}





