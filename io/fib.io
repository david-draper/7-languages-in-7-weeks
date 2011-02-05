Fib := Object clone
Fib getNthRecursive := method(num,
				if ((num == 1) or (num == 2), 
					1,
					(getNth(num - 1) + getNth(num - 2))
				   )
			   )
			   
Fib getNthIterative := method(num,
						prev := 1
						prevprev := 0
						result := 0
						for(i,0,num-1,
						    prevprev = prev
						    prev = result
						    result = prev + prevprev
						 )
						 result
					)
					
					
Fib getNth := method(num, self getNthIterative(num))
						  
			   
			   
fib := Fib clone

"Fibbing\n" print			

fib getNth(8) println