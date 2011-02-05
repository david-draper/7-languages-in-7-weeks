l1 := list(1,2,3)
l2 := list (4,5,6)
l3 := list(l1,l2)
l4 := list (6,7,"8")

sumList := method(l,
					sum := 0
					l foreach(n, 
							  sum = sum + if (n type == "List",
							  				  sumList(n),
							  				  n)
							 )
				   )
				   
				   
sumList(l3) println

List myAverage := method (
						sum := 0
						self foreach(n, 
							if (n type != "Number", Exception raise("can only average numbers"))
							sum = sum + n
							)
						sum / self size
					)

l2 myAverage println

e := try (
	l4 myAverage println
)
e catch(Exception,
    writeln(e error)
)

