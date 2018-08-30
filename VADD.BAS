DECLARE SUB datei ()
DECLARE SUB grafik ()
DECLARE SUB vorlag ()
anfang:
CLEAR
SCREEN 12
CLS
DIM SHARED g%, v%, a$, x!(4, 200), z!(4, 200), y!(4, 200), vo%(4), xp!, yp!, zp!, xg!(2), yg!(2), zg!(2), gd%, ag!, zf!, zfo!, sn$, B$, c$, d$, ma%, a%
v% = 1
FOR i% = 1 TO 4
vo%(i%) = 1
NEXT
g% = 1
ma% = 1
CALL vorlag
COLOR 4
LOCATE 2, 65: PRINT g%
LOCATE 2, 20: PRINT "kartesisch"
LOCATE 7, 12: PRINT v%
LOCATE 13, 16: PRINT vo%(g%)
GOSUB vclear
a$ = "U"
GOTO stelle

begin:
COLOR 4: LOCATE 13, 16: PRINT vo%(g%)
a$ = ""
WHILE a$ = ""
a$ = INKEY$
WEND

stelle:


SELECT CASE UCASE$(a$)

CASE "U"
gd% = gd% + 1
GOSUB grafikwe
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN CALL grafik

CASE "B"
SYSTEM

CASE "D"
CALL datei
IF UCASE$(B$) = "N" THEN GOTO anfang
GOSUB grafikwe
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN CALL grafik
IF UCASE$(B$) = "L" THEN
GOSUB vclear
COLOR 15
LOCATE 9, 6: PRINT x!(g%, v%)
LOCATE 10, 6: PRINT y!(g%, v%)
LOCATE 11, 6: PRINT z!(g%, v%)
COLOR 4
LOCATE 7, 12: PRINT v%
END IF
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN GOSUB distanz

CASE "K"
SELECT CASE ma%
CASE 0
ma% = 1
CASE 1
ma% = 0
END SELECT
GOSUB grafikwe
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN CALL grafik
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN GOSUB distanz

CASE "F"
v% = 1
g% = g% + 1
IF g% = 5 THEN g% = 1
LOCATE 2, 65: COLOR 4: PRINT g%
GOSUB vclear
COLOR 15
LOCATE 9, 6: PRINT x!(g%, v%)
LOCATE 10, 6: PRINT y!(g%, v%)
LOCATE 11, 6: PRINT z!(g%, v%)
COLOR 4
LOCATE 7, 12: PRINT v%
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN GOSUB distanz
LOCATE 13, 16: PRINT vo%(g%)


CASE "T"
GOSUB Mitte
GOSUB grafikwe
IF ABS(x!(g%, 2)) + ABS(y!(g%, 2)) + ABS(z!(g%, 2)) <> 0 THEN CALL grafik
IF ABS(x!(g%, 2)) + ABS(y!(g%, 2)) + ABS(z!(g%, 2)) <> 0 THEN GOSUB distanz


CASE "M"
COLOR 4
IF m% = 1 THEN
LET m% = 2
LOCATE 2, 20: PRINT "polarisch "
COLOR 14: LOCATE 9, 2: PRINT "‡"
LOCATE 10, 2: PRINT "·"
LOCATE 11, 2: PRINT "l"
ELSE
LET m% = 1
LOCATE 2, 20: PRINT "kartesisch"
COLOR 14: LOCATE 9, 2: PRINT "X"
LOCATE 10, 2: PRINT "Y"
LOCATE 11, 2: PRINT "Z"
END IF
CASE "G"
gd% = gd% - 1
GOSUB grafikwe
IF ABS(x!(g%, 2)) + ABS(y!(g%, 2)) + ABS(z!(g%, 2)) <> 0 THEN CALL grafik

