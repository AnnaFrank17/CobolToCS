      *This is the main file for the run of the application
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMDEMO.

       ENVIRONMENT DIVISION.
          INPUT-OUTPUT SECTION.
          FILE-CONTROL.
           SELECT CTL-FILE  ASSIGN TO 'connect.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD  CTL-FILE
           RECORDING MODE IS F
           RECORD CONTAINS 80 CHARACTERS
           BLOCK CONTAINS 0
           LABEL RECORDS ARE OMITTED.
           01  CTL-REC                     PIC X(80).

       WORKING-STORAGE SECTION.

           EXEC SQL
              BEGIN DECLARE SECTION
           END-EXEC.

             01  W-CONNECT-STRING            PIC X(72).

             01  W-LOGON-VARS.
                 05  W-USERID                PIC X(30).
                 05  W-PASS-WORD             PIC X(30).
                 05  W-DBNAME                PIC X(10).

           EXEC SQL END
              DECLARE SECTION
           END-EXEC.

           EXEC SQL INCLUDE SQLCA END-EXEC.

          COPY "ProgramBL.cpy".

       PROCEDURE DIVISION.

       DISPLAY 'Demo conversion from COBOL'.

       BEGIN-MODEL.
       OPEN INPUT  CTL-FILE.
       MOVE SPACES TO W-LOGON-VARS, W-CONNECT-STRING
       READ CTL-FILE INTO W-CONNECT-STRING
        AT END PERFORM ABORT-PROGRAM.

       MOVE SPACES TO W-USERID W-PASS-WORD W-DBNAME
       UNSTRING W-CONNECT-STRING
       DELIMITED BY ALL SPACES OR '/' OR '@'
       INTO W-USERID W-PASS-WORD W-DBNAME

           EXEC SQL
              CONNECT       :W-USERID
              IDENTIFIED BY :W-PASS-WORD
              USING         :W-DBNAME
           END-EXEC.

       IF SQLCODE = 0 THEN
          DISPLAY 'Connected.'
          DISPLAY ' '
          CALL "ProgramDML" USING SQLCA
           EXEC SQL
              CONNECT       :W-USERID
              IDENTIFIED BY :W-PASS-WORD
              USING         :W-DBNAME
           END-EXEC

          CALL "ProgramCUR" USING SQLCA
          MOVE '111 IN PARAM 1111111' TO varlnk
          CALL "ProgramBL" USING varlnk
          CALL "ProgramFILE"
          DISPLAY ' '
          DISPLAY 'Finished.'
       ELSE
          DISPLAY 'Connecting...'
          DISPLAY 'SQLCODE = ' SQLCODE
          DISPLAY 'Program is stopped!'
       END-IF.

       ABORT-PROGRAM.
       DISPLAY 'ABORT PROGRAM'.

       STOP RUN.
