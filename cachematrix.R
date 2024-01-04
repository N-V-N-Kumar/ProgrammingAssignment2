## Put comments here that give an overall description of what your
## functions do
##how to create a special matrix object that can cache its inverse using makeCacheMatrix
##how to use caching when computing the inverse with cacheSolve. 
##The setMatrix function is provided to update the matrix in the cache
##the getMatrix function retrieves the current matrix.
##The getInverse function handles the caching of the inverse matrix.
## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
 # Initialize the inverse matrix cache
  inv <- NULL

  # Function to set the matrix
  setMatrix <- function(newMatrix) {
    x <<- newMatrix
    inv <<- NULL  # Reset the inverse cache when the matrix is updated
  }

  # Function to get the matrix
  getMatrix <- function() x

  # Function to get the cached inverse, or compute and cache it if needed
  getInverse <- function() {
    if (!is.null(inv)) {
      # Return the cached inverse if available
      message("Getting cached inverse")
      return(inv)
    } else {
      # Compute the inverse and cache it
      message("Calculating inverse and caching")
      inv <- solve(x)
      return(inv)
    }
  }

  # Return a list of the functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, getInverse = getInverse)
}


## Write a short comment describing this function
##his function computes the inverse of the special "matrix" returned by makeCacheMatrix
##If the inverse has already been calculated,then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          inv <- cacheMatrix$getInverse()

  # Return the cached inverse
  return(inv)
}