CASE "N"
v% = v% + 1
IF ABS(x!(g%, v% - 1)) + ABS(y!(g%, v% - 1)) + ABS(z!(g%, v% - 1)) = 0 AND v% <> 2 THEN v% = 1
IF v% > vo%(g%) THEN vo%(g%) = v%
GOSUB vclear
COLOR 15
LOCATE 9, 6: PRINT x!(g%, v%)
LOCATE 10, 6: PRINT y!(g%, v%)
LOCATE 11, 6: PRINT z!(g%, v%)
COLOR 4
LOCATE 7, 12: PRINT v%
GOSUB distanz
LOCATE 13, 16: PRINT vo%(g%)
IF ABS(x!(g%, v%)) + ABS(y!(g%, v%)) + ABS(z!(g%, v%)) = 0 THEN GOSUB edit

CASE "L"
v% = v% - 1
IF v% = 0 THEN v% = vo%(g%)
GOSUB vclear
COLOR 15
LOCATE 9, 6: PRINT x!(g%, v%)
LOCATE 10, 6: PRINT y!(g%, v%)
LOCATE 11, 6: PRINT z!(g%, v%)
COLOR 4
LOCATE 7, 12: PRINT v%
GOSUB distanz

CASE "E"
GOSUB edit

END SELECT
GOTO begin



vclear:
COLOR 15
LOCATE 9, 6
PRINT " 0            "
LOCATE 10, 6
PRINT " 0            "
LOCATE 11, 6
PRINT " 0            "
RETURN

dreideA:
LINE (3, 470)-(29, 444), 15
LINE (205, 470)-(595, 80), 0, BF
LINE (210, 465)-(309, 366), 15, , 774
LINE (309, 366)-(309, 86), 15, , 774
LINE (309, 366)-(589, 366), 15, , 774
LINE (210, 465)-(210, 185), 15
LINE (210, 465)-(490, 465), 15
LINE (210, 185)-(309, 86), 15
LINE (490, 465)-(589, 366), 15
LINE (589, 366)-(589, 86), 15
LINE (309, 86)-(589, 86), 15

LINE (259, 276)-(539, 276), 8    'X
LINE (259, 278)-(259, 274), 7: LINE (315, 278)-(315, 274), 7
LINE (371, 278)-(371, 274), 7: LINE (427, 278)-(427, 274), 7
LINE (483, 278)-(483, 274), 7: LINE (539, 278)-(539, 274), 7
LINE (399, 416)-(399, 136), 8    'Y
LINE (397, 418)-(401, 414), 7: LINE (397, 362)-(401, 358), 7
LINE (397, 306)-(401, 302), 7: LINE (397, 250)-(401, 246), 7
LINE (397, 194)-(401, 190), 7: LINE (397, 138)-(401, 134), 7
LINE (350, 325)-(449, 226), 8    'Z
LINE (348, 325)-(352, 325), 7: LINE (368, 305)-(372, 305), 7
LINE (388, 285)-(392, 285), 7: LINE (408, 265)-(412, 265), 7
LINE (428, 245)-(432, 245), 7: LINE (448, 225)-(452, 225), 7

GOSUB dreideB
RETURN

dreideB:
LINE (490, 465)-(490, 185), 15
LINE (490, 185)-(210, 185), 15
LINE (490, 185)-(589, 86), 15
RETURN

grafikwe:
LOCATE 28, 16: PRINT " "
CIRCLE (123, 439), 40, 0, , , 2
CIRCLE (123, 439), 40, 0, , , .5
CIRCLE (123, 439), 40, 0, , , 1
COLOR 0
LINE (163, 439)-(180, 439): LINE (135, 406)-(180, 406): LINE (145, 422)-(180, 422)
LOCATE 26, 24: PRINT " ": LOCATE 27, 24: PRINT " ": LOCATE 28, 24: PRINT " "
IF gd% = 7 THEN gd% = 1
IF gd% = 0 THEN gd% = 6
LOCATE 2, 50: COLOR 4: PRINT gd%
SELECT CASE gd%

