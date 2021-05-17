; ARCADE EPS telemetry check
; Purpose: Checks the EPS tlm for correct values
; Outline:
;     During satellite assembly check the EPS Tlm before integrating things further
; Tlm Check:
; Check if regulator outputs are greater than (setVolt - 2)V after enabling each of them, assuming 2V tolerance for the regulator outputs
; ISSUES:
;
; MODIFICATION HISTORY:
;    2021-05-14: Mayuresh Sarpotdar - Created

declare successCnt  dn16l
declare failCnt     dn16l

set successCnt = 0
set failCnt = 0

call init_stackHkTasks

; Check power supply regulators
REG:
echo Starting voltage regulator tests

; Check CDH regulator voltage
if EPSHk_CDHVolt >= 2
  echo CDH Regulator nominal
  set successCnt = successCnt + 1
else
  echo CDH Regulator failure
  set failCnt = failCnt + 1
endif

; Check UHF regulator voltage
if EPSHk_SQUHFVolt >= 5
  echo UHF Regulator nominal
  set successCnt = successCnt + 1
else
  echo UHF Regulator failure
  set failCnt = failCnt + 1
endif

; Enable Atmolite power supply
SetATMLTPSEN
wait 5000
if EPSHk_ATMVolt >= 10
  echo Atmolite Regulator nominal
  set successCnt = successCnt + 1
else
  echo Atmolite Regulator failure
  set failCnt = failCnt + 1
endif
ClearATMLTPSEN

; Enable CIP power supply
SetCIPPSEN
wait 5000
if EPSHk_CIPVolt >= 10
  echo CIP Regulator nominal
  set successCnt = successCnt + 1
else
  echo CIP Regulator failure
  set failCnt = failCnt + 1
endif
ClearCIPPSEN

; Enable Gecko power supply
SetGeckoPSEN
wait 5000
if EPSHk_GeckoVolt >= 3
  echo Gecko Regulator nominal
  set successCnt = successCnt + 1
else
  echo Gecko Regulator failure
  set failCnt = failCnt + 1
endif
ClearGeckoPSEN

; Enable ADCS power supply
SetADCSPSEN
wait 5000
if EPSHk_ADCSVolt >= 10
  echo ADCS Regulator nominal
  set successCnt = successCnt + 1
else
  echo ADCS Regulator failure
  set failCnt = failCnt + 1
endif

if EPSHk_GPS3v3Volt >= 2
  echo ADCS GPS 3v3 Regulator nominal
  set successCnt = successCnt + 1
else
  echo ADCS GPS 3v3 Regulator failure
  set failCnt = failCnt + 1
endif

if EPSHk_GPS12v1Volt >= 10
  echo ADCS GPS 12v_1 Regulator nominal
  set successCnt = successCnt + 1
else
  echo ADCS GPS 12v_1 Regulator failure
  set failCnt = failCnt + 1
endif

if EPSHk_GPS12v2Volt >= 10
  echo ADCS GPS 12v_2 Regulator nominal
  set successCnt = successCnt + 1
else
  echo ADCS GPS 12v_2 Regulator failure
  set failCnt = failCnt + 1
endif
ClearADCSPSEN

; Enable XBand power supply
SetXBandPSEN
wait 5000
if EPSHk_XBandVolt >= 10
  echo XBand Regulator nominal
  set successCnt = successCnt + 1
else
  echo XBand Regulator failure
  set failCnt = failCnt + 1
endif
ClearXBandPSEN

; Enable Thruster power supply
; Thruster has different success criterion because thrload parameter cannot be read due to problem on I2C
SetTHRPSEN
wait 5000
if EPSHk_ThrusterPG == 1
  echo Thruster Regulator nominal
  set successCnt = successCnt + 1
else
  echo Thruster Regulator failure
  set failCnt = failCnt + 1
endif
ClearTHRPSEN


DEP:
echo Starting deployment switch tests

; Check deployment switches
; Enable SP1 deployment
SetDEPSP1
wait 5000
if BCUHk_SP1DepVolt >= 6
  echo SP1 deployment nominal
  set successCnt = successCnt + 1
else
  echo SP1 deployment failure
  set failCnt = failCnt + 1
endif
ClearDEPSP1

; Enable SP2 deployment
SetDEPSP2
wait 5000
if BCUHk_SP2DepVolt >= 6
  echo SP2 deployment nominal
  set successCnt = successCnt + 1
else
  echo SP2 deployment failure
  set failCnt = failCnt + 1
endif
ClearDEPSP2

; Enable SP3 deployment
SetDEPSP3
wait 5000
if BCUHk_SP3DepVolt >= 6
  echo SP3 deployment nominal
  set successCnt = successCnt + 1
else
  echo SP3 deployment failure
  set failCnt = failCnt + 1
endif
ClearDEPSP3

; Enable Antenna deployment
SetANTDEP
wait 5000
if BCUHk_AntDepVolt >= 6
  echo Antenna deployment nominal
  set successCnt = successCnt + 1
else
  echo Antenna deployment failure
  set failCnt = failCnt + 1
endif
ClearANTDEP



HEATER:
echo Starting battery heater tests

; Check battery heaters
; Enable Battery 1 heater
SetBat1Htr
wait 5000
if BCUHk_Bat1HtrVolt >= 6
  echo Battery 1 heater nominal
  set successCnt = successCnt + 1
else
  echo Battery 1 heater failure
  set failCnt = failCnt + 1
endif
ClearBat1Htr

; Enable Battery 2 heater
SetBat2Htr
wait 5000
if BCUHk_Bat2HtrVolt >= 6
  echo Battery 2 heater nominal
  set successCnt = successCnt + 1
else
  echo Battery 2 heater failure
  set failCnt = failCnt + 1
endif
ClearBat2Htr

; Stop data acquisition to avoid creation of new files in common folder
call stop_stackHkTasks

END_CHECK:
echo See above for any telemetry check error messages
echo COMPLETED EPS Check with Successes = $successCnt and Failures = $failCnt
pause
