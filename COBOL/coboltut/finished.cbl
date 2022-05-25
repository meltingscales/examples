COBOL TUTORIAL

INSTALL ON WINDOWS : https://www.it-cooking.com/projects/how-to-install-gnucobol-for-cygwin/

COBOL (Common Business Oriented Language) is the most rigidly structured programming language. It focuses on data oriented business applications. And many people think it is pointless to learn, but those people are not aware that over 80% of all financial transactions in the US and the vast majority of US government systems depend on COBOL. 
[SWITCH TO CODE]

COBOL was created to match natural language. The COBOL program is made up of paragraphs, sections, sentences, verbs and other common speaking language terms.

       >>SOURCE FORMAT FREE

The 1st 6 characters are reserved for sequence numbers used for organizing punch cards. The 7th is reserved for an * which denotes a comment. SOURCE FORMAT FREE allows you to avoid this formatting and other such rules.

IDENTIFICATION DIVISION.
PROGRAM-ID. hello.
ENVIRONMENT DIVISION.
DATA DIVISION.
PROCEDURE DIVISION.

There are 4 divisions being identification, environment, data and procedure. 

A program is structured into program, division, section, paragraph, sentence and statements. Programs contain divisions. Divisions have sections and so on.

IDENTIFICATION DIVISION.
PROGRAM-ID. intro.
AUTHOR. Derek Banas .
DATE-WRITTEN. April 20th 2020

The identification division contains information about the program. Like the name that is used to call for this programs code to execute. Also the authors name and date created.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

Environment contains environment info being the computer it is running on, devices available, country specific information.








DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.

Data describes the data and has 4 sections being the file, working-storage, linkage and report. The File section describes data sent or received from storage. Working-storage defines variables in the program. Linkage defines data available to other programs. Report deals with generating reports.

hello.cob

       >>SOURCE FORMAT FREE
*> Compile with
*> cobc -x hello.cob
*> ./hello
IDENTIFICATION DIVISION.
*> Define name used to call for this program
PROGRAM-ID. hello.
AUTHOR. Derek Banas .
DATE-WRITTEN. April 15th 2020
DATA DIVISION.

---------------------------------------------------------------------------------

Data

There are 3 types of data being Numeric, Alphanumeric and Alphabetic. While you can declare a variable has a certain type you can still assign other types to it. The programmer has the responsibility of enforcing types.

3 Types of Data

Literals are constants that are either Alphanumeric (surrounded by quotes) or Numeric (Signed, floats or integers). 

You can define a constant like this 01 PIValue CONSTANT AS 3.14.

Figurative Constants

Figurative constants are named values that can be used to write a value to every character in a variable. MOVE ZEROS TO PayCheck would make all values in PayCheck zero.

ZERO, ZEROES, ZEROS : Assigns zero
SPACE, SPACES : Assigns a space
HIGH-VALUE, HIGH-VALUES : Assigns largest value of defined type
LOW-VALUE, LOW-VALUES : Assigns smallest value of defined type

---------------------------------------------------------------------------------

WORKING-STORAGE SECTION.
*> Can hold a alphanumeric with max length
*> of 30 and starting value You
01 UserName PIC X(30) VALUE "You".

*> Declare a single digit integer between 0-9 
*> with a starting value of 0
*> ZEROS is a constant equal to 0
01 Num1    PIC 9   VALUE ZEROS.
01 Num2    PIC 9   VALUE ZEROS.

*> Double digit int between 0-99 with starting 
*> value of 0
01 Total     PIC 99  VALUE 0.

*> Hierarchal variable
01 SSNum.
       02 SSArea   PIC 999.
       02 SSGroup  PIC 99.
       02 SSSerial PIC 9999.

PROCEDURE DIVISION.
*> Displays the string and doesn't skip to a newline
DISPLAY "What is your name " WITH NO ADVANCING
*> Stores the value entered
ACCEPT UserName
DISPLAY "Hello " UserName

MOVE ZERO TO UserName
DISPLAY UserName

DISPLAY "Enter 2 values to sum "
ACCEPT Num1
ACCEPT Num2
*> Solves the problem and stores it in Total
COMPUTE Total = Num1 + Num2
DISPLAY Num1 " + " Num2 " = " Total
DISPLAY "Enter your social security number "
*> Receive and output part of SSNum
ACCEPT SSNum
DISPLAY "Area " SSArea

*> Ends the program 
STOP RUN.

tutorial2.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial2.
AUTHOR. Derek Banas .
DATE-WRITTEN. April 15th 2020
DATA DIVISION.

