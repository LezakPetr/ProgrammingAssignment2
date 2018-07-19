## Implementation of lazy evaluation (e.g. "cache") of the matrix inversion.

## Function makeCacheMatrix creates a "matrix" object, that is actually a list
## of manipulation functions. These functions manipulates data in their parent
## environment - the environment of makeCacheMatrix function.
makeCacheMatrix <- function(x = matrix()) {
  m <- x;   # Matrix to be inverted
  inv <- NULL;   # Inverted matrix
  
  list (
    # Returns matrix to be inverted
    getMatrix = function() {
      return (m);
    },
    # Returns inverted matrix. Does the caching.
    getInverse = function(...) {
      if (is.null(inv)) {
        message ("Calculating inversion");
        inv <<- solve (m, ...);
      }
      
      return (inv);
    }
  )
}

## Function cacheSolve calculates the inversion of the matrix created by function
## makeCacheMatrix. It first checks if the inversion has not been calculated
## and if not it calculates it. Additional parameters are passed to the solve method.
## The function does not handle change of the additional parameters - if the parameters
## are different for the first call of the method calculated matrix is stored. The matrix
## will be returned by next calls of the method even if the additional parameters
## are changed.
cacheSolve <- function(x, ...) {
  return (x$getInverse(...));
}
