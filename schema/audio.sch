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
Sheet 2 2
Title "Logique relais"
Date "2016-02-14"
Rev "6"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2650 2100 2800 2100
$Comp
L R R19
U 1 1 5677F0F1
P 2950 2100
F 0 "R19" V 3030 2100 50  0000 C CNN
F 1 "560" V 2950 2100 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 2880 2100 30  0001 C CNN
F 3 "" H 2950 2100 30  0000 C CNN
	1    2950 2100
	0    1    1    0   
$EndComp
$Comp
L C C10
U 1 1 5677F0F8
P 3150 2400
F 0 "C10" H 3175 2500 50  0000 L CNN
F 1 "330nF" H 3175 2300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W3.5_P5" H 3188 2250 30  0001 C CNN
F 3 "" H 3150 2400 60  0000 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR53
U 1 1 5677F0FF
P 3150 2650
F 0 "#PWR53" H 3150 2400 50  0001 C CNN
F 1 "GND" H 3150 2500 50  0000 C CNN
F 2 "" H 3150 2650 60  0000 C CNN
F 3 "" H 3150 2650 60  0000 C CNN
	1    3150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2550 3150 2650
Wire Wire Line
	3100 2100 3200 2100
Wire Wire Line
	3150 2100 3150 2250
$Comp
L R R20
U 1 1 5677F108
P 3350 2100
F 0 "R20" V 3430 2100 50  0000 C CNN
F 1 "1k8" V 3350 2100 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 3280 2100 30  0001 C CNN
F 3 "" H 3350 2100 30  0000 C CNN
	1    3350 2100
	0    1    1    0   
$EndComp
$Comp
L C C11
U 1 1 5677F10F
P 3550 2400
F 0 "C11" H 3575 2500 50  0000 L CNN
F 1 "100nF" H 3575 2300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2.5_P5" H 3588 2250 30  0001 C CNN
F 3 "" H 3550 2400 60  0000 C CNN
	1    3550 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR54
U 1 1 5677F116
P 3550 2650
F 0 "#PWR54" H 3550 2400 50  0001 C CNN
F 1 "GND" H 3550 2500 50  0000 C CNN
F 2 "" H 3550 2650 60  0000 C CNN
F 3 "" H 3550 2650 60  0000 C CNN
	1    3550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2550 3550 2650
Wire Wire Line
	3500 2100 3600 2100
Wire Wire Line
	3550 2100 3550 2250
$Comp
L R R21
U 1 1 5677F11F
P 3750 2100
F 0 "R21" V 3830 2100 50  0000 C CNN
F 1 "5k6" V 3750 2100 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 3680 2100 30  0001 C CNN
F 3 "" H 3750 2100 30  0000 C CNN
	1    3750 2100
	0    1    1    0   
$EndComp
$Comp
L C C12
U 1 1 5677F126
P 3950 2400
F 0 "C12" H 3975 2500 50  0000 L CNN
F 1 "33nF" H 3975 2300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W3.5_P5" H 3988 2250 30  0001 C CNN
F 3 "" H 3950 2400 60  0000 C CNN
	1    3950 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR55
U 1 1 5677F12D
P 3950 2650
F 0 "#PWR55" H 3950 2400 50  0001 C CNN
F 1 "GND" H 3950 2500 50  0000 C CNN
F 2 "" H 3950 2650 60  0000 C CNN
F 3 "" H 3950 2650 60  0000 C CNN
	1    3950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2550 3950 2650
Wire Wire Line
	3900 2100 4000 2100
Wire Wire Line
	3950 2100 3950 2250
Connection ~ 3150 2100
Connection ~ 3550 2100
$Comp
L POT RV1
U 1 1 5677F138
P 4400 2350
F 0 "RV1" H 4400 2250 50  0000 C CNN
F 1 "10k" H 4400 2350 50  0000 C CNN
F 2 "Potentiometres:POT93YB" H 4400 2350 60  0001 C CNN
F 3 "" H 4400 2350 60  0000 C CNN
	1    4400 2350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR57
U 1 1 5677F13F
P 4400 2650
F 0 "#PWR57" H 4400 2400 50  0001 C CNN
F 1 "GND" H 4400 2500 50  0000 C CNN
F 2 "" H 4400 2650 60  0000 C CNN
F 3 "" H 4400 2650 60  0000 C CNN
	1    4400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2600 4400 2650
Connection ~ 3950 2100
$Comp
L CP C13
U 1 1 5677F147
P 4700 2350
F 0 "C13" H 4725 2450 50  0000 L CNN
F 1 "10µF" H 4725 2250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 4738 2200 30  0001 C CNN
F 3 "" H 4700 2350 60  0000 C CNN
	1    4700 2350
	0    1    1    0   
