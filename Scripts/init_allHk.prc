; Enable power supplies and interfaces for EPS I2C channels
SetPSENTREN
SetEPSI2C1EN
SetEPSI2C2EN
SetEPSI2C3EN

; Run required housekeeping tasks in the CDH
RunEpsHkTask
RunBCUHkTask
RunProcCompRoutineTask

; Start streaming data frames from Debug UART
EnableDebugFlagsAll

; Start logging basic frame types in respective log files
set_dec_output CCSDSDecoder CDHlogfile 0x26 enable
set_dec_output CCSDSDecoder EPSlogfile 0x21 enable
set_dec_output CCSDSDecoder BCUlogfile 0x27 enable
set_dec_output CCSDSDecoder ProcComplogfile 0x22 enable



; Init thruster Hk
; Enable thruster power supply
SetTHRPSEN

; Wait for the power to stabilise
wait 5000

; Start interface
SetThrusterI2c

; Run thruster housekeeping task in CDH
RunThrusterHkTask

; Enable decoder output to thruster log file
set_dec_output CCSDSDecoder Thrusterlogfile 0x23 enable



; Init SQ UHF Hk
; Start UHF Hk task in CDH
RunUHFHkTask
; Start logging UHF log file
set_dec_output CCSDSDecoder SQUHFlogfile 0x24 enable




; Init XBand Hk
; Power on XBand and turn on interface transceiver
SetXBandPSEN
SetXBandTREN

; Wait for power to stabilise
wait 5000

; Start XBand Hk task in CDH
RunXBandHkTask

; Start logging XBand log file
set_dec_output CCSDSDecoder XBandlogfile 0x25 enable





; Init Gecko Hk
; Enable Gecko power supply
SetGeckoPSEN

; Wait for the power to stabilise
wait 5000

; Start interface
SetGeckoTREN

; Run Gecko housekeeping task in CDH
RunGeckoHkTask

; Enable decoder output to thruster log file
set_dec_output CCSDSDecoder Geckologfile 0x28 enable





; Init Atmolite Hk
; Enable Atmolite power supply
SetATMLTPSEN

; Wait for the power to stabilise and Atmolite to boot up
wait 40000

; Start interface
SetATMLTTREN

; Run Atmolite housekeeping task in CDH
RunAtmHkTask

; Enable decoder output to thruster log file
set_dec_output CCSDSDecoder Atmolitelogfile 0x29 enable
