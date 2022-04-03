package main

import (
	"bufio"
	"errors"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var csvInputPath = "./daCSV.csv"
var csvOutputPath = "./daCSV.output.csv"

type CSVDatum struct {
	Row1 int64
	Row2 string
	isX  bool
}

func XYtoBool(someStr string) bool {
	return (strings.Split(someStr, "")[0]) == "x"
}

func boolToXY(someBool bool) string {
	if someBool {
		return "x"
	}
	return "y"
}

func parseCSVDatum(line string) CSVDatum {
	var split = strings.Split(line, ",")

	r1, err := strconv.ParseInt(split[0], 0, 8)

	if err != nil {
		panic("Failed to parse " + line + "!")
	}

	r2 := split[1]

	r3 := XYtoBool(split[2])

	return CSVDatum{r1, r2, r3}
}

func serializeCSVDatum(datum CSVDatum) string {
	return fmt.Sprintf(
		"%d,%s,%s",
		datum.Row1, datum.Row2, boolToXY(datum.isX),
	)
}

func getCSVDatumHeader() string {
	return "row1,row2,isXY\n"
}

func writeCSVDataIntoFile(path string, data []CSVDatum) {
	//write our struct back into a new CSV

	file, err := os.Open(path)

	if !(errors.Is(err, os.ErrNotExist)) {
		//if file exists, delete it
		file.Close()
		os.Remove(path)
		println("Deleting " + path + " as it exists.")
	}

	file, err = os.Create(path)

	writer := bufio.NewWriter(file)

	//write header first
	writer.WriteString(getCSVDatumHeader())

	for _, element := range data {
		writer.WriteString(serializeCSVDatum(element))
		writer.WriteString("\n")
	}

	writer.Flush()

	file.Close()
}

func readCSVFileIntoData(path string) []CSVDatum {

	// fmt.Println("wow, you want sum CSV files bro?")

	// fmt.Printf("Going to open '%s'...\n", path)

	readFile, err := os.Open(path)

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

	return csvData
}

func main() {

	var csvData = readCSVFileIntoData(csvInputPath)

	//print out our list of struct
	for index, element := range csvData {
		fmt.Printf("index = %d\n", index)
		fmt.Printf("element = %s\n", element)
	}

	writeCSVDataIntoFile(csvOutputPath, csvData)

	fmt.Println("Wrote to " + csvOutputPath)

}
