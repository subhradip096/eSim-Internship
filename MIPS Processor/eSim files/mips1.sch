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
LIBS:mips1-cache
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
L adc_bridge_1 U3
U 1 1 64003430
P 3000 2300
F 0 "U3" H 3000 2300 60  0000 C CNN
F 1 "adc_bridge_1" H 3000 2450 60  0000 C CNN
F 2 "" H 3000 2300 60  0000 C CNN
F 3 "" H 3000 2300 60  0000 C CNN
	1    3000 2300
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_1 U4
U 1 1 64003497
P 6300 3800
F 0 "U4" H 6300 3800 60  0000 C CNN
F 1 "dac_bridge_1" H 6300 3950 60  0000 C CNN
F 2 "" H 6300 3800 60  0000 C CNN
F 3 "" H 6300 3800 60  0000 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
$Comp
L pulse v1
U 1 1 640034E6
P 2400 2950
F 0 "v1" H 2200 3050 60  0000 C CNN
F 1 "pulse" H 2200 2900 60  0000 C CNN
F 2 "R1" H 2100 2950 60  0000 C CNN
F 3 "" H 2400 2950 60  0000 C CNN
	1    2400 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 640035E6
P 2400 3600
F 0 "#PWR1" H 2400 3350 50  0001 C CNN
F 1 "GND" H 2400 3450 50  0000 C CNN
F 2 "" H 2400 3600 50  0001 C CNN
F 3 "" H 2400 3600 50  0001 C CNN
	1    2400 3600
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U5
U 1 1 640036FF
P 6850 3700
F 0 "U5" H 6850 4200 60  0000 C CNN
F 1 "plot_v1" H 7050 4050 60  0000 C CNN
F 2 "" H 6850 3700 60  0000 C CNN
F 3 "" H 6850 3700 60  0000 C CNN
	1    6850 3700
	1    0    0    -1  
$EndComp
Text GLabel 7150 3750 2    60   Input ~ 0
Out
$Comp
L plot_v1 U2
U 1 1 6400394F
P 2400 2250
F 0 "U2" H 2400 2750 60  0000 C CNN
F 1 "plot_v1" H 2600 2600 60  0000 C CNN
F 2 "" H 2400 2250 60  0000 C CNN
F 3 "" H 2400 2250 60  0000 C CNN
	1    2400 2250
	1    0    0    -1  
$EndComp
Text GLabel 2100 2250 0    60   Input ~ 0
Clk
$Comp
L dac_bridge_4 U6
U 1 1 64003A53
P 6200 4300
F 0 "U6" H 6200 4300 60  0000 C CNN
F 1 "dac_bridge_4" H 6200 4600 60  0000 C CNN
F 2 "" H 6200 4300 60  0000 C CNN
F 3 "" H 6200 4300 60  0000 C CNN
	1    6200 4300
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U8
U 1 1 64003B1D
P 6900 4250
F 0 "U8" H 6900 4750 60  0000 C CNN
F 1 "plot_v1" H 7100 4600 60  0000 C CNN
F 2 "" H 6900 4250 60  0000 C CNN
F 3 "" H 6900 4250 60  0000 C CNN
	1    6900 4250
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U10
U 1 1 64003B94
P 7550 4350
F 0 "U10" H 7550 4850 60  0000 C CNN
F 1 "plot_v1" H 7750 4700 60  0000 C CNN
F 2 "" H 7550 4350 60  0000 C CNN
F 3 "" H 7550 4350 60  0000 C CNN
	1    7550 4350
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U9
U 1 1 64003BD7
P 7250 4600
F 0 "U9" H 7250 5100 60  0000 C CNN
F 1 "plot_v1" H 7450 4950 60  0000 C CNN
F 2 "" H 7250 4600 60  0000 C CNN
F 3 "" H 7250 4600 60  0000 C CNN
	1    7250 4600
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U7
U 1 1 64003C24
P 6900 4200
F 0 "U7" H 6900 4700 60  0000 C CNN
F 1 "plot_v1" H 7100 4550 60  0000 C CNN
F 2 "" H 6900 4200 60  0000 C CNN
F 3 "" H 6900 4200 60  0000 C CNN
	1    6900 4200
	-1   0    0    1   
