# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_door_lock(dut):

    dut._log.info("Starting Door Lock Test")

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0

    await Timer(10, units="ns")

    # Correct Password = 1010
    dut.ui_in.value = 0b00001010
    await Timer(10, units="ns")

    assert dut.uo_out.value == 1, "Door should unlock"

    # Wrong Password = 1111
    dut.ui_in.value = 0b00001111
    await Timer(10, units="ns")

    assert dut.uo_out.value == 0, "Door should remain locked"

    dut._log.info("Door Lock Test Passed")
