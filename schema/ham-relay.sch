EESchema Schematic File Version 2
LIBS:ham-relay-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:LPC1114FN28
LIBS:SWD
LIBS:JTAG
LIBS:VCC2
LIBS:testpoint
LIBS:74xx-eu
LIBS:resistor-bourns
LIBS:7805
LIBS:ham-relay-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Logique relais"
Date "2016-04-09"
Rev "7"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X02 P4
U 1 1 56641792
P 5450 950
F 0 "P4" H 5450 1100 50  0000 C CNN
F 1 "ISP" V 5550 950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5450 950 60  0001 C CNN
F 3 "" H 5450 950 60  0000 C CNN
	1    5450 950 
	1    0    0    1   
$EndComp
$Comp
L CONN_01X03 P5
U 1 1 56641827
P 7450 3650
F 0 "P5" H 7450 3850 50  0000 C CNN
F 1 "CONN_01X03" V 7550 3650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7450 3650 60  0001 C CNN
F 3 "" H 7450 3650 60  0000 C CNN
	1    7450 3650
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 56641987
P 3700 1750
F 0 "C5" H 3725 1850 50  0000 L CNN
F 1 "100nF" H 3725 1650 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 3738 1600 30  0001 C CNN
F 3 "" H 3700 1750 60  0000 C CNN
	1    3700 1750
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 56641B95
P 3700 2700
F 0 "C6" H 3725 2800 50  0000 L CNN
F 1 "100nF" H 3725 2600 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 3738 2550 30  0001 C CNN
F 3 "" H 3700 2700 60  0000 C CNN
	1    3700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1600 3850 1600
Wire Wire Line
	3850 1900 3700 1900
Wire Wire Line
	3500 2550 3850 2550
Wire Wire Line
	3850 2850 3700 2850
$Comp
L GND #PWR01
U 1 1 5664202F
P 5100 700
F 0 "#PWR01" H 5100 450 50  0001 C CNN
F 1 "GND" H 5100 550 50  0000 C CNN
F 2 "" H 5100 700 60  0000 C CNN
F 3 "" H 5100 700 60  0000 C CNN
	1    5100 700 
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 5664205F
P 6750 1300
F 0 "R13" V 6830 1300 50  0000 C CNN
F 1 "10k" V 6750 1300 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6680 1300 30  0001 C CNN
F 3 "" H 6750 1300 30  0000 C CNN
	1    6750 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3550 7250 3550
Wire Wire Line
	6250 3650 7250 3650
Text Label 7100 3550 0    50   ~ 0
RX
Text Label 7100 3650 0    50   ~ 0
TX
$Comp
L GND #PWR02
U 1 1 5664278B
P 7100 3900
F 0 "#PWR02" H 7100 3650 50  0001 C CNN
F 1 "GND" H 7100 3750 50  0000 C CNN
F 2 "" H 7100 3900 60  0000 C CNN
F 3 "" H 7100 3900 60  0000 C CNN
	1    7100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3750 7100 3750
Wire Wire Line
	7100 3750 7100 3900
Text Label 7100 3750 0    50   ~ 0
GND
$Comp
L R R14
U 1 1 56642D60
P 6750 1550
F 0 "R14" V 6830 1550 50  0000 C CNN
F 1 "10k" V 6750 1550 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6680 1550 30  0001 C CNN
F 3 "" H 6750 1550 30  0000 C CNN
	1    6750 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 1950 1050 2100
$Comp
L R R2
U 1 1 5664435B
P 1050 1800
F 0 "R2" V 1130 1800 50  0000 C CNN
F 1 "10k" V 1050 1800 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 980 1800 30  0001 C CNN
F 3 "" H 1050 1800 30  0000 C CNN
	1    1050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2650 6600 2650
Wire Wire Line
	6600 3250 6250 3250
$Comp
L GND #PWR03
U 1 1 56645152
P 3700 1950
F 0 "#PWR03" H 3700 1700 50  0001 C CNN
F 1 "GND" H 3700 1800 50  0000 C CNN
F 2 "" H 3700 1950 60  0000 C CNN
F 3 "" H 3700 1950 60  0000 C CNN
	1    3700 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 566451AB
P 3700 2900
F 0 "#PWR04" H 3700 2650 50  0001 C CNN
F 1 "GND" H 3700 2750 50  0000 C CNN
F 2 "" H 3700 2900 60  0000 C CNN
F 3 "" H 3700 2900 60  0000 C CNN
	1    3700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1900 3700 1950
Wire Wire Line
	3700 2850 3700 2900
Connection ~ 3700 1900
Connection ~ 3700 2850
Wire Wire Line
	3700 1050 3700 1600
Connection ~ 3700 1600
Connection ~ 3700 2550
$Comp
L CONN_01X02 P3
U 1 1 566444D0
P 4750 950
F 0 "P3" H 4750 1100 50  0000 C CNN
F 1 "RESET" V 4850 950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4750 950 60  0001 C CNN
F 3 "" H 4750 950 60  0000 C CNN
	1    4750 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 2550 3500 1600
Text Label 4600 4950 2    50   ~ 0
TONE
$Comp
L GND #PWR05
U 1 1 5664D26D
P 3700 3700
F 0 "#PWR05" H 3700 3450 50  0001 C CNN
F 1 "GND" H 3700 3550 50  0000 C CNN
F 2 "" H 3700 3700 60  0000 C CNN
F 3 "" H 3700 3700 60  0000 C CNN
	1    3700 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3650 3700 3650
Wire Wire Line
	3700 3650 3700 3700
NoConn ~ 3850 3900
Wire Wire Line
	6250 2350 7950 2350
Wire Wire Line
	7650 2000 6250 2000
$Comp
L GND #PWR06
U 1 1 5664FA86
P 3500 5250
F 0 "#PWR06" H 3500 5000 50  0001 C CNN
F 1 "GND" H 3500 5100 50  0000 C CNN
F 2 "" H 3500 5250 60  0000 C CNN
F 3 "" H 3500 5250 60  0000 C CNN
	1    3500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5150 3500 5250
