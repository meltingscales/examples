package main

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

}
