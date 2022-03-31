package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var csvInputPath = "daCSV.csv"
var csvOutputPath = "daCSV.output.csv"

type CSVDatum struct {
	Row1 int64
	Row2 string
	isX  bool
}

func isX(someStr string) bool {
	return (strings.Split(someStr, "")[0]) == "x"
}

func parseCSVDatum(line string) CSVDatum {
	var split = strings.Split(line, ",")

	r1, err := strconv.ParseInt(split[0], 0, 8)

	if err != nil {
		panic("Failed to parse " + line + "!")
	}

	r2 := split[1]

	r3 := isX(split[2])

	return CSVDatum{r1, r2, r3}
}

func serializeCSVDatum(datum CSVDatum) string {
	return fmt.Sprintf("%s,%s,%s", "lol", "i am", "lazy")
}

func main() {

	fmt.Println("wow, you want sum CSV files bro?")

	fmt.Printf("Going to open '%s'...\n", csvInputPath)

	readFile, err := os.Open(csvInputPath)

	if err != nil {
		fmt.Println(err)
	}

	fileScanner := bufio.NewScanner(readFile)

	fileScanner.Split(bufio.ScanLines)

	var csvData []CSVDatum

	//read file into list of our struct
	i := 0
	for fileScanner.Scan() {
		fmt.Printf("line %d: ", i)

		var line = fileScanner.Text()
		fmt.Println(line)

		//skip header line
		if i != 0 {
			csvData = append(csvData, parseCSVDatum(line))
		}
		i += 1
	}

	readFile.Close()

	//print out our list of struct
	for index, element := range csvData {
		fmt.Printf("index = %d\n", index)
		fmt.Printf("element = %s\n", element)
	}

	//write our struct back into a new CSV

}