WORKING-STORAGE SECTION.
*> Defines an alphanumeric type 10 spaces long
*> with the default value of "Stuff" (System Defined Max Length)
*> The Picture Clause is where we define the 
*> data type and size (COBOL isn't a typed language)
*> X means any type of character on your keyboard
01 SampleData PIC X(10) VALUE "Stuff".

*> Only letters and spaces are allowed
01 JustLetters PIC AAA VALUE "ABC".

*> 4 of numbers from 0 to 9 (31 max values)
01 JustNums PIC 9(4) VALUE 1234.

*> Signed number
01 SignedInt PIC S9(4) VALUE -1234.

*> 4 digit decimal with 2 decimal places
01 PayCheck PIC 9(4)V99 VALUE ZEROS.

*> A Group Item is a collection of values
*> They are structured using level numbers
*> where the highest number is lowest 
*> in the hierarchy (01 - 49)
01 Customer.
       02 Ident    PIC 9(3).
       02 CustName PIC X(20).
       02 DateOfBirth.
           03 MOB  PIC 99.
           03 DOB  PIC 99.
           03 YOB  PIC 9(4).

01 Num1 PIC 9 VALUE 5.
01 Num2 PIC 9 VALUE 4.
01 Num3 PIC 9 VALUE 3.
01 Ans PIC S99V99 VALUE 0.
01 Rem PIC 9V99.

PROCEDURE DIVISION.
*> MOVE is used to assign values
MOVE "More Stuff" TO SampleData
MOVE "123" TO SampleData
*> You can assign numerics to alphanumerics
*> because typing isn't enforced
MOVE 123 TO SampleData
DISPLAY SampleData
DISPLAY PayCheck
*> Entering data this way requires additonal
*> filled spaces
MOVE "123Bob Smith           12211974" TO Customer
DISPLAY CustName 
DISPLAY MOB "/" DOB "/" YOB

*> Figurative Constants
*> Zero in every space
MOVE ZERO TO SampleData
DISPLAY SampleData
*> Space in every space
MOVE SPACE TO SampleData
DISPLAY SampleData
*> Question mark in every space
MOVE HIGH-VALUE TO SampleData
DISPLAY SampleData
*> Space in every space
MOVE LOW-VALUE TO SampleData
DISPLAY SampleData
*> Quote in every space
MOVE QUOTE TO SampleData
DISPLAY SampleData
*> Defined value in every space
MOVE ALL "2" TO SampleData
DISPLAY SampleData

*> Math

*> Add Num1 to Num2 and store in Ans
ADD Num1 TO Num2 GIVING Ans
SUBTRACT Num1 FROM Num2 GIVING Ans
MULTIPLY Num1 BY Num2 GIVING Ans
DIVIDE Num1 INTO Num2 GIVING Ans
*> You can get quotient and remainder separately
DIVIDE Num2 INTO Num1 GIVING Ans REMAINDER Rem
DISPLAY "Remainder " Rem

*> Using more then 2 variables
ADD Num1, Num2 TO Num3 GIVING Ans
ADD Num1, Num2, Num3 GIVING Ans
DISPLAY Ans

*> Can also use COMPUTE
COMPUTE Ans = Num1 + Num2
COMPUTE Ans = Num1 - Num2
COMPUTE Ans = Num1 * Num2
COMPUTE Ans = Num1 / Num2
DISPLAY Ans
*> 5 to the power of 2
COMPUTE Ans = Num1 ** 2
DISPLAY Ans

*> Using parentheses
COMPUTE Ans = (3 + 5) * 5
DISPLAY Ans
COMPUTE Ans = 3 + 5 * 5
DISPLAY Ans

*> You can round output
COMPUTE Ans ROUNDED = 3.0 + 2.005
DISPLAY Ans

STOP RUN.

tutorial3.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial3.
AUTHOR. Derek Banas .
DATE-WRITTEN. April 15th 2020

*> Define a custom data classification
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES.
       CLASS PassingScore IS "A" THRU "C", "D".

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Age PIC 99 VALUE 0.
01 Grade PIC 99 VALUE 0.
01 Score PIC X(1) VALUE "B".

01 CanVoteFlag PIC 9 VALUE 0.
       88 CanVote VALUE 1.
       88 CantVote VALUE 0.

*> Used to demonstrate evaluate
01 TestNumber  PIC X.
       *> Level 88 designates multiple values
       88  IsPrime     VALUE   "1", "3", "5", "7".
       88  IsOdd       VALUE   "1", "3", "5", "7", "9".
       88  IsEven      VALUE   "2", "4", "6", "8".
       88  LessThan5   VALUE   "1" THRU "4".
       88  ANumber     VALUE   "0" THRU "9".

PROCEDURE DIVISION.

*> If Conditional
DISPLAY "Enter Age : " WITH NO ADVANCING
ACCEPT Age
IF Age > 18 THEN
       DISPLAY "You can vote"
ELSE
       DISPLAY "You can't vote"
END-IF

*> Logical and Conditional Operators
*> ELSE IF statements are to be avoided
*> < or LESS THAN
*> > or GREATER THAN
*> = or EQUAL TO
*> NOT EQUAL TO
IF Age LESS THAN 5 THEN
       DISPLAY "Stay Home"
END-IF
IF Age = 5 THEN
       DISPLAY "Go to Kindergarten"
END-IF
*> You can also use OR instead of AND
IF Age > 5 AND Age < 18 THEN
       COMPUTE Grade = Age - 5
       DISPLAY "Go to Grade " Grade
END-IF
*> <= or LESS THAN OR EQUAL TO
IF Age GREATER THAN OR EQUAL TO 18 
       DISPLAY "Go to college"
END-IF

*> You can verify values fit a classification
IF Score IS PassingScore THEN
       DISPLAY "You Passed"
ELSE
       DISPLAY "You Failed"
END-IF

*> There are built in classifications
*> NUMERIC, ALPHABETIC, ALPHABETIC-LOWER
*> ALPHABETIC-UPPER
IF Score IS NOT NUMERIC THEN
       DISPLAY "Not a Number"
END-IF

*> Use set to toggle values to true or false 
IF Age > 18 THEN
       SET CanVote TO true
ELSE 
       SET CantVote TO true
END-IF
DISPLAY "Vote " CanVoteFlag

*> Evaluate performs a certain action based on 
*> which value is assigned to a variable
DISPLAY "Enter Single Number or X to Exit : "
ACCEPT TestNumber
*> Will execute until data that isn't a numeric is entered
*> Used for iteration which I'll cover next
PERFORM UNTIL NOT ANumber
*> Executes different displays based on condition met
*> Only one match can occur
    EVALUATE TRUE
        WHEN IsPrime    DISPLAY "Prime"
        WHEN IsOdd      DISPLAY "Odd"
        WHEN IsEven      DISPLAY "Even"
        WHEN LessThan5  DISPLAY "Less than 5"
        WHEN OTHER DISPLAY "Default Action"
    END-EVALUATE
    ACCEPT TestNumber
END-PERFORM

STOP RUN.

tutorial4.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial4.

PROCEDURE DIVISION.
*> Gravity driven programming falls through the
*> code until a condition or goto redirects it 
*> Open paragraphs are executed through gravity
*> while closed paragraphs are executed by name.
*> Open paragraphs are basically ways to name blocks
*> of code (tags).
*> Data created in a closed paragraph can't be
*> accessed outside of it. They are traditional functions.

*> This demonstrates the flow
SubOne.
       DISPLAY "In Paragraph 1"
       PERFORM SubTwo
       DISPLAY "Returned to Paragraph 1"
       *> Execute code multiple times
       PERFORM 2 TIMES
       DISPLAY "Repeat"
       END-PERFORM
       STOP RUN.

SubThree.
       DISPLAY "In Paragraph 3".
       
SubTwo.
       DISPLAY "In Paragraph 2"
       PERFORM SubThree
       DISPLAY "Returned to Paragraph 2".

Subroutines

You can compile a subroutine separately and then use its code in another program.

GETSUM.cob

COMPILE THIS WITH : cobc -m GETSUM.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. GETSUM.
DATA DIVISION.
*> These variables will be assigned by the calling program
       LINKAGE SECTION.
       01 LNum1    PIC 9.
       01 LNum2    PIC 9.
       01 LSum     PIC 99.
*> Place the variables in the same order in which they are passed
PROCEDURE DIVISION USING LNum1, LNum2, LSum.
*> We can update the value of sum and when this ends it will update in the calling program
       COMPUTE LSum = LNum1 + LNum2.

EXIT PROGRAM.

coboltut45.cob

COMPILE THIS WITH : cobc -x coboltut45.cob
EXECUTE : ./coboltut45

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
DATA DIVISION.
WORKING-STORAGE SECTION.
       01 Num1    PIC 9 VALUE 5.
       01 Num2    PIC 9 VALUE 4.
       01 Sum1     PIC 99.
PROCEDURE DIVISION.
*> Call the subroutine in the other file and display the result
CALL 'GETSUM' USING Num1, Num2, Sum1.
DISPLAY Num1 " + " Num2 " = " Sum1.

STOP RUN.

tutorial5.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial5.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Ind    PIC 9(1)    VALUE 0.

PROCEDURE DIVISION.
WhileLoop.
*> Works like while loop that executes while the index
*> is greater than 5
       PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
       *> Jumps to another paragraph
       GO TO ForLoop.

OutputData.
       DISPLAY Ind.
       ADD 1 TO Ind.

*> Perform varying works like a for loop where Ind starts
*> with a value of 1 defined after FROM and increments by
*> 1 defined after BY until the condition is met
ForLoop.
       PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
       STOP RUN.

OutputData2.
       DISPLAY Ind.

tutorial20.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial10.
*> We can format data as it is entered
*> using edited pictures
DATA DIVISION.
WORKING-STORAGE SECTION.
01 StartNum    PIC 9(8)V99 VALUE 00001123.55.
*> Replace zeroes with space and add decimal
01 NoZero  PIC ZZZZZZZ9.99.
*> No zeroes and commas (Also use *)
01 NoZPlusC   PIC ZZ,ZZZ,ZZ9.99.
*> Convert to dollars (Also use +, -)
01 Dollar  PIC $$,$$$,$$9.99.
01 BDay   PIC 9(8)    VALUE 12211974.
*> Insert / (Also use B)
01 ADate   PIC 99/99/9999.

PROCEDURE DIVISION.
MOVE StartNum TO NoZero
DISPLAY NoZero
MOVE StartNum TO NoZPlusC
DISPLAY NoZPlusC
MOVE StartNum TO Dollar
DISPLAY Dollar
MOVE BDay TO ADate
DISPLAY ADate
STOP RUN.







tutorial21.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial21.
DATA DIVISION.
WORKING-STORAGE SECTION.
*> Most programming languages use floating point
*> calculations which can introduce errors.
*> COBOL uses fixed point decimal arithmetic
*> and allows you to define how you will round.
01 Price PIC 9(4)V99.
01 TaxRate PIC V999 VALUE .075.
01 FullPrice PIC 9(4)V99.

PROCEDURE DIVISION.
DISPLAY "Enter the Price : " WITH NO ADVANCING
ACCEPT Price
COMPUTE FullPrice ROUNDED = Price + (Price * TaxRate)
DISPLAY "Price + Tax : " FullPrice.

STOP RUN.

tutorial22.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial22.
*> COBOL provides many ways to work with strings

DATA DIVISION.
WORKING-STORAGE SECTION.
01 SampStr     PIC X(18) VALUE 'eerie beef sneezed'.
01 NumChars    PIC 99 VALUE 0.
01 NumEs       PIC 99 VALUE 0.
01 FName       PIC X(6) VALUE 'Martin'.
01 MName       PIC X(11) VALUE 'Luther King'.
01 LName       PIC X(4) VALUE 'King'.
01 FLName      PIC X(11).
01 FMLName     PIC X(18).
01 SStr1       PIC X(7) VALUE "The egg".
01 SStr2       PIC X(9) VALUE "is #1 and".
01 Dest        PIC X(33) VALUE "is the big chicken". 
01 Ptr         PIC 9 VALUE 1.
01 SStr3       PIC X(3).
01 SStr4       PIC X(3).

PROCEDURE DIVISION.
*> Takes string SampStr counts all characters and
*> stores the value in NumChars
INSPECT SampStr TALLYING NumChars FOR CHARACTERS.
DISPLAY "Number of Characters : " NumChars.

INSPECT SampStr TALLYING NumEs FOR ALL 'e'.
DISPLAY "Number of e's : " NumEs.
*> Convert to uppercase
DISPLAY FUNCTION UPPER-CASE(SampStr).
*> Convert to lowercase
DISPLAY FUNCTION LOWER-CASE(SampStr).

*> Join 2 strings with a space between them
*> delimited specifies the end of the string
*> being size (the whole string) or spaces
*> (up to the 1st space) or some other character
*> surrounded with quotes like "#" for example
STRING FName DELIMITED BY SIZE
SPACE
LName DELIMITED BY SIZE
INTO FLName.
DISPLAY FLName.

*> Get just the 1st word up to the space
*> delimited by size gets the whole string
*> and join all 3 into a new string
*> If the container isn't big enough for the
*> string it overflows.
STRING FLName DELIMITED BY SPACES
SPACE
MName DELIMITED BY SIZE
SPACE
LName DELIMITED BY SIZE
INTO FMLName
ON OVERFLOW DISPLAY 'Overflowed'.
DISPLAY FMLName.

*> Grab The egg
STRING SStr1 DELIMITED BY SIZE
SPACE
*> Grab is and the space up to #
SStr2 DELIMITED BY "#"
*> Insert the above starting at index 1 as defined
*> by pointer
INTO Dest
WITH POINTER Ptr
ON OVERFLOW DISPLAY 'Overflowed'.
DISPLAY Dest.

*> Replacing is used to replace strings or characters
INSPECT Dest REPLACING ALL 'egg' BY 'dog'.
DISPLAY Dest.

*> Unstring splits a string into multiple strings
*> based on a delimiter
UNSTRING SStr1 DELIMITED BY SPACE
INTO SStr3, SStr4
END-UNSTRING.
DISPLAY SStr4.

STOP RUN.

tutorial6.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial6.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
*> Connect the name of the customer file name in this
*> code to a file. Records on separate lines
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.

DATA DIVISION.
*> File section describes data in files
FILE SECTION.
*> FD (File Description) describes the file layout
FD CustomerFile.
*> Design the customer record
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).

WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName    PIC X(15).
           03 WSLastName     PIC X(15).

PROCEDURE DIVISION.
*> COBOL focuses on working with external files or
*> databases. Here we will work with sequential files
*> which are files you must work with in order. They
*> differ from direct access files in that direct access
*> files have keys associated with data.
*> Field : Individual piece of information (First Name)
*> Record : Collection of fields for an individual object
*> File : Collection of numerous Records 

*> We process a file by loading one record into memory
*> This is called a Record Buffer

*> Open the file and if it doesn't exist create it
*> Add data to all fields, write them to the file
*> and close the file
OPEN OUTPUT CustomerFile.
       MOVE 00001 TO IDNum.
       MOVE 'Doug' TO FirstName.
       MOVE 'Thomas' TO LastName.
       WRITE CustomerData
       END-WRITE.
    CLOSE CustomerFile.
STOP RUN.

tutorial7.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial7.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).

WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName    PIC X(15).
           03 WSLastName     PIC X(15).

PROCEDURE DIVISION.
*> Extend adds new data to the end of the file
OPEN EXTEND CustomerFile.
       DISPLAY "Customer ID " WITH NO ADVANCING
       ACCEPT IDNum.
       DISPLAY "Customer First Name " WITH NO ADVANCING
       ACCEPT FirstName.
       DISPLAY "Customer Last Name " WITH NO ADVANCING
       ACCEPT LastName.
       WRITE CustomerData
       END-WRITE.
    CLOSE CustomerFile.
    *> Enter customers using ascending keys for later example
