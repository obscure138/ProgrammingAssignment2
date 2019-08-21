## Used the format from the makeVector function.
## however this one doesn't deal with the mean. instead it
## sets the value of the matrix, gets the value of the matrix
## sets the value of the inverse, gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y){
   x <<- y
   inv <<- NULL
  
}

  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}

## Used the format from the cachemean function.
## it will compute the inverse of the matrix
## if it's already been calculated, it will instead retrieve from cache


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)){
     message("getting cached data")
     return(inv)
}
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv 
}