$EndComp
Text GLabel 7200 4650 3    60   Input ~ 0
R0
Text GLabel 7450 4450 3    60   Input ~ 0
R1
Text GLabel 7750 4200 3    60   Input ~ 0
R2
Text GLabel 8100 3900 1    60   Input ~ 0
R3
$Comp
L dac_bridge_7 U11
U 1 1 6401D80B
P 5900 2300
F 0 "U11" H 5900 2300 60  0000 C CNN
F 1 "dac_bridge_7" H 5900 2450 60  0000 C CNN
F 2 "" H 5900 2300 60  0000 C CNN
F 3 "" H 5900 2300 60  0000 C CNN
	1    5900 2300
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_8 U12
U 1 1 6401D872
P 5900 3000
F 0 "U12" H 5900 3000 60  0000 C CNN
F 1 "dac_bridge_8" H 5900 3150 60  0000 C CNN
F 2 "" H 5900 3000 60  0000 C CNN
F 3 "" H 5900 3000 60  0000 C CNN
	1    5900 3000
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U13
U 1 1 6401DDE5
P 6600 2350
F 0 "U13" H 6600 2850 60  0000 C CNN
F 1 "plot_v1" H 6800 2700 60  0000 C CNN
F 2 "" H 6600 2350 60  0000 C CNN
F 3 "" H 6600 2350 60  0000 C CNN
	1    6600 2350
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U15
U 1 1 6401DE52
P 6800 2450
F 0 "U15" H 6800 2950 60  0000 C CNN
F 1 "plot_v1" H 7000 2800 60  0000 C CNN
F 2 "" H 6800 2450 60  0000 C CNN
F 3 "" H 6800 2450 60  0000 C CNN
	1    6800 2450
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U17
U 1 1 6401DEAD
P 6950 2600
F 0 "U17" H 6950 3100 60  0000 C CNN
F 1 "plot_v1" H 7150 2950 60  0000 C CNN
F 2 "" H 6950 2600 60  0000 C CNN
F 3 "" H 6950 2600 60  0000 C CNN
	1    6950 2600
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U19
U 1 1 6401DF14
P 7100 2700
F 0 "U19" H 7100 3200 60  0000 C CNN
F 1 "plot_v1" H 7300 3050 60  0000 C CNN
F 2 "" H 7100 2700 60  0000 C CNN
F 3 "" H 7100 2700 60  0000 C CNN
	1    7100 2700
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U14
U 1 1 6401DF5D
P 6650 2850
F 0 "U14" H 6650 3350 60  0000 C CNN
F 1 "plot_v1" H 6850 3200 60  0000 C CNN
F 2 "" H 6650 2850 60  0000 C CNN
F 3 "" H 6650 2850 60  0000 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U16
U 1 1 6401DFB2
P 6800 2950
F 0 "U16" H 6800 3450 60  0000 C CNN
F 1 "plot_v1" H 7000 3300 60  0000 C CNN
F 2 "" H 6800 2950 60  0000 C CNN
F 3 "" H 6800 2950 60  0000 C CNN
	1    6800 2950
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U18
U 1 1 6401E015
P 7000 3050
F 0 "U18" H 7000 3550 60  0000 C CNN
F 1 "plot_v1" H 7200 3400 60  0000 C CNN
F 2 "" H 7000 3050 60  0000 C CNN
F 3 "" H 7000 3050 60  0000 C CNN
	1    7000 3050
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U20
U 1 1 6401E287
P 7100 3150
F 0 "U20" H 7100 3650 60  0000 C CNN
F 1 "plot_v1" H 7300 3500 60  0000 C CNN
F 2 "" H 7100 3150 60  0000 C CNN
F 3 "" H 7100 3150 60  0000 C CNN
	1    7100 3150
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U22
U 1 1 6401E2DC
P 7250 3250
F 0 "U22" H 7250 3750 60  0000 C CNN
F 1 "plot_v1" H 7450 3600 60  0000 C CNN
F 2 "" H 7250 3250 60  0000 C CNN
F 3 "" H 7250 3250 60  0000 C CNN
	1    7250 3250
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U24
U 1 1 6401E32F
P 7350 3350
F 0 "U24" H 7350 3850 60  0000 C CNN
F 1 "plot_v1" H 7550 3700 60  0000 C CNN
F 2 "" H 7350 3350 60  0000 C CNN
F 3 "" H 7350 3350 60  0000 C CNN
	1    7350 3350
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U26
U 1 1 6401E37E
P 7450 3450
F 0 "U26" H 7450 3950 60  0000 C CNN
F 1 "plot_v1" H 7650 3800 60  0000 C CNN
F 2 "" H 7450 3450 60  0000 C CNN
F 3 "" H 7450 3450 60  0000 C CNN
	1    7450 3450
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U21
U 1 1 6401E3D7
P 7150 3100
F 0 "U21" H 7150 3600 60  0000 C CNN
F 1 "plot_v1" H 7350 3450 60  0000 C CNN
F 2 "" H 7150 3100 60  0000 C CNN
F 3 "" H 7150 3100 60  0000 C CNN
	1    7150 3100
	-1   0    0    1   
