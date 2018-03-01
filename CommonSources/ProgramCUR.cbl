       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMCUR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           EXEC SQL
               BEGIN DECLARE SECTION
           END-EXEC.

           01 students.
              05 id-student PIC 9(5).
              05 first-name PIC X(10).
              05 last-name PIC X(10).
              05 group_number PIC 9(5).
              05 email PIC X(15).
              05 phone-number PIC 9(5).
              05 city PIC X(10).
              05 country PIC X(10).
           01 v-count PIC 9(10).
           01 i PIC 9(10).

           EXEC SQL END
               DECLARE SECTION
           END-EXEC.

           exec sql include sqlca end-exec.

       PROCEDURE DIVISION USING SQLCA.

       DISPLAY 'ProgramCUR:'.

       DECLARE_C1.
           EXEC SQL
               DECLARE C1 CURSOR FOR
               SELECT id, first_name, last_name
               FROM students
           END-EXEC.

       OPEN_C1.
           EXEC SQL
               OPEN C1
           END-EXEC.

       FETCH_C1.
           EXEC SQL
               FETCH C1
               INTO :id-student,
                    :first-name,
                    :last-name
           END-EXEC.

               DISPLAY 'id-student = ' id-student.
               DISPLAY 'first-name = ' first-name.
               DISPLAY 'last-name = ' last-name.
               DISPLAY ' '.
               INITIALIZE id-student first-name last-name.


       CLOSE_C1.
           EXEC SQL
               CLOSE C1
           END-EXEC.

              SECT-END SECTION.
              PARAGR-EXIT.
               EXIT.
               DISPLAY ' '.

