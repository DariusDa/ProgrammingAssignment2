## The first function contains three functions that set, get or invert the matrix inserted as 'x'. Moreover, the outcome is commited to cache. 
## The second function either returns an inverse of x already in cache or inverts and returns x

## Function 1 - through makeCacheMatrix one can set, get or invert a given matrix and store in cache.
## The inverse argument being present as NULL in the set and get functions is useful for the CacheSolve funtion. 

makeCacheMatrix <- function(x = matrix()) {
  # set and store the matrix x to be y be calling the set function with the new matrix as an argument
  set<- function(y){
    inverse<<- NULL 
    x<<- y
  }  
  # get the matrix returned and stored
  get<- function(){
    
    inverse<<- NULL
    x<<- x
    return(x)
  }
  
  inv<- function(){
    # invert the original matrix and store it in Cache
    inverse <<- solve(x)
    return(inverse)
  }
  # save a list of functions
  list(set = set, get = get, inv = inv)
  
}


## Function 2 - either returns the inverted function from cache or inverts the function and returns it

cacheSolve <- function(x, ...) {
  # IF structure used given that this is based on the inverse variable being or not NULL
  if (!is.null(inverse)){
    
    message("getting cached data")
    return(inverse)
    
  }
  # if inverse is null it gets x by calling on the previous function and solves it.In the end it returns the inverted function
  else if(is.null(inverse)){
    
    a<- x$get()
    b<- solve(a)
    return(b)
    
  }
}