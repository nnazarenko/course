course Rprogramming
======
This is a utility for caching the inverse of a matrix for performance improvement
 Consists of two functions:
 makeCacheMatrix() is a constructor that creates a function with
 methods for setting and accessing the value and inverse of a matrix
 to facilite caching the inverse of the matrix

 cacheSolve() uses the constructed function to access the inverse
 of the matrix if it has already been calculated and cached
 
Usage example:

> m <- matrix(c(1,1,2,12), nrow=2, ncol=2)
> m1 <- makeCacheMatrix(m)
> m1$get()
     [,1] [,2]
[1,]    1    2
[2,]    1   12
> cacheSolve(m1)
     [,1] [,2]
[1,]  1.2 -0.2
[2,] -0.1  0.1