$Comp
L R R9
U 1 1 5664FE28
P 3500 4700
F 0 "R9" V 3580 4700 50  0000 C CNN
F 1 "330" V 3500 4700 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 3430 4700 30  0001 C CNN
F 3 "" H 3500 4700 30  0000 C CNN
	1    3500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4150 3500 4550
Wire Wire Line
	3500 4850 3500 4950
$Comp
L R R8
U 1 1 5665075A
P 3300 4700
F 0 "R8" V 3380 4700 50  0000 C CNN
F 1 "180" V 3300 4700 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 3230 4700 30  0001 C CNN
F 3 "" H 3300 4700 30  0000 C CNN
	1    3300 4700
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 56650760
P 3300 5050
F 0 "D2" H 3300 5150 50  0000 C CNN
F 1 "TONE" H 3300 4950 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 3300 5050 60  0001 C CNN
F 3 "" H 3300 5050 60  0000 C CNN
	1    3300 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 4850 3300 4850
$Comp
L R R11
U 1 1 56651136
P 4200 5450
F 0 "R11" V 4280 5450 50  0000 C CNN
F 1 "2k2" V 4200 5450 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 4130 5450 30  0001 C CNN
F 3 "" H 4200 5450 30  0000 C CNN
	1    4200 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5665113C
P 4200 5700
F 0 "#PWR07" H 4200 5450 50  0001 C CNN
F 1 "GND" H 4200 5550 50  0000 C CNN
F 2 "" H 4200 5700 60  0000 C CNN
F 3 "" H 4200 5700 60  0000 C CNN
	1    4200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5150 4200 5300
Wire Wire Line
	4200 5600 4200 5700
Connection ~ 4200 5150
$Comp
L CONN_01X08 P2
U 1 1 56657C08
P 4400 6850
F 0 "P2" H 4400 7300 50  0000 C CNN
F 1 "CONN_01X08" V 4500 6850 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-8pol" H 4400 6850 60  0001 C CNN
F 3 "" H 4400 6850 60  0000 C CNN
	1    4400 6850
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 56657E59
P 4600 6500
F 0 "#PWR08" H 4600 6250 50  0001 C CNN
F 1 "GND" H 4600 6350 50  0000 C CNN
F 2 "" H 4600 6500 60  0000 C CNN
F 3 "" H 4600 6500 60  0000 C CNN
	1    4600 6500
	-1   0    0    1   
$EndComp
Text Label 5200 6600 2    50   ~ 0
RX_CR
Text Label 5200 6700 2    50   ~ 0
TX_CR
$Comp
L CNY17-1 U5
U 1 1 5665B920
P 8350 5300
F 0 "U5" H 8150 5500 50  0000 L CNN
F 1 "MCA231" H 8350 5500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 8350 5300 50  0001 L CNN
F 3 "" H 8350 5300 50  0000 L CNN
	1    8350 5300
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 5665C0BB
P 8000 5000
F 0 "R16" V 8080 5000 50  0000 C CNN
F 1 "2k7" V 8000 5000 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 7930 5000 30  0001 C CNN
F 3 "" H 8000 5000 30  0000 C CNN
	1    8000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5200 8000 5200
Wire Wire Line
	8000 5200 8000 5150
$Comp
L C C8
U 1 1 5665C653
P 8000 5550
F 0 "C8" H 8025 5650 50  0000 L CNN
F 1 "10nF" H 8025 5450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 8038 5400 30  0001 C CNN
F 3 "" H 8000 5550 60  0000 C CNN
	1    8000 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5665CAF5
P 8000 5700
F 0 "#PWR09" H 8000 5450 50  0001 C CNN
F 1 "GND" H 8000 5550 50  0000 C CNN
F 2 "" H 8000 5700 60  0000 C CNN
F 3 "" H 8000 5700 60  0000 C CNN
	1    8000 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 5400 8050 5400
Connection ~ 8000 5400
Text Label 7250 5400 0    50   ~ 0
RX_CR
$Comp
L GND #PWR010
U 1 1 5665DBB4
P 8650 5450
F 0 "#PWR010" H 8650 5200 50  0001 C CNN
F 1 "GND" H 8650 5300 50  0000 C CNN
F 2 "" H 8650 5450 60  0000 C CNN
F 3 "" H 8650 5450 60  0000 C CNN
	1    8650 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5400 8650 5450
NoConn ~ 8650 5200
Wire Wire Line
	8650 5300 8950 5300
Wire Wire Line
	6250 1900 7400 1900
Text Label 7400 1900 2    50   ~ 0
RXE
Text Label 8950 5300 2    50   ~ 0
RXE
$Comp
L CNY17-1 U7
U 1 1 5666056F
P 10000 5300
F 0 "U7" H 9800 5500 50  0000 L CNN
F 1 "MCA231" H 10000 5500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 10000 5300 50  0001 L CNN
F 3 "" H 10000 5300 50  0000 L CNN
	1    10000 5300
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 56660873
P 9650 5000
F 0 "R19" V 9730 5000 50  0000 C CNN
F 1 "330" V 9650 5000 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 9580 5000 30  0001 C CNN
F 3 "" H 9650 5000 30  0000 C CNN
	1    9650 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5200 9650 5200
Wire Wire Line
	9650 5200 9650 5150
Wire Wire Line
	9650 4600 9650 4850
Text Label 9650 4600 3    50   ~ 0
TXE
Text Label 9350 2100 2    50   ~ 0
TXE
$Comp
L R R17
U 1 1 5666224E
P 9450 5000
F 0 "R17" V 9530 5000 50  0000 C CNN
F 1 "270" V 9450 5000 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 9380 5000 30  0001 C CNN
F 3 "" H 9450 5000 30  0000 C CNN
	1    9450 5000
	1    0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 566623D6
