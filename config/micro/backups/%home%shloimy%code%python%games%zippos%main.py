#!/usr/bin/env python3
import pyfirmata, time

b = pyfirmata.Arduino('/dev/ttyACM0')
it = pyfirmata.util.Iterator(b)

dinput = b.get_pin('d:11:i')

while True:
    print(dinput.read())
    time.sleep