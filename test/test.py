# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_full_adder_all_combinations(dut):
    """Exhaustively test all eight input combinations."""

    dut.ena.value = 1
    dut.clk.value = 0
    dut.rst_n.value = 1
    dut.uio_in.value = 0

    for a in range(2):
        for b in range(2):
            for cin in range(2):
                dut.ui_in.value = a | (b << 1) | (cin << 2)
                await Timer(1, unit="ns")

                expected_sum = a ^ b ^ cin
                expected_cout = (a & b) | (a & cin) | (b & cin)

                actual_sum = int(dut.uo_out.value) & 0x1
                actual_cout = (int(dut.uo_out.value) >> 1) & 0x1

                assert actual_sum == expected_sum, (
                    f"SUM error: A={a}, B={b}, Cin={cin}, "
                    f"expected={expected_sum}, actual={actual_sum}"
                )
                assert actual_cout == expected_cout, (
                    f"COUT error: A={a}, B={b}, Cin={cin}, "
                    f"expected={expected_cout}, actual={actual_cout}"
                )

    assert int(dut.uio_out.value) == 0
    assert int(dut.uio_oe.value) == 0
