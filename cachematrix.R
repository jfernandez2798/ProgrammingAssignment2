## This script is going to be able to return the inverse of a matrix. caching
## potentially time-consuming computations, specially when the matrix doesn't 
##change.


## First we create a function that returns a list of functions, so we can
##1. Set the value of the matrix, 
##2. Get the the value of the matrix, 
##3. Set the value of the inverse of the matrix
##and 4. Get the value of the inverse of the matrix

makeCacheMatrix <- function(x=matrix()){
  
  m<-NULL
  set<-function(y){
    
    x<<-y
    m<<-NULL
  }
  get<-function() x
  
  setinverse<-function(solve)m <<- solve
  
  getinverse<-function() m
  
  list(set = set, get = get, setinverse = setinverse, 
       getinverse = getinverse)
  
}

## Then cacheSolve() is going to use the function above to inverse the matrix
##First, it will check whether the inverse has been already calculated,
##then, it calculates the inverse by using the function solve()

cacheSolve <- function(x, ...){
  
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cache data")
    return(m)
  }
  data<-x$get()
  m<-solve(data, ...)
  x$setinverse(m)
  m
} 