$EndComp
$Comp
L R R23
U 1 1 5677F14E
P 5000 2350
F 0 "R23" V 5080 2350 50  0000 C CNN
F 1 "47k" V 5000 2350 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 4930 2350 30  0001 C CNN
F 3 "" H 5000 2350 30  0000 C CNN
	1    5000 2350
	0    -1   -1   0   
$EndComp
$Comp
L OP275-RESCUE-ham-relay U6
U 1 1 5677F155
P 5600 2250
F 0 "U6" H 5600 2400 60  0000 L CNN
F 1 "TBB1458" H 5600 2100 60  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 5600 2250 60  0001 C CNN
F 3 "" H 5600 2250 60  0000 C CNN
	1    5600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2350 5250 2350
$Comp
L R R25
U 1 1 5677F15D
P 5600 2900
F 0 "R25" V 5680 2900 50  0000 C CNN
F 1 "220k" V 5600 2900 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 5530 2900 30  0001 C CNN
F 3 "" H 5600 2900 30  0000 C CNN
	1    5600 2900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR62
U 1 1 5677F164
P 5500 2550
F 0 "#PWR62" H 5500 2300 50  0001 C CNN
F 1 "GND" H 5500 2400 50  0000 C CNN
F 2 "" H 5500 2550 60  0000 C CNN
F 3 "" H 5500 2550 60  0000 C CNN
	1    5500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2900 6000 2900
Wire Wire Line
	5450 2900 5200 2900
Wire Wire Line
	5200 2900 5200 2350
Connection ~ 5200 2350
$Comp
L R R27
U 1 1 5677F16E
P 6200 2250
F 0 "R27" V 6280 2250 50  0000 C CNN
F 1 "1k2" V 6200 2250 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6130 2250 30  0001 C CNN
F 3 "" H 6200 2250 30  0000 C CNN
	1    6200 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2250 6050 2250
Wire Wire Line
	6000 2900 6000 2250
Connection ~ 6000 2250
Wire Wire Line
	3950 3350 4400 3350
$Comp
L POT RV2
U 1 1 5677F179
P 4400 3600
F 0 "RV2" H 4400 3500 50  0000 C CNN
F 1 "1k" H 4400 3600 50  0000 C CNN
F 2 "Potentiometres:POT93YA" H 4400 3600 60  0001 C CNN
F 3 "" H 4400 3600 60  0000 C CNN
	1    4400 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR58
U 1 1 5677F180
P 4400 3900
F 0 "#PWR58" H 4400 3650 50  0001 C CNN
F 1 "GND" H 4400 3750 50  0000 C CNN
F 2 "" H 4400 3900 60  0000 C CNN
F 3 "" H 4400 3900 60  0000 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3850 4400 3900
$Comp
L CP C14
U 1 1 5677F187
P 4700 3600
F 0 "C14" H 4725 3700 50  0000 L CNN
F 1 "10µF" H 4725 3500 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 4738 3450 30  0001 C CNN
F 3 "" H 4700 3600 60  0000 C CNN
	1    4700 3600
	0    1    1    0   
$EndComp
$Comp
L R R24
U 1 1 5677F18E
P 5000 3600
F 0 "R24" V 5080 3600 50  0000 C CNN
F 1 "47k" V 5000 3600 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 4930 3600 30  0001 C CNN
F 3 "" H 5000 3600 30  0000 C CNN
	1    5000 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 3600 5250 3600
$Comp
L R R26
U 1 1 5677F196
P 5600 4150
F 0 "R26" V 5680 4150 50  0000 C CNN
F 1 "220k" V 5600 4150 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 5530 4150 30  0001 C CNN
F 3 "" H 5600 4150 30  0000 C CNN
	1    5600 4150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR64
U 1 1 5677F19D
P 5500 3800
F 0 "#PWR64" H 5500 3550 50  0001 C CNN
F 1 "GND" H 5500 3650 50  0000 C CNN
F 2 "" H 5500 3800 60  0000 C CNN
F 3 "" H 5500 3800 60  0000 C CNN
	1    5500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4150 6000 4150
Wire Wire Line
	5450 4150 5200 4150
Wire Wire Line
	5200 4150 5200 3600
Connection ~ 5200 3600
$Comp
L R R28
U 1 1 5677F1A7
P 6200 3500
F 0 "R28" V 6280 3500 50  0000 C CNN
F 1 "1k2" V 6200 3500 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6130 3500 30  0001 C CNN
F 3 "" H 6200 3500 30  0000 C CNN
	1    6200 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 3500 6050 3500
Wire Wire Line
	6000 4150 6000 3500
