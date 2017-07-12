## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix returns a list of functions through which inverse of a matrix can be cached

makeCacheMatrix <- function(x = matrix()) {
	inverse <<- NULL
	setMatrix <- function(inputMatrix){
		x  <<-  inputMatrix
		inverse <<- NULL
	}
	getMatrix <- function() x
	setInverse <- function(inv) inverse <<- inv
	getInverse <- function() inverse
	list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
	

}


## cacheSolve matrix computes the inverse of the given matrix if the inverse has not been cached or if the matrix has changed. If the inverse has been calculated it retrives the cached version

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		inverseMat <- x$getInverse()
	if(is.null(inverseMat)){
		mat <- x$getMatrix()
		inverseMat <- solve(mat)
		x$setInverse(inverseMat)
		return(inverseMat)			
	}
	print("Getting Cached Data")
	inverseMat <- x$getInverse()
	return(inverseMat)
}
