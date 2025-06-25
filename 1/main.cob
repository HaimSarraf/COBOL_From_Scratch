           IDENTIFICATION DIVISION.
           PROGRAM-ID. Greet.

           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 Employee-Name PIC x(20).
           01 Employee-Age PIC 9(2) VALUE 0.

           PROCEDURE DIVISION.

               PERFORM GET_EMPLOYEE_INFO.
               
               STOP RUN.

           GET_NAME.
               DISPLAY "PLEASE ENTER YOUR NAME(20 CHARACTERS LIMITED):"
               ACCEPT Employee-Name
               DISPLAY "NICE TO MEET YOU " Employee-Name.

           GET_AGE.
               DISPLAY "PLEASE ENTER YOUR AGE : "
               ACCEPT Employee-Age
               DISPLAY "YOU ARE " Employee-Age " YEARS OLD.".

           GET_EMPLOYEE_INFO.
               DISPLAY "WELCOME TO YOUR ACCOUNT"
               PERFORM GET_NAME
               PERFORM GET_AGE.
