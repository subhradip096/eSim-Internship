EESchema Schematic File Version 2
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
LIBS:power
LIBS:eSim_Plot
LIBS:transistors
LIBS:conn
LIBS:eSim_User
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:eSim_Analog
LIBS:eSim_Devices
LIBS:eSim_Digital
LIBS:eSim_Hybrid
LIBS:eSim_Miscellaneous
LIBS:eSim_Power
LIBS:eSim_Sources
LIBS:eSim_Subckt
LIBS:eSim_Nghdl
LIBS:eSim_Ngveri
LIBS:eSim_SKY130
LIBS:eSim_SKY130_Subckts
LIBS:micro-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L adc_bridge_8 U2
U 1 1 63B6CD8B
P 4000 1900
F 0 "U2" H 4000 1900 60  0000 C CNN
F 1 "adc_bridge_8" H 4000 2050 60  0000 C CNN
F 2 "" H 4000 1900 60  0000 C CNN
F 3 "" H 4000 1900 60  0000 C CNN
	1    4000 1900
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_8 U3
U 1 1 63B6CDCC
P 4000 2700
F 0 "U3" H 4000 2700 60  0000 C CNN
F 1 "adc_bridge_8" H 4000 2850 60  0000 C CNN
F 2 "" H 4000 2700 60  0000 C CNN
F 3 "" H 4000 2700 60  0000 C CNN
	1    4000 2700
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_8 U4
U 1 1 63B6CE9A
P 4000 3500
F 0 "U4" H 4000 3500 60  0000 C CNN
F 1 "adc_bridge_8" H 4000 3650 60  0000 C CNN
F 2 "" H 4000 3500 60  0000 C CNN
F 3 "" H 4000 3500 60  0000 C CNN
	1    4000 3500
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_8 U5
U 1 1 63B6CEE9
P 4000 4300
F 0 "U5" H 4000 4300 60  0000 C CNN
F 1 "adc_bridge_8" H 4000 4450 60  0000 C CNN
F 2 "" H 4000 4300 60  0000 C CNN
F 3 "" H 4000 4300 60  0000 C CNN
	1    4000 4300
	1    0    0    -1  
$EndComp
$Comp
L DC v1
U 1 1 63B8B8F5
P 1850 2750
F 0 "v1" H 1650 2850 60  0000 C CNN
F 1 "DC" H 1650 2700 60  0000 C CNN
F 2 "R1" H 1550 2750 60  0000 C CNN
F 3 "" H 1850 2750 60  0000 C CNN
	1    1850 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 63B8BA82
P 1850 3400
F 0 "#PWR1" H 1850 3150 50  0001 C CNN
F 1 "GND" H 1850 3250 50  0000 C CNN
F 2 "" H 1850 3400 50  0001 C CNN
F 3 "" H 1850 3400 50  0001 C CNN
	1    1850 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 63B8BD0D
P 2450 3650
F 0 "#PWR3" H 2450 3400 50  0001 C CNN
F 1 "GND" H 2450 3500 50  0000 C CNN
F 2 "" H 2450 3650 50  0001 C CNN
F 3 "" H 2450 3650 50  0001 C CNN
	1    2450 3650
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_8 U11
U 1 1 63C67A5E
P 4100 800
F 0 "U11" H 4100 800 60  0000 C CNN
F 1 "adc_bridge_8" H 4100 950 60  0000 C CNN
F 2 "" H 4100 800 60  0000 C CNN
F 3 "" H 4100 800 60  0000 C CNN
	1    4100 800 
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_3 U12
U 1 1 63C67AE6
P 4100 1600
F 0 "U12" H 4100 1600 60  0000 C CNN
F 1 "adc_bridge_3" H 4100 1750 60  0000 C CNN
F 2 "" H 4100 1600 60  0000 C CNN
F 3 "" H 4100 1600 60  0000 C CNN
	1    4100 1600
	1    0    0    -1  
$EndComp
$Comp
L pulse v2
U 1 1 63C77C85
P 2350 1250
F 0 "v2" H 2150 1350 60  0000 C CNN
F 1 "pulse" H 2150 1200 60  0000 C CNN
F 2 "R1" H 2050 1250 60  0000 C CNN
F 3 "" H 2350 1250 60  0000 C CNN
	1    2350 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 63C77D99
