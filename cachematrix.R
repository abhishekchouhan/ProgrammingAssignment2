## Put comments here that give an overall description of what your
## functions do

## Finding inverse of a square invertible matrix is costly computational. 
## Here are the fucntions that cache once generated inverse matrix. 
## Inverse is not computed every, once geenerated it will be returned from teh cache. 

## Write a short comment describing this function
## Function to create number of functions and returned as part of list object. 
## All 4 fucntions and 2 variable are part of environment variable of the fucntion. 
## Input a matrix. 
## Return a list of fuctions. 
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    ## set function
    set <- function(y) {
        x <<- y
        # once new value is set, assign null to already generated inverse
        m <<- NULL
    }
    
    # get function
    get <- function() x
    
    # set inverse value
    setsolve <- function(inverse) m <<- inverse
    
    # get inverse value
    getsolve <- function() m

    # return list of functions
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function
## This fuction get the inverse of the matrix if not found then geneate it and cache it. 
## It already found in cache then return from cache.
## Input List object returned from makeCacheMatrix
## Output INverse Matrix. 
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    
    ## find from cache
    if(!is.null(m)) {
        ## if found return from cache
        message("getting cached inverse")
        return(m)
    }
    
    ## if not found in cache then get the matrix
    data <- x$get()
    
    ## generate inverse 
    m <- solve(data, ...)
    
    ## set the inverse in cachce
    x$setsolve(m)
    
    ## return the newly generated inverse
    m
}
