## makeCacheMatrix() and cacheSolve() allow you to calculate the inverse
## of a matrix and cache the result for faster run-time performance.

## makeCacheMatrix()
## Create a data structure containing a matrix and, optionally, its inverse
## and return getters and setters for both.

makeCacheMatrix <- function(x = matrix()) {
        xinverse <- NULL
        set <- function(y) {
                x <<- y
                xinverse <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) xinverse <<- inverse
        getInverse <- function() xinverse
        list(set = set, 
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve()
## Given a matrix, return or compute and cache the inverse of the matrix.

cacheSolve <- function(x) {
        xinverse <- x$getInverse()
        if(!is.null(xinverse)) {
                message("Getting cached data ...")
                return(xinverse)
        }
        matrix <- x$get()
        xinverse <- solve(matrix)
        x$setInverse(xinverse)
        xinverse
}