P 9450 5350
F 0 "D5" H 9450 5450 50  0000 C CNN
F 1 "TX" H 9450 5250 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 9450 5350 60  0001 C CNN
F 3 "" H 9450 5350 60  0000 C CNN
	1    9450 5350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR011
U 1 1 566625CE
P 9450 5600
F 0 "#PWR011" H 9450 5350 50  0001 C CNN
F 1 "GND" H 9450 5450 50  0000 C CNN
F 2 "" H 9450 5600 60  0000 C CNN
F 3 "" H 9450 5600 60  0000 C CNN
	1    9450 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5666268D
P 9700 5600
F 0 "#PWR012" H 9700 5350 50  0001 C CNN
F 1 "GND" H 9700 5450 50  0000 C CNN
F 2 "" H 9700 5600 60  0000 C CNN
F 3 "" H 9700 5600 60  0000 C CNN
	1    9700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5400 9700 5600
Wire Wire Line
	9450 4850 9450 4750
Wire Wire Line
	9450 4750 9650 4750
$Comp
L GND #PWR013
U 1 1 56662CAD
P 10300 5600
F 0 "#PWR013" H 10300 5350 50  0001 C CNN
F 1 "GND" H 10300 5450 50  0000 C CNN
F 2 "" H 10300 5600 60  0000 C CNN
F 3 "" H 10300 5600 60  0000 C CNN
	1    10300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5400 10300 5600
NoConn ~ 10300 5200
Wire Wire Line
	10300 5300 10900 5300
$Comp
L C C9
U 1 1 5666330C
P 10500 5450
F 0 "C9" H 10525 5550 50  0000 L CNN
F 1 "10nF" H 10525 5350 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 10538 5300 30  0001 C CNN
F 3 "" H 10500 5450 60  0000 C CNN
	1    10500 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 56663312
P 10500 5600
F 0 "#PWR014" H 10500 5350 50  0001 C CNN
F 1 "GND" H 10500 5450 50  0000 C CNN
F 2 "" H 10500 5600 60  0000 C CNN
F 3 "" H 10500 5600 60  0000 C CNN
	1    10500 5600
	1    0    0    -1  
$EndComp
Connection ~ 10500 5300
Wire Wire Line
	9450 5550 9450 5600
Text Label 10900 5300 2    50   ~ 0
TX_CR
$Comp
L R R15
U 1 1 56664BCF
P 7750 4800
F 0 "R15" V 7830 4800 50  0000 C CNN
F 1 "1k8" V 7750 4800 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 7680 4800 30  0001 C CNN
F 3 "" H 7750 4800 30  0000 C CNN
	1    7750 4800
	0    1    1    0   
$EndComp
$Comp
L LED D4
U 1 1 56664D38
P 7600 5100
F 0 "D4" H 7600 5200 50  0000 C CNN
F 1 "RX" H 7600 5000 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 7600 5100 60  0001 C CNN
F 3 "" H 7600 5100 60  0000 C CNN
	1    7600 5100
	0    -1   -1   0   
$EndComp
Connection ~ 7600 5400
Wire Wire Line
	7600 4800 7600 4900
Wire Wire Line
	7600 5300 7600 5400
NoConn ~ 6250 3850
NoConn ~ 6250 3750
NoConn ~ 6250 3450
NoConn ~ 6250 3350
NoConn ~ 6250 3150
NoConn ~ 6250 1650
$Comp
L +3V3 #PWR015
U 1 1 56670BCC
P 7050 1250
F 0 "#PWR015" H 7050 1100 50  0001 C CNN
F 1 "+3V3" H 7050 1390 50  0000 C CNN
F 2 "" H 7050 1250 60  0000 C CNN
F 3 "" H 7050 1250 60  0000 C CNN
	1    7050 1250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR016
U 1 1 56673F86
P 8000 4750
F 0 "#PWR016" H 8000 4600 50  0001 C CNN
F 1 "VCC" H 8000 4900 50  0000 C CNN
F 2 "" H 8000 4750 60  0000 C CNN
F 3 "" H 8000 4750 60  0000 C CNN
	1    8000 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4750 8000 4850
$Comp
L +3V3 #PWR017
U 1 1 5667879A
P 1050 1500
F 0 "#PWR017" H 1050 1350 50  0001 C CNN
F 1 "+3V3" H 1050 1640 50  0000 C CNN
F 2 "" H 1050 1500 60  0000 C CNN
F 3 "" H 1050 1500 60  0000 C CNN
	1    1050 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1500 1050 1650
$Comp
L +3V3 #PWR018
U 1 1 5667C1C4
P 3700 1050
F 0 "#PWR018" H 3700 900 50  0001 C CNN
F 1 "+3V3" H 3700 1190 50  0000 C CNN
F 2 "" H 3700 1050 60  0000 C CNN
F 3 "" H 3700 1050 60  0000 C CNN
	1    3700 1050
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR019
U 1 1 5667FAD6
P 4600 7200
F 0 "#PWR019" H 4600 7050 50  0001 C CNN
F 1 "+12V" H 4600 7340 50  0000 C CNN
F 2 "" H 4600 7200 60  0000 C CNN
F 3 "" H 4600 7200 60  0000 C CNN
	1    4600 7200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 56686FDD
P 3300 5250
F 0 "#PWR020" H 3300 5000 50  0001 C CNN
F 1 "GND" H 3300 5100 50  0000 C CNN
F 2 "" H 3300 5250 60  0000 C CNN
F 3 "" H 3300 5250 60  0000 C CNN
	1    3300 5250
	1    0    0    -1  
$EndComp
NoConn ~ 6250 2750
Wire Wire Line
	6250 2450 6600 2450
Text Label 6600 2450 2    50   ~ 0
TONE
NoConn ~ 6250 3050
$Comp
L R R18
U 1 1 566E92A6
P 9500 2850
F 0 "R18" V 9580 2850 50  0000 C CNN
F 1 "1k8" V 9500 2850 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 9430 2850 30  0001 C CNN
F 3 "" H 9500 2850 30  0000 C CNN
	1    9500 2850
	0    -1   -1   0   
