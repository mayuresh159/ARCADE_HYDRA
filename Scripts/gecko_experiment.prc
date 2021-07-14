; Sequence file to capture an image with Gecko and transfer the image data to raw DataGeckofile
; Outline:
;   1. Disable GeckoHkTask
;   2. Gecko transceviers on - SetGeckoTREN
;   3. Gecko power on - SetGeckoPSEN
;   4. Gecko_CaptureImageTask - Define a command using 08 opcode
;   5. Gecko_ReadImageTask - Define a command using 08 opcode
;   6. FS set flags for load task - data type (09) and slot number 0 - 14  slots for Gecko
;   7. Disable packet reader and enable raw reader
;   8. Run the FS load task - RuneMMCloadTask
;   9. Disable raw reader and enable packet reader

; Normalize the system to avoid clash with Gecko Hk task
; Note that this task also turns Gecko off
call stop_GeckoexptHk

; Turn on Gecko transceiver
SetGeckoTREN

; Power on Gecko
SetGeckoPSEN

; Wait for power to stabilize
; Check for Gecko voltage and current in this time
wait 5000

; Gecko capture image task - this captures an image into the internal buffer of Gecko
RunCaptureImageTask

; Gecko read image task - transfers the image from gecko internal buffer to the eMMC
RunReadImageTask

; Wait for about 5 minutes before the image has been completely transferred to eMMC
wait 300000

; FS set flags for load eMMC task for Gecko data transfer
SetLoadEmmcFlagsForGeckoExp FsLoadSlotNo 0

; Disable the rest of the debug packets, ARCADEHeaderReader and CCSDSDecoder
call stop_stackHkTasks
stop_reader ARCADEHeaderReader

; Start Gecko data reader & decoder
start_reader GeckoDataReader
set_dec_output GeckoDataDecoder GeckoDatafile ALL enable

; Run the load eMMC Task
RunEmmcLoadTask

; Wait for UART transfer to complete
; Monitor in byte summary
pause

; Stop the Gecko data reader & decoder
set_dec_output GeckoDataDecoder GeckoDatafile ALL disable
stop_reader GeckoDataReader

; Start ARCADEHeaderReader & restart the stackHk readers
start_reader ARCADEHeaderReader
call init_stackHkTasks