P 2350 1850
F 0 "#PWR2" H 2350 1600 50  0001 C CNN
F 1 "GND" H 2350 1700 50  0000 C CNN
F 2 "" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_1 U9
U 1 1 63C7DC7A
P 9050 2150
F 0 "U9" H 9050 2150 60  0000 C CNN
F 1 "dac_bridge_1" H 9050 2300 60  0000 C CNN
F 2 "" H 9050 2150 60  0000 C CNN
F 3 "" H 9050 2150 60  0000 C CNN
	1    9050 2150
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U13
U 1 1 63C7DE21
P 9900 2050
F 0 "U13" H 9900 2550 60  0000 C CNN
F 1 "plot_v1" H 10100 2400 60  0000 C CNN
F 2 "" H 9900 2050 60  0000 C CNN
F 3 "" H 9900 2050 60  0000 C CNN
	1    9900 2050
	1    0    0    -1  
$EndComp
Text GLabel 10200 2100 2    60   Input ~ 0
O0
$Comp
L pulse v3
U 1 1 63C8DEF8
P 8800 4550
F 0 "v3" H 8600 4650 60  0000 C CNN
F 1 "pulse" H 8600 4500 60  0000 C CNN
F 2 "R1" H 8500 4550 60  0000 C CNN
F 3 "" H 8800 4550 60  0000 C CNN
	1    8800 4550
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_1 U14
U 1 1 63C8DF8F
P 8800 3200
F 0 "U14" H 8800 3200 60  0000 C CNN
F 1 "adc_bridge_1" H 8800 3350 60  0000 C CNN
F 2 "" H 8800 3200 60  0000 C CNN
F 3 "" H 8800 3200 60  0000 C CNN
	1    8800 3200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR4
U 1 1 63C8E1E7
P 8800 5250
F 0 "#PWR4" H 8800 5000 50  0001 C CNN
F 1 "GND" H 8800 5100 50  0000 C CNN
F 2 "" H 8800 5250 50  0001 C CNN
F 3 "" H 8800 5250 50  0001 C CNN
	1    8800 5250
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U15
U 1 1 63CBECBF
P 1650 1000
F 0 "U15" H 1650 1500 60  0000 C CNN
F 1 "plot_v1" H 1850 1350 60  0000 C CNN
F 2 "" H 1650 1000 60  0000 C CNN
F 3 "" H 1650 1000 60  0000 C CNN
	1    1650 1000
	1    0    0    -1  
$EndComp
Text GLabel 2350 600  1    60   Input ~ 0
CLK
$Comp
L fossee_proc U1
U 1 1 63D0EC4B
P 2600 2550
F 0 "U1" H 5450 4350 60  0000 C CNN
F 1 "fossee_proc" H 5450 4550 60  0000 C CNN
F 2 "" H 5450 4500 60  0000 C CNN
F 3 "" H 5450 4500 60  0000 C CNN
	1    2600 2550
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_6 U6
U 1 1 63D10767
P 4050 5100
F 0 "U6" H 4050 5100 60  0000 C CNN
F 1 "adc_bridge_6" H 4050 5250 60  0000 C CNN
F 2 "" H 4050 5100 60  0000 C CNN
F 3 "" H 4050 5100 60  0000 C CNN
	1    4050 5100
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_8 U16
U 1 1 63D3BD70
P 6950 4900
F 0 "U16" H 6950 4900 60  0000 C CNN
F 1 "dac_bridge_8" H 6950 5050 60  0000 C CNN
F 2 "" H 6950 4900 60  0000 C CNN
F 3 "" H 6950 4900 60  0000 C CNN
	1    6950 4900
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_7 U10
U 1 1 63D3C02A
P 6950 4200
F 0 "U10" H 6950 4200 60  0000 C CNN
F 1 "dac_bridge_7" H 6950 4350 60  0000 C CNN
F 2 "" H 6950 4200 60  0000 C CNN
F 3 "" H 6950 4200 60  0000 C CNN
	1    6950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3400 3200 3400