$EndComp
$Comp
L LED D6
U 1 1 566E92AC
P 9950 2850
F 0 "D6" H 9950 2950 50  0000 C CNN
F 1 "STATUS" H 9950 2750 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 9950 2850 60  0001 C CNN
F 3 "" H 9950 2850 60  0000 C CNN
	1    9950 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	9650 2850 9750 2850
$Comp
L GND #PWR021
U 1 1 566E92B3
P 10150 2850
F 0 "#PWR021" H 10150 2600 50  0001 C CNN
F 1 "GND" H 10150 2700 50  0000 C CNN
F 2 "" H 10150 2850 60  0000 C CNN
F 3 "" H 10150 2850 60  0000 C CNN
	1    10150 2850
	1    0    0    -1  
$EndComp
$Sheet
S 5450 6300 1350 1250
U 5677D530
F0 "Audio" 60
F1 "audio.sch" 60
F2 "AUDIO_IN" I L 5450 6900 50 
F3 "AUDIO_OUT" O L 5450 7100 50 
F4 "TONE" I L 5450 7300 50 
$EndSheet
Text Label 4600 5150 2    50   ~ 0
TONE_OUT
$Comp
L JTAG P1
U 1 1 56783D4B
P 2050 2300
F 0 "P1" H 1700 2950 60  0000 C CNN
F 1 "JTAG" H 1750 1750 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x10" H 2050 2300 60  0001 C CNN
F 3 "" H 2050 2300 60  0000 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  2100 1350 2100
$Comp
L GND #PWR022
U 1 1 56783D52
P 2750 2900
F 0 "#PWR022" H 2750 2650 50  0001 C CNN
F 1 "GND" H 2750 2750 50  0000 C CNN
F 2 "" H 2750 2900 60  0000 C CNN
F 3 "" H 2750 2900 60  0000 C CNN
	1    2750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1900 2750 1900
Wire Wire Line
	2750 1900 2750 2900
Wire Wire Line
	2650 2000 2750 2000
Connection ~ 2750 2000
Wire Wire Line
	2650 2100 2750 2100
Connection ~ 2750 2100
Wire Wire Line
	2650 2200 2750 2200
Connection ~ 2750 2200
Wire Wire Line
	2650 2300 2750 2300
Connection ~ 2750 2300
Wire Wire Line
	2650 2400 2750 2400
Connection ~ 2750 2400
Wire Wire Line
	2650 2500 2750 2500
Connection ~ 2750 2500
Wire Wire Line
	2650 2600 2750 2600
Connection ~ 2750 2600
Wire Wire Line
	2650 2700 2750 2700
Connection ~ 2750 2700
Wire Wire Line
	650  2200 1350 2200
Wire Wire Line
	650  2400 1350 2400
$Comp
L R R3
U 1 1 56783D75
P 1050 3150
F 0 "R3" V 1130 3150 50  0000 C CNN
F 1 "10k" V 1050 3150 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 980 3150 30  0001 C CNN
F 3 "" H 1050 3150 30  0000 C CNN
	1    1050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3300 1050 3400
Wire Wire Line
	1350 2300 1050 2300
$Comp
L R R1
U 1 1 56783D7D
P 850 3150
F 0 "R1" V 930 3150 50  0000 C CNN
F 1 "10k" V 850 3150 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 780 3150 30  0001 C CNN
F 3 "" H 850 3150 30  0000 C CNN
	1    850  3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3300 850  3400
$Comp
L R R4
U 1 1 56783D84
P 1250 3150
F 0 "R4" V 1330 3150 50  0000 C CNN
F 1 "10k" V 1250 3150 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 1180 3150 30  0001 C CNN
F 3 "" H 1250 3150 30  0000 C CNN
	1    1250 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 56783D8A
P 1250 3400
F 0 "#PWR023" H 1250 3150 50  0001 C CNN
F 1 "GND" H 1250 3250 50  0000 C CNN
F 2 "" H 1250 3400 60  0000 C CNN
F 3 "" H 1250 3400 60  0000 C CNN
	1    1250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3400 1250 3300
Wire Wire Line
	1350 2600 1250 2600
Wire Wire Line
	1250 2600 1250 3000
Wire Wire Line
	1050 2300 1050 3000
Wire Wire Line
	850  3000 850  2200
Connection ~ 850  2200
NoConn ~ 1350 2500
NoConn ~ 1350 2700
NoConn ~ 1350 2000
NoConn ~ 1350 1900
$Comp
L +3V3 #PWR024
U 1 1 56783D9A
P 1350 1500
F 0 "#PWR024" H 1350 1350 50  0001 C CNN
F 1 "+3V3" H 1350 1640 50  0000 C CNN
F 2 "" H 1350 1500 60  0000 C CNN
F 3 "" H 1350 1500 60  0000 C CNN
	1    1350 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 56783DA0
P 1050 3400
F 0 "#PWR025" H 1050 3150 50  0001 C CNN
F 1 "GND" H 1050 3250 50  0000 C CNN
F 2 "" H 1050 3400 60  0000 C CNN
F 3 "" H 1050 3400 60  0000 C CNN
	1    1050 3400
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR026
U 1 1 56783DA6
P 2750 1500
F 0 "#PWR026" H 2750 1350 50  0001 C CNN
F 1 "+3V3" H 2750 1640 50  0000 C CNN
F 2 "" H 2750 1500 60  0000 C CNN
F 3 "" H 2750 1500 60  0000 C CNN
	1    2750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1500 1350 1800
$Comp
L GND #PWR027
U 1 1 56783DAD
P 850 3400
F 0 "#PWR027" H 850 3150 50  0001 C CNN
F 1 "GND" H 850 3250 50  0000 C CNN
F 2 "" H 850 3400 60  0000 C CNN
F 3 "" H 850 3400 60  0000 C CNN
	1    850  3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1800 2750 1800