Connection ~ 6000 3500
$Comp
L OP275-RESCUE-ham-relay U6
U 2 1 5677F1B1
P 5600 3500
F 0 "U6" H 5600 3650 60  0000 L CNN
F 1 "TBB1458" H 5600 3350 60  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 5600 3500 60  0001 C CNN
F 3 "" H 5600 3500 60  0000 C CNN
	2    5600 3500
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 5677F1B8
P 4100 3650
F 0 "R22" V 4180 3650 50  0000 C CNN
F 1 "1k8" V 4100 3650 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 4030 3650 30  0001 C CNN
F 3 "" H 4100 3650 30  0000 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR56
U 1 1 5677F1BF
P 4100 3900
F 0 "#PWR56" H 4100 3650 50  0001 C CNN
F 1 "GND" H 4100 3750 50  0000 C CNN
F 2 "" H 4100 3900 60  0000 C CNN
F 3 "" H 4100 3900 60  0000 C CNN
	1    4100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3800 4100 3900
Wire Wire Line
	4100 3500 4100 3350
Connection ~ 4100 3350
Wire Wire Line
	6350 2250 6550 2250
Wire Wire Line
	6350 3500 6450 3500
Wire Wire Line
	6450 3500 6450 2250
Connection ~ 6450 2250
$Comp
L CP C15
U 1 1 5677F1CD
P 6700 2250
F 0 "C15" H 6725 2350 50  0000 L CNN
F 1 "10µF" H 6725 2150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 6738 2100 30  0001 C CNN
F 3 "" H 6700 2250 60  0000 C CNN
	1    6700 2250
	0    -1   -1   0   
$EndComp
$Comp
L R R29
U 1 1 5677F1D4
P 6900 2550
F 0 "R29" V 6980 2550 50  0000 C CNN
F 1 "1k8" V 6900 2550 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 6830 2550 30  0001 C CNN
F 3 "" H 6900 2550 30  0000 C CNN
	1    6900 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR65
U 1 1 5677F1DB
P 6900 2800
F 0 "#PWR65" H 6900 2550 50  0001 C CNN
F 1 "GND" H 6900 2650 50  0000 C CNN
F 2 "" H 6900 2800 60  0000 C CNN
F 3 "" H 6900 2800 60  0000 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2700 6900 2800
Wire Wire Line
	6900 2400 6900 2250
Wire Wire Line
	6850 2250 7200 2250
Connection ~ 6900 2250
$Comp
L VCC #PWR61
U 1 1 5677F1E6
P 5500 1950
F 0 "#PWR61" H 5500 1800 50  0001 C CNN
F 1 "VCC" H 5500 2100 50  0000 C CNN
F 2 "" H 5500 1950 60  0000 C CNN
F 3 "" H 5500 1950 60  0000 C CNN
	1    5500 1950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR63
U 1 1 5677F1EC
P 5500 3200
F 0 "#PWR63" H 5500 3050 50  0001 C CNN
F 1 "VCC" H 5500 3350 50  0000 C CNN
F 2 "" H 5500 3200 60  0000 C CNN
F 3 "" H 5500 3200 60  0000 C CNN
	1    5500 3200
	1    0    0    -1  
$EndComp
$Comp
L VCC/2 #PWR60
U 1 1 5677F1F2
P 5200 3200
F 0 "#PWR60" H 5200 3050 50  0001 C CNN
F 1 "VCC/2" H 5200 3350 50  0000 C CNN
F 2 "" H 5200 3200 60  0000 C CNN
F 3 "" H 5200 3200 60  0000 C CNN
	1    5200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3400 5200 3400
Wire Wire Line
	5200 3400 5200 3200
$Comp
L VCC/2 #PWR59
U 1 1 5677F1FA
P 5200 1950
F 0 "#PWR59" H 5200 1800 50  0001 C CNN
F 1 "VCC/2" H 5200 2100 50  0000 C CNN
F 2 "" H 5200 1950 60  0000 C CNN
F 3 "" H 5200 1950 60  0000 C CNN
	1    5200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2150 5200 2150
Wire Wire Line
	5200 2150 5200 1950
Text HLabel 7200 2250 2    50   Output ~ 0
AUDIO_OUT
Text HLabel 3950 3350 0    50   Input ~ 0
AUDIO_IN
Text HLabel 2650 2100 0    50   Input ~ 0
TONE
$Comp
L R R30
U 1 1 567C5134
P 4150 2100
F 0 "R30" V 4230 2100 50  0000 C CNN
F 1 "22k" V 4150 2100 50  0000 C CNN
F 2 "resistors:Resistor_Horizontal_RM08mm" V 4080 2100 30  0001 C CNN
F 3 "" H 4150 2100 30  0000 C CNN
	1    4150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 2100 4400 2100
$EndSCHEMATC
