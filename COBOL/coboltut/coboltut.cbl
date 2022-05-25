           >>SOURCE FORMAT FREE
identification division.
program-id. coboltut.
author. Henry Post
date-written.05/24/2022
environment division.

data division.
file section.
working-storage section.
01 username    PIC X(30)   VALUE "HenryFBP".
01 age         PIC 100     VALUE 24.
01 someNum1    PIC 9       VALUE ZEROS.
01 someNum2    PIC 9       VALUE ZEROS.
01 total       PIC 99      VALUE 0.
01 ssn
       02  ssArea      PIC 999.
       02  ssGroup     PIC 99.
       02  ssSerial    PIC 9999.

01 pi          CONSTANT AS 3.14
procedure division.

