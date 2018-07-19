## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- x;
  inv <- NULL;
  
  list (
    getMatrix = function() {
      m
    },
    setInverse = function(inverse) {
      inv <<- inverse;
    },
    getInverse = function() {
      inv
    }
  )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  if (is.null(x$getInverse())) {
    message ("Calculating inversion");
    x$setInverse (solve (x$getMatrix(), ...));
  }
  
  return (x$getInverse());
}
