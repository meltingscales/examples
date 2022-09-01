package main

import "fmt"

func workerTest(chSignal chan int, chQuit chan struct{}) {

	print("Within workerTest()")
	print(chSignal)
	print(chQuit)

	for {
		select {
		//case v := <-chSignal:
		//	{
		//	}
		}
	}

}

func main() {

	println("hello from main :)")

	x := make(map[string]int)
	x["key"] = 10 //this causes panic due to...idk?
	x["otherKey"] = 20
	x["badKey"] = -1

	delete(x, "badKey")

	fmt.Println(x)

}