STOP RUN.

tutorial8.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial8.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).

WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSIDNum    PIC 9(5).
       02 WSCustName.
           03 WSFirstName    PIC X(15).
           03 WSLastName     PIC X(15).
*> NEW : Used to react to end of file
01 WSEOF   PIC A(1).

PROCEDURE DIVISION.
*> Input is used to read from the file
OPEN INPUT CustomerFile.
       PERFORM UNTIL WSEOF='Y'
           READ CustomerFile INTO WSCustomer
               AT END MOVE 'Y' TO WSEOF
               NOT AT END DISPLAY WSCustomer
            END-READ
        END-PERFORM.
    CLOSE CustomerFile.
STOP RUN.

tutorial9.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial9.
*> Here we'll design and print a customer report

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       *> Define the file to save the report to
       SELECT CustomerReport ASSIGN TO "CustReport.rpt"
           ORGANIZATION IS LINE SEQUENTIAL.
       *> The file that provides the data
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
*> Define FD and custom print line
FD CustomerReport.
01 PrintLine PIC X(44).

*> Info on customer data
FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(8).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).
       88 WSEOF   VALUE HIGH-VALUE.

WORKING-STORAGE SECTION.
*> Break the report up into pieces
01 PageHeading.
       02 FILLER PIC X(13) VALUE "Customer List".
