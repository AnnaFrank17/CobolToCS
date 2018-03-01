       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMFILE.

       ENVIRONMENT DIVISION.
          INPUT-OUTPUT SECTION.
          FILE-CONTROL.
          SELECT STUDENT ASSIGN TO "FILE001"
             ORGANIZATION IS SEQUENTIAL
             ACCESS IS SEQUENTIAL
             FILE STATUS IS FS.

       DATA DIVISION.
          FILE SECTION.
          FD STUDENT.
          01 STUDENT-FILE.
             05 STUDENT-ID PIC 9(5).
             05 NAME1 PIC A(25).
             05 CLASS1 PIC X(3).

          01 FS PIC XX.

          WORKING-STORAGE SECTION.

          01 WS-STUDENT.
             05 WS-STUDENT-ID PIC 9(5).
             05 WS-NAME PIC A(25).
             05 WS-CLASS PIC X(3).

          01 WS-EOF PIC A(1).

       PROCEDURE DIVISION.
       DISPLAY 'ProgramFILE:'.

          OPEN OUTPUT STUDENT.
             MOVE 1 TO STUDENT-ID.
             MOVE '  Tim' TO NAME1.
             MOVE '12' TO CLASS1.
             WRITE STUDENT-FILE
             END-WRITE.
          CLOSE STUDENT.

          OPEN EXTEND STUDENT.
             MOVE 2 TO STUDENT-ID.
             MOVE '  Kate' TO NAME1.
             MOVE '9' TO CLASS1.
             WRITE STUDENT-FILE
             END-WRITE.
          CLOSE STUDENT.

          OPEN INPUT STUDENT.
             PERFORM UNTIL WS-EOF='Y'
                READ STUDENT INTO WS-STUDENT
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END DISPLAY WS-STUDENT
                END-READ
             END-PERFORM.
          CLOSE STUDENT.

       STOP RUN.
