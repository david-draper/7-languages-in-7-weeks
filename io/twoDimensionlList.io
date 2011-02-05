
TwoDimList := Object clone
TwoDimList data := list()

TwoDimList dim := method(x, y,
							for(i, 0, y-1,
							  self data push(list)
							  for(j,0,x-1,
							  	self data at(i) push(0)
							  )
							)
						 )
						 
TwoDimList print := method(
							for(i, 0, self data size - 1,
							  for(j,0,self data at(i) size -1,
							  	self data at(i) at(j) print
							  )
							  "\n" print
							)
							"\n" print

						 )
						 
TwoDimList set := method(x,y,value,
							self data at(x) atPut(y,value)
						 )						 

TwoDimList toFile := method(filename,
								f := File with(filename)
								f openForUpdating
								for(i, 0, self data size - 1,
								  for(j,0,self data at(i) size -1,
									f write(self data at(i) at(j) asSimpleString)
								  )
								  f write("\n")
								)
								f write("\n")
							)

TwoDimList fromFile := method(filename,
								f := File with(filename)
								f openForReading
								for(i, 0, self data size - 1,
								  line := f readLine
								  for(j,0,self data at(i) size -1,
									self data at(i) atPut(j,line at(j) - 48)
								  )
								)
							)

a := TwoDimList	clone							
a dim(3,4)
a print
a set(1,2,7)
a print
a toFile("file.txt")
b := TwoDimList clone
b fromFile("file.txt")
b print