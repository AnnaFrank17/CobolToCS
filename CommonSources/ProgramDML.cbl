       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMDML.

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

           01 i PIC 9(10).

           EXEC SQL END
              DECLARE SECTION
           END-EXEC.

           EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION USING SQLCA.
       DISPLAY 'ProgramDML:'.

               SECT-MAIN.
                 PERFORM DELETE_STUDENTS.

                 PERFORM LOAD_STUDENTS.

                 DISPLAY 'Data output...'.

              DELETE_STUDENTS.
                  EXEC SQL
                     DELETE FROM students
                  END-EXEC.

              INSERT-STUDENT.
                  EXEC SQL
                    INSERT INTO students
                    VALUES(:id-student, :first-name, :last-name,
                       :group_number,
                       :email, :phone-number, :city, :country)
                  END-EXEC.

              UPDATE-GROUP-STUDENT.
                  EXEC SQL
                     UPDATE students
                     SET group_number = :group_number
                     WHERE id = :id-student
                  END-EXEC.

              DELETE_STUDENT.
                  EXEC SQL
                     DELETE FROM students WHERE id = :id-student
                  END-EXEC.

              LOAD_STUDENTS.
                  MOVE 1 TO id-student.
                  MOVE 'Alex' TO first-name.
                  MOVE 'Brown' TO last-name.
                  MOVE 101 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 804528358 TO phone-number.
                  MOVE 'Washington' TO city.
                  MOVE 'United States' TO country.
                  PERFORM INSERT-STUDENT.

                  MOVE 2 TO id-student.
                  MOVE 'Daniel' TO first-name.
                  MOVE 'Thomas' TO last-name.
                  MOVE 102 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 807587524 TO phone-number.
                  MOVE 'New Delphi' TO city.
                  MOVE 'India' TO country.
                  PERFORM INSERT-STUDENT.

                  MOVE 3 TO id-student.
                  MOVE 'Emma' TO first-name.
                  MOVE 'Clark' TO last-name.
                  MOVE 103 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 801084235 TO phone-number.
                  MOVE 'London' TO city.
                  MOVE 'United Kingdom' TO country.
                  PERFORM INSERT-STUDENT.

                  MOVE 4 TO id-student.
                  MOVE 'Michael' TO first-name.
                  MOVE 'Jenkins' TO last-name.
                  MOVE 102 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 801572354 TO phone-number.
                  MOVE 'Paris' TO city.
                  MOVE 'France' TO country.

                  MOVE 5 TO id-student.
                  MOVE 'Mia' TO first-name.
                  MOVE 'Lee' TO last-name.
                  MOVE 101 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 801084235 TO phone-number.
                  MOVE 'Tokyo' TO city.
                  MOVE 'Japan' TO country.
                  PERFORM INSERT-STUDENT.

                  MOVE 6 TO id-student.
                  MOVE 'Olivia' TO first-name.
                  MOVE 'Robinson' TO last-name.
                  MOVE 103 TO group_number.
                  PERFORM GENERATE-EMAIL.
                  MOVE 801223548 TO phone-number.
                  MOVE 'Beijing' TO city.
                  MOVE 'China' TO country.
                  PERFORM INSERT-STUDENT.

              GENERATE-EMAIL.
                MOVE 'asd@.com' TO email.

              DISPLAY-STUDENTS.
               EXEC SQL
                  SELECT id-student, first-name, last-name
                     INTO :id-student, :first-name, :last-name
                     FROM students
               END-EXEC.

               DISPLAY 'id-student = ' id-student.
               DISPLAY 'first-name = ' first-name.
               DISPLAY 'last-name = ' last-name.
               DISPLAY ' '.
               INITIALIZE id-student first-name last-name.

              SECT-END SECTION.
              PARAGR-EXIT.
                 EXIT.
              EXEC SQL COMMIT   WORK RELEASE END-EXEC.

       DISPLAY ' '.