Wire Wire Line
	3200 3400 3200 3350
Wire Wire Line
	3200 3350 3400 3350
Wire Wire Line
	2850 2250 2850 3950
Wire Wire Line
	2850 4050 2850 5350
Wire Wire Line
	2850 3150 3400 3150
Connection ~ 2850 3400
Wire Wire Line
	3300 850  3300 2250
Wire Wire Line
	3300 2450 3300 3250
Wire Wire Line
	3300 3050 3400 3050
Connection ~ 3300 3150
Wire Wire Line
	3300 2950 3400 2950
Connection ~ 3300 3050
Wire Wire Line
	3300 2850 3400 2850
Connection ~ 3300 2950
Wire Wire Line
	3300 2750 3400 2750
Connection ~ 3300 2850
Wire Wire Line
	3300 2650 3400 2650
Connection ~ 3300 2750
Wire Wire Line
	3300 2550 3400 2550
Connection ~ 3300 2650
Wire Wire Line
	3300 2450 3400 2450
Connection ~ 3300 2550
Wire Wire Line
	2850 2250 3400 2250
Wire Wire Line
	3300 2150 3400 2150
Wire Wire Line
	3300 2050 3400 2050
Connection ~ 3300 2150
Wire Wire Line
	3300 1950 3400 1950
Connection ~ 3300 2050
Wire Wire Line
	3300 1850 3400 1850
Connection ~ 3300 1950
Wire Wire Line
	2850 3450 3400 3450
Wire Wire Line
	2850 3550 3400 3550
Connection ~ 2850 3450
Wire Wire Line
	2850 3650 3400 3650
Connection ~ 2850 3550
Wire Wire Line
	2850 3750 3400 3750
Connection ~ 2850 3650
Wire Wire Line
	2550 4050 3400 4050
Wire Wire Line
	2850 4150 3400 4150
Connection ~ 2850 4050
Wire Wire Line
	2850 4250 3400 4250
Connection ~ 2850 4150
Wire Wire Line
	2850 4350 3400 4350
Connection ~ 2850 4250
Wire Wire Line
	2850 4450 3400 4450
Connection ~ 2850 4350
Wire Wire Line
	2850 4550 3400 4550
Connection ~ 2850 4450
Wire Wire Line
	2850 4650 3400 4650
Connection ~ 2850 4550
Wire Wire Line
	2850 4750 3400 4750
Connection ~ 2850 4650
Wire Wire Line
	2850 4950 3400 4950
Connection ~ 2850 4750
Wire Wire Line
	1850 2300 1850 2150
Wire Wire Line
	1850 3400 1850 3200
Wire Wire Line
	2450 3650 2450 3400
Wire Wire Line
	4550 4950 4750 4950
Wire Wire Line
	4550 4850 4750 4850
Wire Wire Line
	4550 4750 4750 4750
Wire Wire Line
	4550 4650 4750 4650
Wire Wire Line
	4550 4550 4750 4550
Wire Wire Line
	4550 4450 4750 4450
Wire Wire Line
	4550 4350 4750 4350
Wire Wire Line
	4550 4250 4750 4250
Wire Wire Line
	4550 4150 4750 4150
Wire Wire Line
	4550 4050 4750 4050
Wire Wire Line
	4550 3950 4750 3950
Wire Wire Line
	4550 3850 4750 3850
Wire Wire Line
	4550 3750 4750 3750
Wire Wire Line
	4550 3650 4750 3650
Wire Wire Line
	4550 3550 4750 3550
Wire Wire Line
	4550 3450 4750 3450
Wire Wire Line
	4550 3350 4750 3350
Wire Wire Line
	4550 3250 4750 3250
Wire Wire Line
	4550 3150 4750 3150
Wire Wire Line
	4550 3050 4750 3050
Wire Wire Line
	4550 2950 4750 2950
Wire Wire Line
	4550 2850 4750 2850
Wire Wire Line
	4550 2750 4750 2750
Wire Wire Line
	4550 2650 4750 2650
Wire Wire Line
	4550 2550 4750 2550
Wire Wire Line
	4550 2450 4750 2450