Wire Wire Line
	2750 1800 2750 1500
Text Label 650  2200 0    50   ~ 0
SWCLK
Text Label 6600 2650 2    50   ~ 0
SWCLK
Text Label 650  2100 0    50   ~ 0
SWDIO
Text Label 650  2400 0    50   ~ 0
SWO
Wire Wire Line
	6600 2550 6250 2550
Text Label 6600 2550 2    50   ~ 0
SWO
Connection ~ 1050 2100
Text Label 6600 3250 2    50   ~ 0
SWDIO
$Comp
L LPC1114FN28/102 U3
U 1 1 56640608
P 5050 2700
F 0 "U3" H 5575 4100 60  0000 C CNN
F 1 "LPC1114FN28/102" H 5550 1300 60  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm" H 5050 2700 60  0001 C CNN
F 3 "" H 5050 2700 60  0000 C CNN
	1    5050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1300 6250 1450
Wire Wire Line
	4950 1300 6600 1300
Wire Wire Line
	4950 1300 4950 1000
Wire Wire Line
	6300 1250 5250 1250
Wire Wire Line
	5250 1250 5250 1000
Wire Wire Line
	4950 900  4950 750 
Wire Wire Line
	4950 750  5250 750 
Wire Wire Line
	5250 750  5250 900 
Wire Wire Line
	5100 700  5100 750 
Connection ~ 5100 750 
Wire Wire Line
	7050 1550 6900 1550
Wire Wire Line
	7050 1250 7050 1600
Wire Wire Line
	8200 2850 6250 2850
Wire Notes Line
	600  3600 2900 3600
Wire Notes Line
	2900 3600 2900 1250
Wire Notes Line
	2900 1250 600  1250
Wire Notes Line
	600  1250 600  3600
Text Notes 600  1250 0    50   ~ 0
SWD
NoConn ~ 6250 2250
$Comp
L 74HC126N U6
U 1 1 567894D6
P 8600 1300
F 0 "U6" H 8700 1425 50  0000 L BNN
F 1 "74HC126N" H 8700 1100 50  0000 L BNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 8600 1450 50  0001 C CNN
F 3 "" H 8600 1300 60  0000 C CNN
	1    8600 1300
	1    0    0    -1  
$EndComp
$Comp
L 74HC126N U6
U 2 1 56789565
P 8600 2100
F 0 "U6" H 8700 2225 50  0000 L BNN
F 1 "74HC126N" H 8700 1900 50  0000 L BNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 8600 2250 50  0001 C CNN
F 3 "" H 8600 2100 60  0000 C CNN
	2    8600 2100
	1    0    0    -1  
$EndComp
$Comp
L 74HC126N U6
U 3 1 567895EA
P 8600 2850
F 0 "U6" H 8700 2975 50  0000 L BNN
F 1 "74HC126N" H 8700 2650 50  0000 L BNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 8600 3000 50  0001 C CNN
F 3 "" H 8600 2850 60  0000 C CNN
	3    8600 2850
	1    0    0    -1  
$EndComp
$Comp
L 74HC126N U6
U 5 1 5678965D
P 8500 3750
F 0 "U6" H 8600 3875 50  0000 L BNN
F 1 "74HC126N" H 8600 3550 50  0000 L BNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 8500 3900 50  0001 C CNN
F 3 "" H 8500 3750 60  0000 C CNN
	5    8500 3750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR028
U 1 1 5678A195
P 8500 3450
F 0 "#PWR028" H 8500 3300 50  0001 C CNN
F 1 "+3V3" H 8500 3590 50  0000 C CNN
F 2 "" H 8500 3450 60  0000 C CNN
F 3 "" H 8500 3450 60  0000 C CNN
	1    8500 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 5678A209
P 8500 4050
F 0 "#PWR029" H 8500 3800 50  0001 C CNN
F 1 "GND" H 8500 3900 50  0000 C CNN
F 2 "" H 8500 4050 60  0000 C CNN
F 3 "" H 8500 4050 60  0000 C CNN
	1    8500 4050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR030
U 1 1 5678A2DF
P 8600 1000
F 0 "#PWR030" H 8600 850 50  0001 C CNN
F 1 "+3V3" H 8600 1140 50  0000 C CNN
F 2 "" H 8600 1000 60  0000 C CNN
F 3 "" H 8600 1000 60  0000 C CNN
	1    8600 1000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR031
U 1 1 5678A353
P 8600 1800
F 0 "#PWR031" H 8600 1650 50  0001 C CNN
F 1 "+3V3" H 8600 1940 50  0000 C CNN
F 2 "" H 8600 1800 60  0000 C CNN
F 3 "" H 8600 1800 60  0000 C CNN
	1    8600 1800
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR032
U 1 1 5678A3C7
P 8600 2550
F 0 "#PWR032" H 8600 2400 50  0001 C CNN
F 1 "+3V3" H 8600 2690 50  0000 C CNN
F 2 "" H 8600 2550 60  0000 C CNN
F 3 "" H 8600 2550 60  0000 C CNN
	1    8600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1300 7650 2000
Wire Wire Line
	7950 2350 7950 2100
Wire Wire Line
	7950 2100 8200 2100
Wire Wire Line
	9350 2100 9000 2100
Wire Wire Line
	9350 2850 9000 2850
Wire Wire Line
	3300 4550 3300 4400
Wire Wire Line
	9350 1300 9000 1300
Text Label 9350 1300 2    50   ~ 0
TONE_SW
Wire Wire Line
	3300 4400 3500 4400
Connection ~ 3500 4400
Connection ~ 9650 4750
Text Label 3500 4150 3    50   ~ 0
TONE_SW
Wire Wire Line
	5050 7300 5450 7300
Text Label 5050 7300 0    50   ~ 0
TONE_OUT
$Comp
L FUSE F1
U 1 1 567935ED
P 1150 6150
F 0 "F1" H 1250 6200 50  0000 C CNN
F 1 "FUSE" H 1050 6100 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_SemiClosed_Casing10x25mm" H 1150 6150 60  0001 C CNN
F 3 "" H 1150 6150 60  0000 C CNN
	1    1150 6150
	0    1    1    0   
