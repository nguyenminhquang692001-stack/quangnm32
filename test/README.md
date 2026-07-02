# Tiny Tapeout SKY Full Adder

A minimal one-bit full adder for learning the Tiny Tapeout flow.
	
## Pin mapping

| Tiny Tapeout pin | Signal |
|---|---|
| `ui_in[0]` | A |
| `ui_in[1]` | B |
| `ui_in[2]` | Cin |
| `uo_out[0]` | Sum |
| `uo_out[1]` | Cout |

## Repository update

Copy these files into a repository created from
`TinyTapeout/ttsky-verilog-template`:

- `src/project.v`
- `src/config.json`
- `test/tb.v`
- `test/test.py`
- `test/Makefile`
- `test/requirements.txt`
- `docs/info.md`
- `info.yaml`

Keep the template's `.github/workflows` directory unchanged.

## Logic equations

```text
Sum  = A XOR B XOR Cin
Cout = AB + A·Cin + B·Cin
```

