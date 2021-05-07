; Disable thruster packet logging
set_dec_output CCSDSDecoder Thrusterlogfile 0x23 disable

;  Stop thruster hk task in CDH
StopThrusterHkTask

; Turn off power to thruster
ClearTHRPSEN
