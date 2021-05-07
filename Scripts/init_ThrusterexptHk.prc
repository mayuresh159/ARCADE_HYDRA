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
