## These function evaluate the inverse of a function and cache the result

## Function that creates an object to cache the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

	m<- NULL
	set<- function(y){
		x<<-y
		m<<-NULL
	}
	get<- function() x
	setinverse<- function(solve) m<<-solve
	getinverse<- function() m
	list(set=set, get=get, setinverse=setinverse,
		getinverse=getinverse)

}


## Function that either returns the inverse from the cache 
## or calculates and caches the inverse 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m<- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data<-x$get()
	m<-solve(data)
	x$setinverse(m)
	m
}
