
function fetchRandomNumbers() {

    function whenItLoads() {
        console.log('response:');
        console.log(this.responseText);

        var jsonResponse = JSON.parse(this.responseText)
        console.log(jsonResponse);

        var theDisplay = document.getElementById('randomNumbersDisplay')

        //clear what we display
        theDisplay.innerHTML = ""

        eltMessage = document.createElement("p")
        eltMessage.innerText = "Message: " + jsonResponse.message

        theDisplay.appendChild(eltMessage)

        //an unordered list 
        eltNumbersList = document.createElement("ul")

        for (const number of jsonResponse.numbers) {
            //a list item, a single number
            eltSingleNumber = document.createElement("li")

            //make the inner text of the <li> the number
            eltSingleNumber.innerText = number

            // append the list item to the list
            eltNumbersList.appendChild(eltSingleNumber)
        }

        theDisplay.appendChild(eltNumbersList) //append the list to the display div

    }

    const req = new XMLHttpRequest();
    req.addEventListener("load", whenItLoads);
    req.open("GET", "http://localhost:3001/randomNumbers");
    req.send();
}


document.onload = function () {

    console.log("loaded :)")
};