01 PageFooting.
       02 FILLER PIC X(15) VALUE SPACE.
       02 FILLER PIC X(7) VALUE "Page : ".
       02 PrnPageNum PIC Z9.
*> Column headings for data
01 Heads PIC X(36) VALUE "IDNum        FirstName      LastName".
*> Customer data to print with spaces defined
01 CustomerDetailLine.
       02 FILLER PIC X VALUE SPACE.
       02 PrnCustID PIC 9(8).
       02 FILLER PIC X(4) VALUE SPACE.
       02 PrnFirstName PIC X(15). 
       02 FILLER PIC XX VALUE SPACE.
       02 PrnLastName PIC X(15).
*> Printed at end of report
01 ReportFooting PIC X(13) VALUE "END OF REPORT".
*> Tracks number of lines used, when to print footer
*> and new heading
01 LineCount PIC 99 VALUE ZERO.
       88 NewPageRequired VALUE 40 THRU 99.
*> Track number of pages
01 PageCount PIC 99 VALUE ZERO.

PROCEDURE DIVISION.
PrintReport.
OPEN INPUT CustomerFile
OPEN OUTPUT CustomerReport
PERFORM PrintPageHeading
*> Read customer file until end
READ CustomerFile
       AT END SET WSEOF TO TRUE
END-READ
PERFORM PrintReportBody UNTIL WSEOF
*> Advancing moves down defined number of lines
WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5 LINES
CLOSE CustomerFile, CustomerReport
STOP RUN.