$EndComp
$Comp
L CP C1
U 1 1 567935F4
P 1250 6550
F 0 "C1" H 1275 6650 50  0000 L CNN
F 1 "10µF" H 1275 6450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 1288 6400 30  0001 C CNN
F 3 "" H 1250 6550 60  0000 C CNN
	1    1250 6550
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 567935FB
P 1550 6550
F 0 "C2" H 1575 6650 50  0000 L CNN
F 1 "10nF" H 1575 6450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 1588 6400 30  0001 C CNN
F 3 "" H 1550 6550 60  0000 C CNN
	1    1550 6550
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 56793602
P 1850 6550
F 0 "R5" V 1930 6550 50  0000 C CNN
F 1 "1k" V 1850 6550 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 1780 6550 30  0001 C CNN
F 3 "" H 1850 6550 30  0000 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 56793609
P 1850 7000
F 0 "D1" H 1850 7100 50  0000 C CNN
F 1 "12V" H 1850 6900 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 1850 7000 60  0001 C CNN
F 3 "" H 1850 7000 60  0000 C CNN
	1    1850 7000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR033
U 1 1 56793610
P 1850 7250
F 0 "#PWR033" H 1850 7000 50  0001 C CNN
F 1 "GND" H 1850 7100 50  0000 C CNN
F 2 "" H 1850 7250 60  0000 C CNN
F 3 "" H 1850 7250 60  0000 C CNN
	1    1850 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 7200 1850 7250
Wire Wire Line
	1850 6700 1850 6800
Connection ~ 1250 6400
Connection ~ 1550 6400
$Comp
L GND #PWR034
U 1 1 5679361A
P 1550 6750
F 0 "#PWR034" H 1550 6500 50  0001 C CNN
F 1 "GND" H 1550 6600 50  0000 C CNN
F 2 "" H 1550 6750 60  0000 C CNN
F 3 "" H 1550 6750 60  0000 C CNN
	1    1550 6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 56793620
P 1250 6750
F 0 "#PWR035" H 1250 6500 50  0001 C CNN
F 1 "GND" H 1250 6600 50  0000 C CNN
F 2 "" H 1250 6750 60  0000 C CNN
F 3 "" H 1250 6750 60  0000 C CNN
	1    1250 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6700 1550 6750
Wire Wire Line
	1250 6700 1250 6750
Wire Wire Line
	1550 6400 1550 6300
$Comp
L R R6
U 1 1 56793629
P 2250 6550
F 0 "R6" V 2330 6550 50  0000 C CNN
F 1 "47k" V 2250 6550 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 2180 6550 30  0001 C CNN
F 3 "" H 2250 6550 30  0000 C CNN
	1    2250 6550
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 56793630
P 2250 7000
F 0 "R7" V 2330 7000 50  0000 C CNN
F 1 "47k" V 2250 7000 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 2180 7000 30  0001 C CNN
F 3 "" H 2250 7000 30  0000 C CNN
	1    2250 7000
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 56793637
P 2500 7000
F 0 "C3" H 2525 7100 50  0000 L CNN
F 1 "10µF" H 2525 6900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 2538 6850 30  0001 C CNN
F 3 "" H 2500 7000 60  0000 C CNN
	1    2500 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 5679363E
P 2250 7250
F 0 "#PWR036" H 2250 7000 50  0001 C CNN
F 1 "GND" H 2250 7100 50  0000 C CNN
F 2 "" H 2250 7250 60  0000 C CNN
F 3 "" H 2250 7250 60  0000 C CNN
	1    2250 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 56793644
P 2500 7250
F 0 "#PWR037" H 2500 7000 50  0001 C CNN
F 1 "GND" H 2500 7100 50  0000 C CNN
F 2 "" H 2500 7250 60  0000 C CNN
F 3 "" H 2500 7250 60  0000 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6750 2500 6750
Wire Wire Line
	2250 6700 2250 6850
Connection ~ 2250 6750
Wire Wire Line
	2500 6750 2500 6850
Wire Wire Line
	2500 7150 2500 7250
Wire Wire Line
	2250 7150 2250 7250
Connection ~ 1850 6400
Connection ~ 2250 6400
$Comp
L GND #PWR038
U 1 1 56793669
P 2950 6800
F 0 "#PWR038" H 2950 6550 50  0001 C CNN
F 1 "GND" H 2950 6650 50  0000 C CNN
F 2 "" H 2950 6800 60  0000 C CNN
F 3 "" H 2950 6800 60  0000 C CNN
	1    2950 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6700 2950 6800
$Comp
L CP C4
U 1 1 56793670
P 3350 6850
F 0 "C4" H 3375 6950 50  0000 L CNN
F 1 "1µF" H 3375 6750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 3388 6700 30  0001 C CNN
F 3 "" H 3350 6850 60  0000 C CNN
	1    3350 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 56793677
P 3350 7250
F 0 "#PWR039" H 3350 7000 50  0001 C CNN
F 1 "GND" H 3350 7100 50  0000 C CNN
F 2 "" H 3350 7250 60  0000 C CNN
F 3 "" H 3350 7250 60  0000 C CNN
	1    3350 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6300 3350 6700
Wire Wire Line
	3350 7000 3350 7250
$Comp
L R R10
U 1 1 56793680
P 3650 6550
F 0 "R10" V 3730 6550 50  0000 C CNN
F 1 "560" V 3650 6550 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 3580 6550 30  0001 C CNN
F 3 "" H 3650 6550 30  0000 C CNN
	1    3650 6550
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 56793687
P 3650 7000
F 0 "D3" H 3650 7100 50  0000 C CNN
F 1 "3V3" H 3650 6900 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 3650 7000 60  0001 C CNN
F 3 "" H 3650 7000 60  0000 C CNN
	1    3650 7000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR040
