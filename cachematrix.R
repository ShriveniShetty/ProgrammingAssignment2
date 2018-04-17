## This is the second programming assignment 
## This Function is able to cache inverse of the matrix
## The function takes advantage of the scoping rules of
## the R language to preserve state inside  of an R object.

## 

## `<<-` operator is  used to assign a value to an object in an
## environment that is different from the current environment. 
## Below are two functions that are used to create a
## special object that stores a matrix and caches its inverse.

## The first function, `makeCacheMatrix` creates a special "matrix", which is
## really a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse


makeCacheMatrix <- function(OrigMatrix = matrix()) {
    InvMatrix <- NULL
    set <- function (y) {
        OrigMatrix <<- y
        InvMatrix <<- NULL
    }
    get <- function () OrigMatrix  
    setInvMatrix <- function (newMatrix) InvMatrix <<- newMatrix
    getInvMatrix   <- function () InvMatrix 
    list (set = set, get = get, setInvMatrix = setInvMatrix, getInvMatrix = getInvMatrix)
}


## The following function calculates the Inverse of a Matrix
## It first checks if inverse has already been calculated. if yes, the same is fetched from cache without further calculateion
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache  


cacheSolve <- function(x) {
  InvMatrix <- x$getInvMatrix()
  if(!is.null(InvMatrix)) {
    message("getting cached data")
    return(InvMatrix)
  }
  print ("Original Matrix:")
  print (x$get())
  data <- x$get()
  InvMatrix <- solve(data)
  x$setInvMatrix(InvMatrix)
  print ("Inverse Matrix:")
  InvMatrix
}