$EndComp
$Comp
L plot_v1 U23
U 1 1 6401E45A
P 7300 3250
F 0 "U23" H 7300 3750 60  0000 C CNN
F 1 "plot_v1" H 7500 3600 60  0000 C CNN
F 2 "" H 7300 3250 60  0000 C CNN
F 3 "" H 7300 3250 60  0000 C CNN
	1    7300 3250
	-1   0    0    1   
$EndComp
$Comp
L plot_v1 U25
U 1 1 6401E4C9
P 7450 3250
F 0 "U25" H 7450 3750 60  0000 C CNN
F 1 "plot_v1" H 7650 3600 60  0000 C CNN
F 2 "" H 7450 3250 60  0000 C CNN
F 3 "" H 7450 3250 60  0000 C CNN
	1    7450 3250
	-1   0    0    1   
$EndComp
$Comp
L plot_v1 U27
U 1 1 6401E53C
P 7600 3400
F 0 "U27" H 7600 3900 60  0000 C CNN
F 1 "plot_v1" H 7800 3750 60  0000 C CNN
F 2 "" H 7600 3400 60  0000 C CNN
F 3 "" H 7600 3400 60  0000 C CNN
	1    7600 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 2250 3850 2250
Wire Wire Line
	5700 3750 5250 3750
Wire Wire Line
	2400 2050 2400 2500
Wire Wire Line
	2400 3600 2400 3400
Wire Wire Line
	6850 3750 6850 3500
Wire Wire Line
	7150 3750 6850 3750
Connection ~ 2400 2250
Wire Wire Line
	2100 2250 2400 2250
Wire Wire Line
	5250 3850 5650 3850
Wire Wire Line
	5650 3850 5650 4100
Wire Wire Line
	5250 3950 5600 3950
Wire Wire Line
	5600 3950 5600 4200
Wire Wire Line
	5600 4200 5650 4200
Wire Wire Line
	5250 4050 5550 4050
Wire Wire Line
	5550 4050 5550 4300
Wire Wire Line
	5550 4300 5650 4300
Wire Wire Line
	5250 4150 5250 4400
Wire Wire Line
	5250 4400 5650 4400
Wire Wire Line
	6750 4100 6900 4100
Wire Wire Line
	6900 4050 6900 4150
Wire Wire Line
	6750 4400 7050 4400
Wire Wire Line
	6750 4300 7150 4300
Wire Wire Line
	7150 4300 7150 4400
Wire Wire Line
	7150 4400 7450 4400
Wire Wire Line
	6750 4200 7750 4200
Wire Wire Line
	7550 4200 7550 4150
Wire Wire Line
	8100 3900 8100 4150
Wire Wire Line
	8100 4150 6900 4150
Connection ~ 6900 4100
Connection ~ 7550 4200
Wire Wire Line
	7450 4400 7450 4450
Connection ~ 7250 4400
Wire Wire Line
	7050 4400 7050 4650
Wire Wire Line
	7050 4650 7200 4650
Connection ~ 6900 4400
Wire Wire Line
	5250 3650 5300 3650
Wire Wire Line
	5250 3550 5300 3550
Wire Wire Line
	5300 3450 5250 3450
Wire Wire Line
	5300 3350 5250 3350
Wire Wire Line
	5300 3250 5250 3250
Wire Wire Line
	5300 3150 5250 3150
Wire Wire Line
	5300 3050 5250 3050
Wire Wire Line
	5300 2950 5250 2950
Wire Wire Line
	5300 2850 5250 2850
Wire Wire Line
	5250 2750 5300 2750
Wire Wire Line
	5250 2650 5300 2650
Wire Wire Line
	5250 2550 5300 2550
Wire Wire Line
	5250 2450 5300 2450
Wire Wire Line
	5250 2350 5300 2350
Wire Wire Line
	5250 2250 5300 2250
