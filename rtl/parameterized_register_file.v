module register_file #(
  parameter WIDTH=8,
  parameter DEPTH=8,
  parameter ADDR_WIDTH = 3)(
  input clk,
  input we,
  input [ADDR_WIDTH-1:0]waddr,
  input [WIDTH-1:0]wdata,
  input [ADDR_WIDTH-1:0]raddr1,
  input [ADDR_WIDTH-1:0]raddr2,
  output reg [WIDTH-1:0]rdata1,
  output reg [WIDTH-1:0]rdata2);
  reg[WIDTH-1:0] memory[0:DEPTH-1];
  always @(posedge clk) begin
    if (we)
      memory[waddr]<=wdata;
  end
  always @(*) begin
    rdata1=memory[raddr1];
    rdata2=memory[raddr2];
  end
endmodule
           