CASE 1         'X-Y-Z
GOSUB dreideA
LINE (145, 422)-(180, 422), 14
LINE (135, 406)-(180, 406), 14
CIRCLE (123, 439), 40, 15, , , 2
CIRCLE (123, 439), 40, 15, , , .5
LOCATE 28, 5: PRINT "Z";
LOCATE 30, 9: PRINT "X";
LOCATE 26, 1: PRINT "Y";
LOCATE 26, 24: PRINT "·"
LOCATE 27, 24: PRINT "‡"
LOCATE 19, 2: COLOR 14: PRINT "WÅrfels:  "

CASE 2          'Z-Y-X
LINE (163, 439)-(180, 439), 14
LINE (145, 422)-(180, 422), 14
GOSUB dreideA
CIRCLE (123, 439), 40, 15, , , .5
CIRCLE (123, 439), 40, 15, , , 1
LOCATE 28, 5: PRINT "X";
LOCATE 30, 9: PRINT "Z";
LOCATE 26, 1: PRINT "Y";
LOCATE 27, 24: PRINT "‡"
LOCATE 28, 24: PRINT "·"

CASE 3          'X-Z-Y
GOSUB dreideA
LINE (163, 439)-(180, 439), 14
LINE (135, 406)-(180, 406), 14
CIRCLE (123, 439), 40, 15, , , 2
CIRCLE (123, 439), 40, 15, , , 1
LOCATE 28, 5: PRINT "Y";
LOCATE 30, 9: PRINT "X";
LOCATE 26, 1: PRINT "Z";
LOCATE 26, 24: PRINT "·"
LOCATE 28, 24: PRINT "‡"

CASE 4          'X-Y
LINE (163, 439)-(180, 439), 14
CIRCLE (123, 439), 40, 15, , , 1
LINE (3, 470)-(29, 444), 0
LOCATE 28, 5: PRINT " ";
LOCATE 30, 9: PRINT "X";
LOCATE 26, 1: PRINT "Y";
LOCATE 28, 24: PRINT "Î"
LOCATE 19, 2: COLOR 14: PRINT "Quadrates:"
GOSUB graf2d

CASE 5
LINE (163, 439)-(180, 439), 14
CIRCLE (123, 439), 40, 15, , , 1
LINE (3, 470)-(29, 444), 0
LOCATE 28, 5: PRINT " ";
LOCATE 30, 9: PRINT "Z";
LOCATE 26, 1: PRINT "Y";
LOCATE 28, 24: PRINT "‡"
GOSUB graf2d
CASE 6
LINE (163, 439)-(180, 439), 14
CIRCLE (123, 439), 40, 15, , , 1
LINE (3, 470)-(29, 444), 0
LOCATE 28, 5: PRINT " ";
LOCATE 30, 9: PRINT "X";
LOCATE 26, 1: PRINT "Z";
LOCATE 28, 24: PRINT "·"
GOSUB graf2d
END SELECT
RETURN

distanz:                ' P R O B L E M Z O N E
LOCATE 16, 2: PRINT "                   "
COLOR 4
xp! = 0
yp! = 0
zp! = 0
FOR i% = 2 TO v%
xp! = xp! + x!(g%, i%)
yp! = yp! + y!(g%, i%)
zp! = zp! + z!(g%, i%)
NEXT
LOCATE 16, 2: PRINT SQR(xp! ^ 2 + zp! ^ 2 + yp! ^ 2); "LE"
RETURN


graf2d:
LINE (205, 470)-(595, 80), 0, BF
LINE (210, 465)-(590, 85), 15, B
LINE (286, 465)-(286, 85), 8: LINE (362, 465)-(362, 85), 8
LINE (438, 465)-(438, 85), 8: LINE (514, 465)-(514, 85), 8
LINE (210, 161)-(590, 161), 8: LINE (210, 237)-(590, 237), 8
LINE (210, 313)-(590, 313), 8: LINE (210, 389)-(590, 389), 8
RETURN

edit:
GOSUB vclear
COLOR 15
LOCATE 9, 7: INPUT "", d$
x!(g%, v%) = VAL(d$)
LOCATE 10, 7: INPUT "", d$
y!(g%, v%) = VAL(d$)
LOCATE 11, 7: INPUT "", d$
z!(g%, v%) = VAL(d$)
GOSUB distanz
GOSUB grafikwe
IF ABS(x!(1, 2)) + ABS(y!(1, 2)) + ABS(z!(1, 2)) <> 0 THEN CALL grafik
RETURN