Wire Wire Line
	4550 2350 4750 2350
Wire Wire Line
	4550 2250 4750 2250
Wire Wire Line
	4550 2150 4750 2150
Wire Wire Line
	4550 2050 4750 2050
Wire Wire Line
	4550 1950 4750 1950
Wire Wire Line
	4550 1850 4750 1850
Wire Wire Line
	4650 850  4750 850 
Wire Wire Line
	4750 950  4650 950 
Wire Wire Line
	4750 1050 4650 1050
Wire Wire Line
	4750 1150 4650 1150
Wire Wire Line
	4750 1250 4650 1250
Wire Wire Line
	4750 1350 4650 1350
Wire Wire Line
	4750 1450 4650 1450
Wire Wire Line
	4750 1550 4650 1550
Wire Wire Line
	4750 1650 4650 1650
Wire Wire Line
	4750 1750 4650 1750
Wire Wire Line
	4750 5050 4600 5050
Wire Wire Line
	4750 5150 4600 5150
Wire Wire Line
	4750 5250 4600 5250
Wire Wire Line
	4750 5350 4600 5350
Wire Wire Line
	4750 5450 4600 5450
Wire Wire Line
	4750 5550 4600 5550
Wire Wire Line
	1850 2150 2750 2150
Wire Wire Line
	2750 2150 2750 2350
Wire Wire Line
	2750 2350 3400 2350
Connection ~ 3300 2250
Connection ~ 2850 3150
Wire Wire Line
	3300 1750 3500 1750
Connection ~ 3300 1850
Wire Wire Line
	3300 1650 3500 1650
Connection ~ 3300 1750
Wire Wire Line
	3300 1550 3500 1550
Connection ~ 3300 1650
Wire Wire Line
	3300 1450 3500 1450
Connection ~ 3300 1550
Wire Wire Line
	3300 1350 3500 1350
Connection ~ 3300 1450
Wire Wire Line
	3300 1250 3500 1250
Connection ~ 3300 1350
Wire Wire Line
	3300 1150 3500 1150
Connection ~ 3300 1250
Wire Wire Line
	3300 1050 3500 1050
Connection ~ 3300 1150
Wire Wire Line
	3300 950  3500 950 
Connection ~ 3300 1050
Wire Wire Line
	3300 850  3500 850 
Connection ~ 3300 950 
Wire Wire Line
	1650 800  3500 800 
Wire Wire Line
	3500 800  3500 750 
Wire Wire Line
	2350 1700 2350 1850
Wire Wire Line
	2000 2150 2000 5450
Connection ~ 2000 2150
Wire Wire Line
	2000 3850 3400 3850
Wire Wire Line
	3300 3250 3400 3250
Wire Wire Line
	2550 3400 2550 4050
Connection ~ 2550 3400
Wire Wire Line
	2850 4850 3400 4850
Connection ~ 2850 4850
Wire Wire Line
	2000 5450 3450 5450
Connection ~ 2000 3950
Wire Wire Line
	2850 5050 3450 5050
Connection ~ 2850 4950
Wire Wire Line
	2850 5150 3450 5150
Connection ~ 2850 5050
Wire Wire Line
	2850 5250 3450 5250
Connection ~ 2850 5150
Wire Wire Line
	2850 5350 3450 5350
Connection ~ 2850 5250
Connection ~ 2850 5350
Wire Wire Line
	7800 2050 8450 2050
Wire Wire Line
	8450 2050 8450 2100
Wire Wire Line
	9900 1850 9900 2100
Wire Wire Line
	9600 2100 10200 2100
Connection ~ 9900 2100
Wire Wire Line
	8800 3800 8800 4100
Wire Wire Line
	8800 3800 8750 3800
Wire Wire Line
	8800 5250 8800 5000
Wire Wire Line
	8750 2650 8750 2500
Wire Wire Line
	8750 2500 8000 2500
Wire Wire Line
	8000 2500 8000 -100
Connection ~ 2350 800 
Wire Wire Line
	2350 600  2350 800 
Wire Wire Line
	4650 750  4650 650 
Wire Wire Line
	4650 650  4750 650 
