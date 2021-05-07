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
