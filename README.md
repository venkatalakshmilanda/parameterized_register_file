# Parameterized Register File in Verilog

A parameterized Register File designed in **Verilog HDL** with configurable data width and memory depth. The design supports **one synchronous write port** and **two asynchronous read ports**, making it suitable for digital processors, embedded systems, and FPGA/ASIC designs.

---

## Features

- Parameterized data width (`WIDTH`)
- Parameterized memory depth (`DEPTH`)
- Configurable address width (`ADDR_WIDTH`)
- Single synchronous write port
- Dual asynchronous read ports
- Modular and reusable RTL design
- Functional verification using a custom Verilog testbench

---

## Parameters

| Parameter | Description | Default |
|-----------|-------------|:-------:|
| `WIDTH` | Data width | 8 |
| `DEPTH` | Number of registers | 8 |
| `ADDR_WIDTH` | Address width | 3 |

---

## Input/Output Ports

### Inputs

| Signal | Description |
|--------|-------------|
| `clk` | System clock |
| `we` | Write enable |
| `waddr` | Write address |
| `wdata` | Write data |
| `raddr1` | Read address 1 |
| `raddr2` | Read address 2 |

### Outputs

| Signal | Description |
|--------|-------------|
| `rdata1` | Read data from Port 1 |
| `rdata2` | Read data from Port 2 |

---

## Functional Description

### Write Operation
- Data is written on the **positive edge** of the clock.
- Write operation occurs only when **Write Enable (`we`)** is asserted.

### Read Operation
- Supports **two independent read ports**.
- Read operation is **asynchronous (combinational)**.
- Output updates immediately when the read address changes.

---

## Verification

The design was verified using a dedicated Verilog testbench covering the following scenarios:

- Write `0xAA` to Register 2
- Read Register 2
- Write `0x55` to Register 5
- Simultaneous dual-port read
- Overwrite Register 2 with `0xFF`
- Verify Write Enable functionality
- Read previously stored values

All test cases passed successfully.

---

## Project Structure

```
Parameterized-Register-File-Verilog/
│
├── rtl/
│   └── register_file.v
│
├── testbench/
│   └── tb_register_file.v
│
├── waveforms/
│   └── register_file_waveform.png
│
└── README.md
```

---

## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave / GTKWave

---

## Applications

- Processor Register Files
- Embedded Systems
- FPGA Design
- ASIC RTL Design
- Digital Signal Processing
- VLSI Digital Systems

---

## Author

**Venkata Lakshmi**  
Electronics and Communication Engineering (ECE)  
Aspiring RTL Design Engineer | Digital VLSI Enthusiast