Wire Wire Line
	8000 -100 4700 -100
Wire Wire Line
	4700 -100 4700 750 
Wire Wire Line
	4700 750  4750 750 
Wire Wire Line
	6150 5650 7400 5650
Wire Wire Line
	7400 5650 7400 2000
Wire Wire Line
	7400 2000 7800 2000
Wire Wire Line
	7800 2000 7800 2050
Wire Wire Line
	2850 3950 3400 3950
Connection ~ 2850 3750
Wire Wire Line
	2000 3850 2000 3950
Wire Wire Line
	2950 5450 2950 5550
Wire Wire Line
	2950 5550 3450 5550
Connection ~ 2950 5450
Wire Wire Line
	6150 4150 6350 4150
Wire Wire Line
	6150 4250 6350 4250
Wire Wire Line
	6150 4350 6350 4350
Wire Wire Line
	6150 4450 6350 4450
Wire Wire Line
	6150 4550 6350 4550
Wire Wire Line
	6150 4650 6350 4650
Wire Wire Line
	6150 5550 6350 5550
Wire Wire Line
	6150 5450 6350 5450
Wire Wire Line
	6150 5350 6350 5350
Wire Wire Line
	6350 5250 6150 5250
Wire Wire Line
	6150 5150 6350 5150
Wire Wire Line
	6350 5050 6150 5050
Wire Wire Line
	6150 4950 6350 4950
Wire Wire Line
	6350 4850 6150 4850
Wire Wire Line
	6150 4750 6350 4750
Text GLabel 8000 5800 2    60   Input ~ 0
O1
Text GLabel 8000 5600 2    60   Input ~ 0
O2
Text GLabel 8050 5400 2    60   Input ~ 0
O3
Text GLabel 8050 5200 2    60   Input ~ 0
O4
Text GLabel 8050 5000 2    60   Input ~ 0
O5
Text GLabel 8050 4800 2    60   Input ~ 0
O6
Text GLabel 8050 4600 2    60   Input ~ 0
O7
Text GLabel 8050 4400 2    60   Input ~ 0
O8
Text GLabel 8050 4200 2    60   Input ~ 0
O9
Text GLabel 8050 4000 2    60   Input ~ 0
O10
Text GLabel 8050 3750 2    60   Input ~ 0
O11
Text GLabel 8050 3550 2    60   Input ~ 0
O12
Text GLabel 8050 3400 2    60   Input ~ 0
O13
Text GLabel 7850 3250 1    60   Input ~ 0
O14
Text GLabel 7600 3250 1    60   Input ~ 0
O15
Wire Wire Line
	7600 3250 7600 4150
Wire Wire Line
	7600 4150 7500 4150
Wire Wire Line
	7500 4250 7850 4250
Wire Wire Line
	7850 4250 7850 3250
Wire Wire Line
	7500 4350 7650 4350
Wire Wire Line
	7650 4350 7650 3400
Wire Wire Line
	7650 3400 8050 3400
Wire Wire Line
	7500 4450 7700 4450
Wire Wire Line
	7700 4450 7700 3550
Wire Wire Line
	7700 3550 8050 3550
Wire Wire Line
	7500 4550 7750 4550
Wire Wire Line
	7750 4550 7750 3750
Wire Wire Line
	7750 3750 8050 3750
Wire Wire Line
	7500 4650 7800 4650
Wire Wire Line
	7800 4650 7800 4000
Wire Wire Line
	7800 4000 8050 4000
Wire Wire Line
	7500 4750 7850 4750
Wire Wire Line
	7850 4750 7850 4300
Wire Wire Line
	7850 4300 7900 4300
Wire Wire Line
	7900 4300 7900 4200
Wire Wire Line
	7900 4200 8050 4200
Wire Wire Line
	7500 4850 7900 4850
Wire Wire Line
	7900 4850 7900 4400
Wire Wire Line
	7900 4400 8050 4400
Wire Wire Line
	7500 4950 7950 4950
Wire Wire Line
	7950 4950 7950 4600
Wire Wire Line
	7950 4600 8050 4600
Wire Wire Line
	7500 5050 7800 5050
