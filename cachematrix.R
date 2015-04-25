## makeCacheMatrix caches the inverse of a matrix once it is calculated via
## cacheSolve. In case the inverse is needed again, cachesolve simply gives 
## the cached result instead of calculating it again.

## Stores a matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
    Inv = NULL
    getInv = function() Inv
    setInv = function(Inverse) Inv <<- Inverse
    set = function(y){
          x <<- y
          Inv <<- NULL
    }
    get = function() x
    
    list(getInv = getInv, setInv = setInv, set = set, get = get)
}


## Returns the inverse of a matrix and stores it in makeCacheMatrix. In case
## the inverse is calculated already it returns cached object.

cacheSolve <- function(x, ...) {
      Inv = x$getInv()
      if(!is.null(Inv)){
            message("Has already been calculated!")
            return(Inv)
      }
      else{
            Inv = solve(x$get())
            x$setInv(Inv)
            return(Inv)
      }
}