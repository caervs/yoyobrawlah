echo foo | nc -l -p 1234 &
sleep 1
echo foo | nc localhost 1234 &
sleep 2
