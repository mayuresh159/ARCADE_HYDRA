echo Running startup script

echo Loading ARCADE Serial Receiver
show_page AllHK

call init_stackHKTasks

wait 5000

call init_allHk

wait 10000

echo Start-up for KYUTECH Shock Test Done
