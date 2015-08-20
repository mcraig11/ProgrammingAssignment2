## The purpose here is to write a function that creats a special matrix object that can cache its inverse
## write a function that computes the inverse of this special matrix returned by the first function. 
## if the inverse has been calculated (and matrix unchanged) then function 2 should retrieve this 
## inverse from the cache.




#creats a special matrix object that can cache its inverse. 
#the get() returns the matrix, the getinv() returns the inverse
#there are "set" commands which have been commented out. if run, these allow you to set a
#value for the inverse of the matrix using a$setinv(value), where a is the stored value of the makeCachematrix(x)
#if used, get() will return this value regardless of it is actually the true value.

makeCacheMatrix <- function(x = matrix()) {
inv <- solve(x)
#set <- function(y) {
#  x <<- y
  #inv <<- NULL
#}
get <- function() x
#setinv <- function(solve) inv <<- solve
getinv <- function() inv
#list(set = set, get = get, setinv = setinv, getinv = getinv)
list(get = get, getinv = getinv)
}


## this function retrieves the cached inverse matrix from the first function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached matrix")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix, ...)
  #x$setinv(inv)
}
