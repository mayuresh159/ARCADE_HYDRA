; Script to turn off all running tasks and power supplies and stop the debugging task

; Disable thruster packet logging
set_dec_output CCSDSDecoder Thrusterlogfile 0x23 disable
;  Stop thruster hk task in CDH
StopThrusterHkTask
; Turn off power to thruster
ClearTHRPSEN


; Disable data logging into file
set_dec_output CCSDSDecoder SQUHFlogfile 0x24 disable
; Stop UHF Hk task
StopUHFHkTask


; Disable XBand data logging into file
set_dec_output CCSDSDecoder XBandlogfile 0x25 disable
; Stop XBand Hk task
StopXBandHkTask


; Disable Gecko packet logging
set_dec_output CCSDSDecoder Geckologfile 0x28 disable
;  Stop Gecko hk task in CDH
StopGeckoHkTask
; Turn off power to Gecko
ClearGeckoPSEN


; Disable Atmolite packet logging
set_dec_output CCSDSDecoder Atmolitelogfile 0x29 disable
;  Stop Atmolite hk task in CDH
StopAtmHkTask
; Turn off power to Gecko
ClearATMLTPSEN