*> Prints heading and tracks page count
PrintPageHeading.
WRITE PrintLine FROM PageHeading AFTER ADVANCING Page
WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES
MOVE 3 TO LineCount
ADD 1 TO PageCount.

*> Handles creating new page logic and printing customer
*> data
PrintReportBody.
IF NewPageRequired
       MOVE PageCount TO PrnPageNum
       WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
       PERFORM PrintPageHeading
END-IF
*> Move data to be printed to report
MOVE IDNum TO PrnCustID
MOVE FirstName TO PrnFirstName
MOVE LastName TO PrnLastName
WRITE PrintLine FROM CustomerDetailLine AFTER ADVANCING 1 LINE
ADD 1 TO LineCount
READ CustomerFile
       AT END SET WSEOF TO TRUE
END-READ.

tutorial10.cob

       >>SOURCE FORMAT FREE       
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial10.
*> This program has a menu system and allows you to
*> Add, Update, Delete and Display Customer Data
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
*> Select to use a file with keys (Indexed File)
*> We will randomly access data vs. sequential
*> Define the name associated with the key
       SELECT CustomerFile ASSIGN TO "customers.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS IDNum.

DATA DIVISION.
FILE SECTION.
*> Model customer data
FD CustomerFile.
       01 CustomerData.
           02 IDNum PIC 99.
           02 FirstName PIC X(15).
           02 LastName PIC X(15).

WORKING-STORAGE SECTION.
       *> Customer menu choice
       01 Choice PIC 9.
       *> Tracks whether to exit
       01 StayOpen PIC X VALUE 'Y'.
       *> Tracks whether the customer exists
       01 CustExists PIC X.

PROCEDURE DIVISION.
StartPara.
       *> To access data randomly you must use I-O mode
       OPEN I-O CustomerFile.
       *> Continue execution until StayOpen is N which
       *> happens if the user enters a number not 1 thru 4
       PERFORM UNTIL StayOpen='N'
           DISPLAY " "
           DISPLAY "CUSTOMER RECORDS"
           DISPLAY "1 : Add Customer"
           DISPLAY "2 : Delete Customer"
           DISPLAY "3 : Update Customer"
           DISPLAY "4 : Get Customer"
           DISPLAY "0 : Quit"
           DISPLAY ": " WITH NO ADVANCING
           ACCEPT Choice
           *> Execute different paragraphs based on option
           EVALUATE Choice
               WHEN 1 PERFORM AddCust
               WHEN 2 PERFORM DeleteCust
               WHEN 3 PERFORM UpdateCust
               WHEN 4 PERFORM GetCust
               *> When N we jump out of the loop
               WHEN OTHER move 'N' TO StayOpen
           END-EVALUATE
          
       END-PERFORM.
       *> Close the file and stop execution
       CLOSE CustomerFile
       STOP RUN.

AddCust.
       DISPLAY " ".
       DISPLAY "Enter ID : " WITH NO ADVANCING.
       ACCEPT IDNum.
       DISPLAY "Enter First Name : "  WITH NO ADVANCING.
       ACCEPT FirstName.
       DISPLAY "Enter Last Name : " WITH NO ADVANCING.
       ACCEPT LastName.
       DISPLAY " ".
       *> Write customer data or display error if ID taken
       WRITE CustomerData
           INVALID KEY DISPLAY "ID Taken"
       END-WRITE.


DeleteCust.
       DISPLAY " ".
       DISPLAY "Enter Customer ID to Delete : " WITH NO ADVANCING.
       ACCEPT IDNum.
       *> Delete customer based on ID
       DELETE CustomerFile
       INVALID KEY DISPLAY "Key Doesn't Exist"
       END-DELETE.