Wire Wire Line
	7800 5050 7800 4800
Wire Wire Line
	7800 4800 8050 4800
Wire Wire Line
	7500 5150 7850 5150
Wire Wire Line
	7850 5150 7850 5000
Wire Wire Line
	7850 5000 8050 5000
Wire Wire Line
	7500 5250 8050 5250
Wire Wire Line
	8050 5250 8050 5200
Wire Wire Line
	7500 5350 8050 5350
Wire Wire Line
	8050 5350 8050 5400
Wire Wire Line
	7500 5450 8000 5450
Wire Wire Line
	8000 5450 8000 5600
Wire Wire Line
	7500 5550 7500 5800
Wire Wire Line
	7500 5800 8000 5800
$Comp
L plot_v1 U17
U 1 1 63D44447
P 7650 6050
F 0 "U17" H 7650 6550 60  0000 C CNN
F 1 "plot_v1" H 7850 6400 60  0000 C CNN
F 2 "" H 7650 6050 60  0000 C CNN
F 3 "" H 7650 6050 60  0000 C CNN
	1    7650 6050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 6250 7650 5800
Connection ~ 7650 5800
$Comp
L plot_v1 U18
U 1 1 63D445D9
P 7800 6000
F 0 "U18" H 7800 6500 60  0000 C CNN
F 1 "plot_v1" H 8000 6350 60  0000 C CNN
F 2 "" H 7800 6000 60  0000 C CNN
F 3 "" H 7800 6000 60  0000 C CNN
	1    7800 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 6200 7800 5450
Connection ~ 7800 5450
$Comp
L plot_v1 U19
U 1 1 63D44792
P 7900 5850
F 0 "U19" H 7900 6350 60  0000 C CNN
F 1 "plot_v1" H 8100 6200 60  0000 C CNN
F 2 "" H 7900 5850 60  0000 C CNN
F 3 "" H 7900 5850 60  0000 C CNN
	1    7900 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 6050 7900 5350
Connection ~ 7900 5350
$Comp
L plot_v1 U21
U 1 1 63D44A05
P 8450 5700
F 0 "U21" H 8450 6200 60  0000 C CNN
F 1 "plot_v1" H 8650 6050 60  0000 C CNN
F 2 "" H 8450 5700 60  0000 C CNN
F 3 "" H 8450 5700 60  0000 C CNN
	1    8450 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 5900 8450 5300
Wire Wire Line
	8450 5300 7950 5300
Wire Wire Line
	7950 5300 7950 5250
Connection ~ 7950 5250
$Comp
L plot_v1 U22
U 1 1 63D44B88
P 8550 5450
F 0 "U22" H 8550 5950 60  0000 C CNN
F 1 "plot_v1" H 8750 5800 60  0000 C CNN
F 2 "" H 8550 5450 60  0000 C CNN
F 3 "" H 8550 5450 60  0000 C CNN
	1    8550 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8550 5650 8550 5100
Wire Wire Line
	8550 5100 8000 5100
Wire Wire Line
	8000 5100 8000 5000
Connection ~ 8000 5000
$Comp
L plot_v1 U20
U 1 1 63D44D29
P 8400 4850
F 0 "U20" H 8400 5350 60  0000 C CNN
F 1 "plot_v1" H 8600 5200 60  0000 C CNN
F 2 "" H 8400 4850 60  0000 C CNN
F 3 "" H 8400 4850 60  0000 C CNN
	1    8400 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	8600 4850 8450 4850
Wire Wire Line
	8450 4850 8450 4900
Wire Wire Line
	8450 4900 8000 4900
Wire Wire Line
	8000 4900 8000 4800
Connection ~ 8000 4800
$Comp
L plot_v1 U27
U 1 1 63D44EC9
P 9000 4600
F 0 "U27" H 9000 5100 60  0000 C CNN
F 1 "plot_v1" H 9200 4950 60  0000 C CNN
F 2 "" H 9000 4600 60  0000 C CNN
F 3 "" H 9000 4600 60  0000 C CNN
	1    9000 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 4600 8350 4600
Wire Wire Line
	8350 4600 8350 4700
Wire Wire Line
	8350 4700 8000 4700
