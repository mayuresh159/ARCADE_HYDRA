; Power on XBand and turn on interface transceiver
SetXBandPSEN
SetXBandTREN

; Wait for power to stabilise
wait 5000

; Start XBand Hk task in CDH
RunXBandHkTask

; Start logging XBand log file
set_dec_output CCSDSDecoder XBandlogfile 0x25 enable
