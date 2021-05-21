; Disable debug streams before disabling the decoders
DisableDebugFlagsAll

; Start logging basic frame types in respective log files
set_dec_output CCSDSDecoder CDHlogfile 0x26 disable
set_dec_output CCSDSDecoder EPSlogfile 0x21 disable
set_dec_output CCSDSDecoder BCUlogfile 0x27 disable
set_dec_output CCSDSDecoder ProcComplogfile 0x22 disable