Mitte:
COLOR 14
LOCATE 7, 43: PRINT "…ÕÕÕ—µ MITTELPUNKT ∆Õª"
LOCATE 8, 43: PRINT "∫ X:≥                ∫"
LOCATE 9, 43: PRINT "∫ Y:≥                ∫"
LOCATE 10, 43: PRINT "∫ Z:≥                ∫"
LOCATE 11, 43: PRINT "»ÕÕÕœÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº"
COLOR 4
LOCATE 8, 48: PRINT xg(2) + ABS(xg(1) - xg(2)) / 2;
LOCATE 9, 48: PRINT yg(2) + ABS(yg(1) - yg(2)) / 2;
LOCATE 10, 48: PRINT zg(2) + ABS(zg(1) - zg(2)) / 2;
SLEEP
RETURN

SUB datei
COLOR 14
LOCATE 10, 30: PRINT "…ÕÕÕÕÕÕµ DATEI ∆ÕÕÕÕÕÕª"
LOCATE 11, 30: PRINT "∫                     ∫"
LOCATE 12, 30: PRINT "∫ Neu  Sichern  Laden ∫"
LOCATE 13, 30: PRINT "∫                     ∫"
LOCATE 14, 30: PRINT "∫                     ∫"
LOCATE 15, 30: PRINT "∫                     ∫"
LOCATE 16, 30: PRINT "∫                     ∫"
LOCATE 17, 30: PRINT "»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº"
COLOR 4
LOCATE 12, 32: PRINT "N"
LOCATE 12, 37: PRINT "S"
LOCATE 12, 46: PRINT "L"

DO
B$ = INKEY$
LOOP UNTIL B$ <> ""
i% = 0


SELECT CASE UCASE$(B$)
CASE "S"
ass:
COLOR 14: LOCATE 16, 31: PRINT "(keine Dateiendungen)";
COLOR 14: LOCATE 15, 31: PRINT "Name:";
COLOR 15: INPUT "", sn$
IF LEN(sn$) > 8 THEN GOTO ass
OPEN sn$ + ".vas" FOR OUTPUT AS #1
FOR a% = 1 TO 4
IF a% > 1 THEN PRINT #1, "G"
FOR i% = 1 TO vo%(a%)
PRINT #1, x!(a%, i%)
PRINT #1, y!(a%, i%)
PRINT #1, z!(a%, i%)
NEXT i%
NEXT a%
CLOSE #1
LOCATE 2, 3: PRINT "            "
LOCATE 2, 3: PRINT sn$ + ".vas"


CASE "L"
asch:
COLOR 14: LOCATE 16, 31: PRINT "(keine Dateiendungen)";
COLOR 14: LOCATE 15, 31: PRINT "Name:";
COLOR 15: INPUT "", sn$
IF LEN(sn$) > 8 THEN GOTO asch
ERASE x!, y!, z!
OPEN sn$ + ".vas" FOR INPUT AS #1
ERASE vo%
a% = 1

DO UNTIL EOF(1)
vo%(a%) = vo%(a%) + 1
LINE INPUT #1, c$
IF RTRIM$(c$) = "G" THEN
a% = a% + 1
LINE INPUT #1, c$
x!(a%, vo%(a%)) = VAL(RTRIM$(c$))
ELSE
x!(a%, vo%(a%)) = VAL(RTRIM$(c$))
END IF
LINE INPUT #1, c$
y!(a%, vo%(a%)) = VAL(RTRIM$(c$))
LINE INPUT #1, c$
z!(a%, vo%(a%)) = VAL(RTRIM$(c$))
LOOP

CLOSE #1
v% = 1
LOCATE 2, 3: PRINT "            "
LOCATE 2, 3: PRINT sn$ + ".vas "
END SELECT
END SUB