UpdateCust.
       MOVE 'Y' TO CustExists.
       DISPLAY " ".
       DISPLAY "Enter ID to Update : " WITH NO ADVANCING.
       ACCEPT IDNum.
       *> Read customer or mark N if doesn't exist
       READ CustomerFile
           INVALID KEY MOVE 'N' TO CustExists
       END-READ.
       *> Display error because ID doesn't exist
       IF CustExists='N'
           DISPLAY "Customer Doesn't Exist"
       ELSE
           DISPLAY "Enter the New First Name : " WITH NO ADVANCING
           ACCEPT FirstName
           DISPLAY "Enter the New Last Name : " WITH NO ADVANCING
           ACCEPT LastName
       END-IF.
       *> Update record for matching ID
       REWRITE CustomerData
           INVALID KEY DISPLAY "Customer Not Updated"
       END-REWRITE.


GetCust.
       *> Assume customer exists
       MOVE 'Y' TO CustExists.
       DISPLAY " ".
       DISPLAY "Enter Customer ID to Find : " WITH NO ADVANCING.
       ACCEPT IDNum.
       *> Mark N if customer ID doesn't exist
       READ CustomerFile
           INVALID KEY MOVE 'N' TO CustExists
       END-READ.
       *> Display error
       IF CustExists='N'
           DISPLAY "Customer Doesn't Exist"
       ELSE
           DISPLAY "ID : " IDNum
           DISPLAY "First Name : " FirstName
           DISPLAY "Last Name : " LastName
       END-IF.

tutorial11.cob

       >>SOURCE FORMAT FREE
*> Tables contain multiple data items like arrays
*> Indexes are called subscripts in COBOL and start
*> at subscript 1 instead of 0. You define the 
*> containing data with a record description.
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial11.
DATA DIVISION.

WORKING-STORAGE SECTION.
*> Declare a 1 dimensional table
01 Table1.
       02  Friend  PIC X(15) OCCURS 4 TIMES.

*> Declare a multidimensional table
01 CustTable.
       02 CustName OCCURS 5 TIMES.
           03 FName PIC X(15).
           03 LName PIC X(15).

*> Declare a table with indexes
01 OrderTable.
       02 Product OCCURS 2 TIMES INDEXED BY I.
           03 ProdName PIC X(10).
           03 ProdSize OCCURS 3 TIMES INDEXED BY J.
               04 SizeType PIC A.

PROCEDURE DIVISION.
       *> Fill 1D table with data and output
       MOVE 'Joy' TO Friend(1).
       MOVE 'Willow' TO Friend(2).
       MOVE 'Ivy' TO Friend(3).
       DISPLAY Friend(1).
       DISPLAY Table1.

       *> Fill MD table with data and output
       MOVE 'Paul' TO FName(1).
       MOVE 'Smith' TO LName(1).
       MOVE 'Sally' TO FName(2).
       MOVE 'Smith' TO LName(2).
       DISPLAY CustName(1).
       DISPLAY CustTable.
       
       *> Working with indexed tables
       *> Set index value with SET
       SET I J TO 1.
       MOVE 'Blue Shirt' TO Product(I).
       MOVE 'S' TO ProdSize(I,J).
       *> Increment with SET
       SET J UP BY 1
       MOVE 'M' TO ProdSize(I,J).
       *> Decrement with SET
       SET J DOWN BY 1
       *> Fill with product information
       MOVE 'Blue ShirtSMLRed Shirt SML' TO OrderTable.
       *> Increment I as we get products
       PERFORM GetProduct VARYING I FROM 1 BY 1 UNTIL I>2.
       GO TO LookUp.

GetProduct.
       DISPLAY Product(I).
       *> Get associated product sizes
       PERFORM GetSizes VARYING J FROM 1 BY 1 UNTIL J>3.

GetSizes.
       DISPLAY ProdSize(I,J).
       
LookUp.
       SET I TO 1.
       *> Search will look for supplied value or
       *> output Not Found
       SEARCH Product
           AT END DISPLAY 'Product Not Found'
           WHEN ProdName(I) = 'Red Shirt'
               DISPLAY 'Red Shirt Found'
        END-SEARCH.

STOP RUN.

tutorial12.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial12.
DATA DIVISION.
*> Here I'll show you how to prefill tables 
*> with the redefines clause
WORKING-STORAGE SECTION.
01 ProdTable.
       02 ProdData.
           *> Because we don't need to identify labels
           *> for the data in this string we use filler
           03 FILLER PIC X(8) VALUE "Red  SML".
           03 FILLER PIC X(8) VALUE "Blue SML".
           03 FILLER PIC X(8) VALUE "GreenSML".
       02 FILLER REDEFINES ProdData.
           03 Shirt OCCURS 3 TIMES.
               04 ProdName PIC X(5).
               04 ProdSizes PIC A OCCURS 3 TIMES.