U 1 1 5679368E
P 3650 7250
F 0 "#PWR040" H 3650 7000 50  0001 C CNN
F 1 "GND" H 3650 7100 50  0000 C CNN
F 2 "" H 3650 7250 60  0000 C CNN
F 3 "" H 3650 7250 60  0000 C CNN
	1    3650 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 7200 3650 7250
Wire Wire Line
	3650 6700 3650 6800
$Comp
L +3V3 #PWR041
U 1 1 56793696
P 3350 6300
F 0 "#PWR041" H 3350 6150 50  0001 C CNN
F 1 "+3V3" H 3350 6440 50  0000 C CNN
F 2 "" H 3350 6300 60  0000 C CNN
F 3 "" H 3350 6300 60  0000 C CNN
	1    3350 6300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR042
U 1 1 5679369C
P 1550 6300
F 0 "#PWR042" H 1550 6150 50  0001 C CNN
F 1 "VCC" H 1550 6450 50  0000 C CNN
F 2 "" H 1550 6300 60  0000 C CNN
F 3 "" H 1550 6300 60  0000 C CNN
	1    1550 6300
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR043
U 1 1 567936A2
P 1150 5900
F 0 "#PWR043" H 1150 5750 50  0001 C CNN
F 1 "+12V" H 1150 6040 50  0000 C CNN
F 2 "" H 1150 5900 60  0000 C CNN
F 3 "" H 1150 5900 60  0000 C CNN
	1    1150 5900
	1    0    0    -1  
$EndComp
$Comp
L VCC/2 #PWR044
U 1 1 567936A8
P 2150 6750
F 0 "#PWR044" H 2150 6600 50  0001 C CNN
F 1 "VCC/2" H 2150 6900 50  0000 C CNN
F 2 "" H 2150 6750 60  0000 C CNN
F 3 "" H 2150 6750 60  0000 C CNN
	1    2150 6750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 6400 3650 6400
Wire Notes Line
	750  5600 4100 5600
Wire Notes Line
	4100 5600 4100 7550
Wire Notes Line
	4100 7550 750  7550
Wire Notes Line
	750  7550 750  5600
Text Notes 750  5600 0    60   ~ 0
Power supply
Connection ~ 3350 6400
Wire Wire Line
	7900 4800 8000 4800
Connection ~ 8000 4800
$Comp
L DB9 J1
U 1 1 56796668
P 1150 4600
F 0 "J1" H 1150 5150 50  0000 C CNN
F 1 "DB9" H 1150 4050 50  0000 C CNN
F 2 "w_conn_d-sub:DB_9F" H 1150 4600 50  0001 C CNN
F 3 "" H 1150 4600 50  0000 C CNN
	1    1150 4600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR045
U 1 1 567968FA
P 1600 5000
F 0 "#PWR045" H 1600 4750 50  0001 C CNN
F 1 "GND" H 1600 4850 50  0000 C CNN
F 2 "" H 1600 5000 60  0000 C CNN
F 3 "" H 1600 5000 60  0000 C CNN
	1    1600 5000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR046
U 1 1 56796B40
P 1600 4200
F 0 "#PWR046" H 1600 4050 50  0001 C CNN
F 1 "+3V3" H 1600 4340 50  0000 C CNN
F 2 "" H 1600 4200 60  0000 C CNN
F 3 "" H 1600 4200 60  0000 C CNN
	1    1600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4400 1600 4400
Wire Wire Line
	1850 4600 1600 4600
Text Label 1850 4600 2    50   ~ 0
RX
Text Label 1850 4400 2    50   ~ 0
TX
Wire Wire Line
	1850 4300 1600 4300
Wire Wire Line
	1850 4500 1600 4500
Wire Wire Line
	1850 4700 1600 4700
Text Label 1850 4300 2    50   ~ 0
SWDIO
Text Label 1850 4500 2    50   ~ 0
SWCLK
Text Label 1850 4700 2    50   ~ 0
SWO
Text Label 5200 1300 2    50   ~ 0
RESET
Text Label 5400 1250 2    50   ~ 0
ISP
Wire Wire Line
	1850 4800 1600 4800
Wire Wire Line
	1850 4900 1600 4900
Text Label 1850 4800 2    50   ~ 0
ISP
Text Label 1850 4900 2    50   ~ 0
RESET
$Comp
L 74HC126N U6
U 4 1 56781E99
P 9600 3700
F 0 "U6" H 9700 3825 50  0000 L BNN
F 1 "74HC126N" H 9700 3500 50  0000 L BNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9600 3850 50  0001 C CNN
F 3 "" H 9600 3700 50  0000 C CNN
	4    9600 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR047
U 1 1 5678208F
P 9200 3700
F 0 "#PWR047" H 9200 3450 50  0001 C CNN
F 1 "GND" H 9200 3550 50  0000 C CNN
F 2 "" H 9200 3700 60  0000 C CNN
F 3 "" H 9200 3700 60  0000 C CNN
	1    9200 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR048
U 1 1 56782142
P 10200 3700
F 0 "#PWR048" H 10200 3450 50  0001 C CNN
F 1 "GND" H 10200 3550 50  0000 C CNN
F 2 "" H 10200 3700 60  0000 C CNN
F 3 "" H 10200 3700 60  0000 C CNN
	1    10200 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR049
U 1 1 567821F5
P 9600 3400
F 0 "#PWR049" H 9600 3150 50  0001 C CNN
F 1 "GND" H 9600 3250 50  0000 C CNN
F 2 "" H 9600 3400 60  0000 C CNN
F 3 "" H 9600 3400 60  0000 C CNN
	1    9600 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	10000 3700 10200 3700
Wire Wire Line
	1150 6400 2550 6400
$Comp
L 7805 U1
U 1 1 567D9EE2
P 2950 6450
F 0 "U1" H 3100 6254 50  0000 C CNN
F 1 "REG3V3" H 2950 6650 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Horizontal" H 2950 6450 50  0001 C CNN
F 3 "" H 2950 6450 50  0000 C CNN
	1    2950 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6700 5200 6700
