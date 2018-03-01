       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMBL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01 var1 PIC XXX.
          01 var2 REDEFINES var1.
             03 var2sub1 PIC X(01).
             03 var2sub2 PIC X(02).
          01 var3 PIC X(03).

          01 var4 PIC 9 VALUE 0.

          01 var5.
             05 var5-occurs OCCURS 2 TIMES.
                10 var5-occurs-txt PIC X(6) VALUE ' TEXT1'.
                10 var5-subocc OCCURS 2 TIMES.
                   15 var5-subocc-txt PIC X(6) VALUE ' TEXT2'.

          01 str PIC X(10).

       LINKAGE SECTION.
          COPY "ProgramBL.cpy".

       PROCEDURE DIVISION USING varlnk.

       SECT000 SECTION.
          DISPLAY 'IN parameter: ' varlnk.

       SECT001 SECTION.
          DISPLAY "REDEFINES SECTION:".

          PAR-REDEF.
             MOVE "123" TO var1.
             DISPLAY "Result var1: " var1.
             DISPLAY "Result var2: " var2.
             DISPLAY "Result var2sub1: " var2sub1.
             DISPLAY "Result var2sub2: " var2sub2.
             MOVE "456" TO var2.
             DISPLAY "Result var1: " var1.
             DISPLAY "Result var2: " var2.
             DISPLAY "Result var2sub1: " var2sub1.
             DISPLAY "Result var2sub2: " var2sub2.
             MOVE "789" TO var3.
             DISPLAY "Result var3: " var3.
             DISPLAY " ".

       SECT002 SECTION.
          DISPLAY "PERFORM VARYING SECTION:".
          PAR-PERF-VAR.
             PERFORM PAR-PERF-VAR-SUB VARYING var4 FROM 1 BY 1
             UNTIL var4 = 5
             GO TO PAR-PERF-VAR-EXIT.

          PAR-PERF-VAR-SUB.
             DISPLAY "output: " var4.

          PAR-PERF-VAR-EXIT.
             EXIT.
             DISPLAY " ".

       SECT003 SECTION.
          DISPLAY "OCCURS SECTION:".
          DISPLAY "Group item var5 : " var5.

          DISPLAY "occurs row1: " var5-occurs(1).
          DISPLAY "occurs row2: " var5-occurs(2).

          DISPLAY "suboccurs row1: " var5-subocc(1,1) var5-subocc(1,2).
          DISPLAY "suboccurs row2: " var5-subocc(2,1) var5-subocc(2,2).

       DISPLAY ' '.



