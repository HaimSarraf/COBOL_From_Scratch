       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-HANDLER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO "employee.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS sequential
           FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLOYEE-FILE.
       01 EMPLOYEE-RECORD.
           05 EMPLOYEE-NAME PIC A(30).
           05 EMPLOYEE-SALARY PIC 9(6)V99.

       WORKING-STORAGE SECTION.

       01 FILE-STATUS PIC XX.
       01 WS-NAME PIC A(30).
       01 WS-SALARY PIC 9(6)V99.

       PROCEDURE DIVISION.
           OPEN EXTEND EMPLOYEE-FILE
           IF FILE-STATUS = "00" THEN
              DISPLAY "File opened."
           ELSE
               DISPLAY "Failed to open the file."
               STOP RUN
           END-IF.

           DISPLAY "Enter Employee Name Please :"
           ACCEPT WS-NAME
           DISPLAY "Enter Employee Salary Please :"
           ACCEPT WS-SALARY

           MOVE WS-NAME TO EMPLOYEE-NAME
           MOVE WS-SALARY TO EMPLOYEE-SALARY
           WRITE EMPLOYEE-RECORD


           IF FILE-STATUS NOT = "00" AND FILE-STATUS NOT = "10" THEN
               DISPLAY "ERROR WRITING TO FILE"
               DISPLAY "ERROR NO. : " , FILE-STATUS
               CLOSE EMPLOYEE-FILE
               STOP RUN
           END-IF.

           CLOSE EMPLOYEE-FILE
           DISPLAY "NEW EMPLOYEE HAS BEEN ADDED TO FILE."
           

      *    read and verify the file

           DISPLAY "---- ALL FILE CONTENT ----"
           OPEN INPUT EMPLOYEE-FILE
           IF FILE-STATUS = "00" THEN
               PERFORM READ-AND-DISPLAY UNTIL FILE-STATUS NOT = "00"
               CLOSE EMPLOYEE-FILE
           ELSE
               DISPLAY "ERROR READING FROM FILE"
           END-IF.
           STOP RUN.

       READ-AND-DISPLAY.
               READ EMPLOYEE-FILE INTO EMPLOYEE-RECORD
                   AT END
                       MOVE "10" TO FILE-STATUS
                   NOT AT END
                       DISPLAY "Employee Name : " EMPLOYEE-NAME
                       DISPLAY "Employee Salary : " EMPLOYEE-SALARY
                   END-READ.