Wire Wire Line
	8000 4700 8000 4600
Connection ~ 8000 4600
$Comp
L plot_v1 U28
U 1 1 63D4508F
P 9050 4250
F 0 "U28" H 9050 4750 60  0000 C CNN
F 1 "plot_v1" H 9250 4600 60  0000 C CNN
F 2 "" H 9050 4250 60  0000 C CNN
F 3 "" H 9050 4250 60  0000 C CNN
	1    9050 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 4250 8450 4250
Wire Wire Line
	8450 4250 8450 4500
Wire Wire Line
	8450 4500 7950 4500
Wire Wire Line
	7950 4500 7950 4400
Connection ~ 7950 4400
$Comp
L plot_v1 U23
U 1 1 63D4521F
P 8800 4150
F 0 "U23" H 8800 4650 60  0000 C CNN
F 1 "plot_v1" H 9000 4500 60  0000 C CNN
F 2 "" H 8800 4150 60  0000 C CNN
F 3 "" H 8800 4150 60  0000 C CNN
	1    8800 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 4150 8350 4150
Wire Wire Line
	8350 4150 8350 4300
Wire Wire Line
	8350 4300 8000 4300
Wire Wire Line
	8000 4300 8000 4200
Connection ~ 8000 4200
$Comp
L plot_v1 U24
U 1 1 63D454C3
P 8850 3900
F 0 "U24" H 8850 4400 60  0000 C CNN
F 1 "plot_v1" H 9050 4250 60  0000 C CNN
F 2 "" H 8850 3900 60  0000 C CNN
F 3 "" H 8850 3900 60  0000 C CNN
	1    8850 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 3900 7950 3900
Wire Wire Line
	7950 3900 7950 4000
Connection ~ 7950 4000
$Comp
L plot_v1 U26
U 1 1 63D45664
P 8950 3650
F 0 "U26" H 8950 4150 60  0000 C CNN
F 1 "plot_v1" H 9150 4000 60  0000 C CNN
F 2 "" H 8950 3650 60  0000 C CNN
F 3 "" H 8950 3650 60  0000 C CNN
	1    8950 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	9150 3650 7950 3650
Wire Wire Line
	7950 3650 7950 3750
Connection ~ 7950 3750
$Comp
L plot_v1 U25
U 1 1 63D457FE
P 8950 2600
F 0 "U25" H 8950 3100 60  0000 C CNN
F 1 "plot_v1" H 9150 2950 60  0000 C CNN
F 2 "" H 8950 2600 60  0000 C CNN
F 3 "" H 8950 2600 60  0000 C CNN
	1    8950 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	9150 2600 8000 2600
Wire Wire Line
	8000 2600 8000 3550
Connection ~ 8000 3550
$Comp
L plot_v1 U29
U 1 1 63D459D8
P 9150 3100
F 0 "U29" H 9150 3600 60  0000 C CNN
F 1 "plot_v1" H 9350 3450 60  0000 C CNN
F 2 "" H 9150 3100 60  0000 C CNN
F 3 "" H 9150 3100 60  0000 C CNN
	1    9150 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 3100 7950 3100
Wire Wire Line
	7950 3100 7950 3400
Connection ~ 7950 3400
$Comp
L plot_v1 U7
U 1 1 63D45B9A
P 6900 3500
F 0 "U7" H 6900 4000 60  0000 C CNN
F 1 "plot_v1" H 7100 3850 60  0000 C CNN
F 2 "" H 6900 3500 60  0000 C CNN
F 3 "" H 6900 3500 60  0000 C CNN
	1    6900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3300 6900 3650
Wire Wire Line
	6900 3650 7850 3650
Connection ~ 7850 3650
$Comp
L plot_v1 U8
U 1 1 63D45D62
P 7200 3550
F 0 "U8" H 7200 4050 60  0000 C CNN
F 1 "plot_v1" H 7400 3900 60  0000 C CNN
F 2 "" H 7200 3550 60  0000 C CNN
F 3 "" H 7200 3550 60  0000 C CNN
	1    7200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3350 7600 3350
Connection ~ 7600 3350
$EndSCHEMATC
