; Disable Atmolite packet logging
set_dec_output CCSDSDecoder Atmolitelogfile 0x29 disable

;  Stop Atmolite hk task in CDH
StopAtmHkTask

; Turn off power to Gecko
ClearATMLTPSEN
