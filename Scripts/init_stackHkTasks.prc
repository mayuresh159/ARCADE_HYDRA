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
