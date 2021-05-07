; Disable Gecko packet logging
set_dec_output CCSDSDecoder Geckologfile 0x28 disable

;  Stop Gecko hk task in CDH
StopGeckoHkTask

; Turn off power to Gecko
ClearGeckoPSEN
