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
