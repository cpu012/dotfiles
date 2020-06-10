#!/usr/bin/env python3
import pyfirmata 

b = pyfirmata.Arduino('/dev/ACM0')

while True:
    b.digital[13].write(1)
    time.sleep(1)
    b.digital[13].write(0)
    time.sleep(1)