Wire Wire Line
	4600 6600 5200 6600
Wire Wire Line
	6250 1550 6600 1550
Wire Wire Line
	6300 1250 6300 1550
Connection ~ 6300 1550
Connection ~ 6250 1300
Wire Wire Line
	6900 1300 7200 1300
Connection ~ 7050 1300
Wire Wire Line
	6250 1750 6600 1750
Text Label 6600 1750 2    50   ~ 0
EXT
$Comp
L CNY17-1 U4
U 1 1 56C0A8B5
P 6300 5300
F 0 "U4" H 6100 5500 50  0000 L CNN
F 1 "MCA231" H 6300 5500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 6300 5300 50  0001 L CNN
F 3 "" H 6300 5300 50  0000 L CNN
	1    6300 5300
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 56C0A8BB
P 5950 5000
F 0 "R12" V 6030 5000 50  0000 C CNN
F 1 "2k7" V 5950 5000 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 5880 5000 30  0001 C CNN
F 3 "" H 5950 5000 30  0000 C CNN
	1    5950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5200 5950 5200
Wire Wire Line
	5950 5200 5950 5150
$Comp
L C C7
U 1 1 56C0A8C3
P 5950 5550
F 0 "C7" H 5975 5650 50  0000 L CNN
F 1 "10nF" H 5975 5450 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 5988 5400 30  0001 C CNN
F 3 "" H 5950 5550 60  0000 C CNN
	1    5950 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR050
U 1 1 56C0A8C9
P 5950 5700
F 0 "#PWR050" H 5950 5450 50  0001 C CNN
F 1 "GND" H 5950 5550 50  0000 C CNN
F 2 "" H 5950 5700 60  0000 C CNN
F 3 "" H 5950 5700 60  0000 C CNN
	1    5950 5700
	1    0    0    -1  
$EndComp
Connection ~ 5950 5400
$Comp
L GND #PWR051
U 1 1 56C0A8D2
P 6600 5450
F 0 "#PWR051" H 6600 5200 50  0001 C CNN
F 1 "GND" H 6600 5300 50  0000 C CNN
F 2 "" H 6600 5450 60  0000 C CNN
F 3 "" H 6600 5450 60  0000 C CNN
	1    6600 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5400 6600 5450
NoConn ~ 6600 5200
Wire Wire Line
	6600 5300 6900 5300
Text Label 6900 5300 2    50   ~ 0
EXT
$Comp
L VCC #PWR052
U 1 1 56C0A8EB
P 5950 4750
F 0 "#PWR052" H 5950 4600 50  0001 C CNN
F 1 "VCC" H 5950 4900 50  0000 C CNN
F 2 "" H 5950 4750 60  0000 C CNN
F 3 "" H 5950 4750 60  0000 C CNN
	1    5950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4750 5950 4850
Wire Wire Line
	5150 5400 6000 5400
Wire Wire Line
	4600 6900 5450 6900
Wire Wire Line
	4600 6800 5200 6800
Text Label 5200 6800 2    50   ~ 0
EXT_CR
Wire Wire Line
	4600 7100 5450 7100
$Comp
L GND #PWR053
U 1 1 56C0EA2F
P 4800 7200
F 0 "#PWR053" H 4800 6950 50  0001 C CNN
F 1 "GND" H 4800 7050 50  0000 C CNN
F 2 "" H 4800 7200 60  0000 C CNN
F 3 "" H 4800 7200 60  0000 C CNN
	1    4800 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 7000 4800 7000
Wire Wire Line
	4800 7000 4800 7200
$Comp
L R R32
U 1 1 56C0EB08
P 5650 4800
F 0 "R32" V 5730 4800 50  0000 C CNN
F 1 "15k" V 5650 4800 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 5580 4800 30  0001 C CNN
F 3 "" H 5650 4800 30  0000 C CNN
	1    5650 4800
	0    1    1    0   
$EndComp
$Comp
L LED D7
U 1 1 56C0F152
P 5500 5100
F 0 "D7" H 5500 5200 50  0000 C CNN
F 1 "EXT" H 5500 5000 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 5500 5100 60  0001 C CNN
F 3 "" H 5500 5100 60  0000 C CNN
	1    5500 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 5300 5500 5400
Connection ~ 5500 5400
Wire Wire Line
	5800 4800 5950 4800
Connection ~ 5950 4800
Wire Wire Line
	5500 4800 5500 4900
Text Label 5150 5400 0    50   ~ 0
EXT_CR
$Comp
L R R34
U 1 1 57083520
P 7350 1300
F 0 "R34" V 7430 1300 50  0000 C CNN
F 1 "56k" V 7350 1300 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 7280 1300 30  0001 C CNN
F 3 "" H 7350 1300 30  0000 C CNN
	1    7350 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7500 1300 8200 1300
$Comp
L R R33
U 1 1 570838EB
P 7050 1750
F 0 "R33" V 7130 1750 50  0000 C CNN
F 1 "56k" V 7050 1750 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6980 1750 30  0001 C CNN
F 3 "" H 7050 1750 30  0000 C CNN
	1    7050 1750
	1    0    0    -1  
$EndComp
Connection ~ 7050 1550
Connection ~ 7050 1900
Connection ~ 7650 1300
$Comp
L LH1540 U2
U 1 1 57095F3F
P 3850 5050
F 0 "U2" H 3650 5250 50  0000 L CNN
F 1 "LH1540" H 3850 5250 50  0000 L CNN
F 2 "" H 3650 4850 50  0000 L CIN
F 3 "" H 3800 5050 50  0000 L CNN
	1    3850 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4950 3550 4950
Wire Wire Line
	3550 5150 3500 5150
Wire Wire Line
	4150 4950 4600 4950
Wire Wire Line
	4150 5150 4600 5150
$EndSCHEMATC