Wire Wire Line
	6450 2250 6600 2250
Wire Wire Line
	6600 2250 6600 2150
Wire Wire Line
	6450 2350 6800 2350
Wire Wire Line
	6800 2350 6800 2250
Wire Wire Line
	6450 2450 6950 2450
Wire Wire Line
	6950 2450 6950 2400
Wire Wire Line
	6450 2550 7300 2550
Wire Wire Line
	7100 2550 7100 2500
Wire Wire Line
	6450 2650 7750 2650
Wire Wire Line
	6450 2750 7700 2750
Wire Wire Line
	6450 2850 7600 2850
Wire Wire Line
	6450 2950 7900 2950
Wire Wire Line
	6450 3050 7950 3050
Wire Wire Line
	6450 3150 7750 3150
Wire Wire Line
	6450 3250 7700 3250
Wire Wire Line
	6450 3450 7300 3450
Wire Wire Line
	6450 3550 7500 3550
Wire Wire Line
	7500 3450 7500 3600
Wire Wire Line
	7500 3450 7450 3450
Wire Wire Line
	7800 3650 6450 3650
Wire Wire Line
	7800 3350 7800 3650
Text GLabel 6400 1950 0    60   Input ~ 0
O15
Wire Wire Line
	6400 1950 6500 1950
Wire Wire Line
	6500 1950 6500 2150
Wire Wire Line
	6500 2150 6600 2150
Text GLabel 6950 1850 1    60   Input ~ 0
O14
Wire Wire Line
	6950 1850 6700 1850
Wire Wire Line
	6700 1850 6700 2250
Wire Wire Line
	6700 2250 6800 2250
Text GLabel 7100 1950 1    60   Input ~ 0
O13
Text GLabel 7300 2550 2    60   Input ~ 0
O12
Text GLabel 7750 2600 2    60   Input ~ 0
o11
Text GLabel 7700 2200 2    60   Input ~ 0
o10
Text GLabel 7750 2400 2    60   Input ~ 0
o9
Wire Wire Line
	6900 2450 6900 1950
Wire Wire Line
	6900 1950 7100 1950
Connection ~ 6900 2450
Connection ~ 7100 2550
Wire Wire Line
	7750 2650 7750 2600
Connection ~ 6650 2650
Wire Wire Line
	7700 2750 7700 2200
Connection ~ 6800 2750
Wire Wire Line
	7600 2850 7600 2400
Wire Wire Line
	7600 2400 7750 2400
Connection ~ 7000 2850
Text GLabel 7900 2900 2    60   Input ~ 0
o8
Wire Wire Line
	7900 2950 7900 2900
Connection ~ 7100 2950
Text GLabel 7950 3050 2    60   Input ~ 0
o7
Connection ~ 7250 3050
Text GLabel 7750 2800 2    60   Input ~ 0
O6
Wire Wire Line
	7750 3150 7750 2800
Connection ~ 7350 3150
Text GLabel 7700 3250 2    60   Input ~ 0
o5
Connection ~ 7450 3250
Wire Wire Line
	6450 3300 7250 3300
Wire Wire Line
	6450 3300 6450 3350
Text GLabel 7550 3350 2    60   Input ~ 0
o4
Wire Wire Line
	7550 3350 7250 3350
Wire Wire Line
	7250 3350 7250 3300
Connection ~ 7150 3300
Text GLabel 7950 3200 2    60   Input ~ 0
o3
Wire Wire Line
	7950 3200 7950 3550
Wire Wire Line
	7950 3550 7550 3550
Wire Wire Line
	7550 3550 7550 3400
Wire Wire Line
	7550 3400 7300 3400
Wire Wire Line
	7300 3400 7300 3450
Text GLabel 8100 3550 2    60   Input ~ 0
o2
Wire Wire Line
	7500 3600 8100 3600
Wire Wire Line
	8100 3600 8100 3550
Connection ~ 7500 3550
Text GLabel 8450 3350 2    60   Input ~ 0
o1
Wire Wire Line
	7800 3350 8450 3350
Connection ~ 7800 3400
$Comp
L connector1 U1
U 1 1 64071291
P 1700 4150
F 0 "U1" H 4550 5950 60  0000 C CNN
F 1 "connector1" H 4550 6150 60  0000 C CNN
F 2 "" H 4550 6100 60  0000 C CNN
F 3 "" H 4550 6100 60  0000 C CNN
	1    1700 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
