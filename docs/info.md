# 3-input Full Adder

## How it works

This design implements a one-bit full adder.

Inputs:

- `ui_in[0]`: A
- `ui_in[1]`: B
- `ui_in[2]`: Cin

Outputs:

- `uo_out[0]`: Sum
- `uo_out[1]`: Cout

The Boolean equations are:

```text
Sum  = A XOR B XOR Cin
Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)
```

## Truth table

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## How to test

Set A, B, and Cin on `ui_in[2:0]`, then read Sum and Cout from
`uo_out[1:0]`. The design is combinational and does not require a clock.