SUB grafik
xg!(1) = x!(1, 1): xg!(2) = x!(1, 1)
yg!(1) = y!(1, 1): yg!(2) = y!(1, 1)
zg!(1) = z!(1, 1): zg!(2) = z!(1, 1)
xp! = 0
yp! = 0
zp! = 0
FOR a% = 1 TO 4
xp! = x!(1, 1)
yp! = y!(1, 1)
zp! = z!(1, 1)
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
yp! = yp! + y!(a%, i%)
zp! = zp! + z!(a%, i%)
IF xp! > xg!(1) THEN xg!(1) = xp!
IF xp! < xg!(2) THEN xg!(2) = xp!
IF yp! > yg!(1) THEN yg!(1) = yp!
IF yp! < yg!(2) THEN yg!(2) = yp!
IF zp! > zg!(1) THEN zg!(1) = zp!
IF zp! < zg!(2) THEN zg!(2) = zp!
NEXT i%
NEXT a%

ag! = ABS(xg!(1) - xg!(2))
IF ABS(yg!(1) - yg!(2)) > ag! THEN ag! = ABS(yg!(1) - yg!(2))
IF ABS(zg!(1) - zg!(2)) > ag! THEN ag! = ABS(zg!(1) - zg!(2))
LOCATE 20, 2: COLOR 4: PRINT ag!; "LE   "
LOCATE 23, 2: PRINT ag! / 5; "LE   "
COLOR 4 '12
xp! = 0: yp! = 0: zp! = 0
f! = ag! / 380


