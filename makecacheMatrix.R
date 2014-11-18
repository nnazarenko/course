## R programming Assignment 2
## Utility for caching the inverse of a matrix for performance improvement
## Consists of two functions:
## makeCacheMatrix() is a constructor that creates a function with
## methods for setting and accessing the value and inverse of a matrix
## to facilite caching the inverse of the matrix
##
## cacheSolve() uses the constructed function to access the inverse
## of the matrix if it has already been calculated and cached
##
## Usage example:
## > a <- matrix(c(2,2,3,2), nrow=2, ncol=2)
## > b <- makeCacheMatrix(a)
## > b$get()
## [,1] [,2]
## [1,] 2 3
## [2,] 2 2
## cacheSolve(b)
## [,1] [,2]
## [1,] -1 1.5
## [2,] 1 -1.0
## Constructs a function with four methods to set and get the value
## and inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL ## initialize the inverse to NULL
set <- function(y) { ## allows value of matrix to be set to a new value
x <<- y
inv <<- NULL ## inverse gets reset to NULL if a new matrix value was loaded
}
get <- function() x ## simply returns the value of the matrix
setinverse <- function(inverse) inv <<- inverse ## stores the inverse
getinverse <- function() inv ## returns the inverse
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}
## Takes a matrix created by createCacheMatrix() and returns its inverse,
## retrieving it from cache if it is already cached or calculating and
## caching it if it has not yet been cached
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
inv <- x$getinverse() ## fetch the inverse
if (!is.null(inv)) return(inv) ## if it is cached return it right away
inverse <- solve(x$get()) ## if we get here it wasn't cached so calculate it
x$setinverse(inverse) ## store the inverse in the cache
inverse ## return the freshly calculated inverse
}