*> If data is stored as a string but you want to use it
*> as a numeric use redefines to do so automatically
01 ChangeMe.
       02 TextNum PIC X(6).
       02 FloatNum REDEFINES TextNum PIC 9(4)V99.

*> Accept a string, convert it into a useable float
*> and an edited number
01 StrNum PIC X(7).
01 SplitNum.
       02 WNum PIC 9(4) VALUE ZERO.
       02 FNum PIC 99 VALUE ZERO.
01 FlNum REDEFINES SplitNum PIC 9999V99.
01 DollarNum PIC $$,$$9.99.

PROCEDURE DIVISION.
DISPLAY Shirt(1).
MOVE '123456' TO TextNum.
DISPLAY FloatNum.

*> Divide the string into 2 strings based on delimiter
*> and then edit the output
DISPLAY "Enter a Float : " WITH NO ADVANCING
ACCEPT StrNum
UNSTRING StrNum 
       DELIMITED BY "." OR ALL SPACES 
       INTO WNum, FNum
MOVE FlNum TO DollarNum
DISPLAY DollarNum

STOP RUN.

tutorial13.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial13.
*> This program sorts a file by ID
*> Sample file Data saved in student.dat
*>5Derek     
*>4Paul      
*>3Sue       
*>2Sally     
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
*> Line Sequential puts data on separate lines
       SELECT WorkFile ASSIGN TO 'work.tmp'.
       SELECT OrgFile ASSIGN TO 'student.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT SortedFile ASSIGN TO 'student2.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
FILE SECTION.
FD OrgFile.
01 StudData.
       02 IDNum    PIC 9.
       02 StudName PIC X(10).
*> SD (Sort File Description) describes layout 
*> for sorted files
SD WorkFile.
01 WStudData.
       02 WIDNum    PIC 9.
       02 WStudName PIC X(10).
FD SortedFile.
01 SStudData.
       02 SIDNum    PIC 9.
       02 SStudName PIC X(10).

PROCEDURE DIVISION.
SORT WorkFile ON ASCENDING KEY SIDNum
       USING OrgFile
       GIVING SortedFile.

STOP RUN.

tutorial14.cob

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial14.
*> This merges files that contain data structured
*> the same
*> Sample file Data saved in student.dat
*>5Derek     
*>4Paul      
*>3Sue       
*>2Sally  
*> Sample data from student3.dat
*>1Sam
*>6Mark   
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
*> Line Sequential puts data on separate lines
       SELECT WorkFile ASSIGN TO 'work.tmp'.
       SELECT File1 ASSIGN TO 'student.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT File2 ASSIGN TO 'student3.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT NewFile ASSIGN TO 'student4.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
FILE SECTION.
FD File1.
01 StudData.
       02 IDNum    PIC 9.
       02 StudName PIC X(10).
FD File2.
01 StudData2.
       02 IDNum2    PIC 9.
       02 StudName2 PIC X(10).
SD WorkFile.
01 WStudData.
       02 WIDNum    PIC 9.
       02 WStudName PIC X(10).
FD NewFile.
01 NStudData.
       02 NIDNum    PIC 9.
       02 NStudName PIC X(10).

PROCEDURE DIVISION.
MERGE WorkFile ON ASCENDING KEY NIDNum
       USING File1, File2
       GIVING NewFile.

STOP RUN.

Object Oriented COBOL

       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. tutorial15.
*> Object Oriented COBOL uses classes to describe
*> data and methods to work with that data

REPOSITORY.
       CLASS ToDoCls AS "todolist".

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WorkToDo USAGE OBJECT REFERENCE ToDoCls.
01 ToDoToAdd   PIC X(20).
       88 EndOfInput   VALUE SPACES.
01 DescToAdd   PIC X(50).

PROCEDURE DIVISION.
INVOKE ToDoCls "new" USING BY CONTENT "Work ToDo"
    RETURNING WorkToDo

PERFORM AddToToDoList WITH TEST AFTER UNTIL EndOfInput
INVOKE WorkToDo "PrintToDos"

STOP RUN.

AddToToDoList.
DISPLAY "Enter To Do : " WITH NO ADVANCING
ACCEPT ToDoToAdd
DISPLAY "Enter Description : " WITH NO ADVANCING
ACCEPT DescToAdd
INVOKE WorkToDo "AddItemToToDo"
    USING BY CONTENT ToDoToAdd, DescToAdd.