SELECT CASE gd%
CASE 4
FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
yp! = yp! + y!(a%, i%)
yo! = yp! + y!(a%, i% + 1)
xo! = xp! + x!(a%, i% + 1)
LINE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!)-((xo! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (yo! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 2
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%

CASE 5
FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
zp! = zp! + z!(a%, i%)
yp! = yp! + y!(a%, i%)
yo! = yp! + y!(a%, i% + 1)
zo! = zp! + z!(a%, i% + 1)
LINE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!)-((zo! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210, 465 - (yo! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 2
CIRCLE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210, 465 - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%

CASE 6
FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
zp! = zp! + z!(a%, i%)
zo! = zp! + z!(a%, i% + 1)
xo! = xp! + x!(a%, i% + 1)
LINE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!)-((xo! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (zo! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 2
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210, 465 - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%


CASE 1
f! = ag! / 280
FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
yp! = yp! + y!(a%, i%)
zp! = zp! + z!(a%, i%)
zf! = ((zp! - zg(2) + ((ag! - ABS(zg!(1) - zg!(2)))) / 2) / f! / 2 / SQR(2))
zo! = zp! + z!(a%, i% + 1)
zfo! = ((zo! - zg(2) + ((ag! - ABS(zg!(1) - zg!(2)))) / 2) / f! / 2 / SQR(2))
yo! = yp! + y!(a%, i% + 1)
xo! = xp! + x!(a%, i% + 1)
LINE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 + zf!, 465 - zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!)-((xo! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 + zfo!, 465 - zfo! - (yo! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 + zf!, 465 - zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 2
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 + zf!, 465 - zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%

LINE (490, 465)-(490, 185), 15
LINE (490, 185)-(210, 185), 15
LINE (490, 185)-(589, 86), 15



CASE 2                     ' P R O B L E M Z O N E
f! = ag! / 280
FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
yp! = yp! + y!(a%, i%)
zp! = zp! + z!(a%, i%)
yo! = yp! + y!(a%, i% + 1)
xo! = xp! + x!(a%, i% + 1)
zo! = zp! + z!(a%, i% + 1)
zf! = ((xp! - xg(1) - ((ag! - ABS(xg!(1) - xg!(2)))) / 2) / f! / 2 / SQR(2))
zfo! = ((xo! - xg(1) - ((ag! - ABS(xg!(1) - xg!(2)))) / 2) / f! / 2 / SQR(2))
LINE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!)-((zo! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210 - zfo!, 465 + zfo! - (yo! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 2
CIRCLE ((zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (yp! - yg!(2) + (ag! - ABS(yg!(1) - yg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%

LINE (490, 465)-(490, 185), 15
LINE (490, 185)-(210, 185), 15
LINE (490, 185)-(589, 86), 15



CASE 3
f! = ag! / 280

FOR a% = 1 TO 4
FOR i% = 1 TO vo%(a%)
xp! = xp! + x!(a%, i%)
yp! = yp! + y!(a%, i%)
zp! = zp! + z!(a%, i%)
zo! = zp! + z!(a%, i% + 1)
yo! = yp! + y!(a%, i% + 1)
xo! = xp! + x!(a%, i% + 1)


zf! = ((yp! - yg(1) - ((ag! - ABS(yg!(1) - yg!(2)))) / 2) / f! / 2 / SQR(2))
zfo! = ((yo! - yg(1) - ((ag! - ABS(yg!(1) - yg!(2)))) / 2) / f! / 2 / SQR(2))

LINE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!)-((xo! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 - zfo!, 465 + zfo! - (zo! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 10
IF ma% = 1 THEN
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 2
CIRCLE ((xp! - xg!(2) + (ag! - ABS(xg!(1) - xg!(2))) / 2) / f! + 210 - zf!, 465 + zf! - (zp! - zg!(2) + (ag! - ABS(zg!(1) - zg!(2))) / 2) / f!), 3
END IF
NEXT i%
NEXT a%

LINE (490, 465)-(490, 185), 15
LINE (490, 185)-(210, 185), 15
LINE (490, 185)-(589, 86), 15
END SELECT

END SUB

SUB vorlag
COLOR 14
LOCATE 1, 1
PRINT "⁄ƒƒƒ¥Datei:√ƒƒƒø ⁄¥Koordinaten:√ø⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒø"
PRINT "≥              ≥ ≥              ≥≥Darstellung Nr.   ≥≥GefÅge Nr.   ≥"
PRINT "√ƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒ¡ƒ¡ƒƒƒƒƒƒƒ¬ƒƒƒƒƒ¬¡¡ƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒ¬ƒƒ¡¡ƒ¬ƒƒƒƒƒ¬ƒƒƒƒƒ¡¬ƒƒƒƒƒƒƒƒƒƒø"
PRINT "≥N./L. Vektor≥NÑch.GeFÅge≥Modus≥Editieren≥Beenden≥Datei≥Mitte≥Grafik≥MarKierung≥"
PRINT "¿ƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒ¡ƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒŸ"
COLOR 4
LOCATE 4, 2: PRINT "N"
LOCATE 4, 5: PRINT "L"
LOCATE 4, 22: PRINT "F"
LOCATE 4, 27: PRINT "M"
LOCATE 4, 33: PRINT "E"
LOCATE 4, 43: PRINT "B"
LOCATE 4, 51: PRINT "D"
LOCATE 4, 59: PRINT "T"
LOCATE 4, 63: PRINT "G"
LOCATE 4, 73: PRINT "K"
COLOR 15: LOCATE 2, 3: PRINT "Unbenannt"
COLOR 14
LOCATE 6
PRINT "⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø"
PRINT "≥Vektor Nr.     ≥"
PRINT "√ƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒø"
PRINT "≥X: ≥              ≥"
PRINT "≥Y: ≥              ≥"
PRINT "≥Z: ≥              ≥"
PRINT "√ƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ø"
PRINT "≥Vektoren insg.     ≥"
PRINT "¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ"
PRINT " Distanz zu Vektor 1:"
LOCATE 18
PRINT " SeitenlÑnge des"
LOCATE 22
PRINT " Skalierung:"
LINE (200, 75)-(600, 475), , B
LOCATE 24: PRINT " Koordinatenachsen:"
LINE (3, 470)-(58, 470), 15
LINE (3, 470)-(3, 415), 15
LOCATE 26, 24: PRINT "·"
LOCATE 27, 24: PRINT "‰"
LOCATE 28, 24: PRINT "‡"
END SUB

