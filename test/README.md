Digital Door Lock Testbench

Overview

This testbench verifies the functionality of the Digital Door Lock System implemented in Verilog.

The design checks a 4-bit password entered through the input pins. If the entered password matches "1010", the door unlocks. Otherwise, an error signal is generated.

Test Cases

Correct Password

Input:

- ui_in = 1010

Expected Output:

- unlock = 1
- error = 0

Incorrect Password

Input:

- ui_in = 1111

Expected Output:

- unlock = 0
- error = 1

Running the Simulation

make -B

Author

Rameshwar
