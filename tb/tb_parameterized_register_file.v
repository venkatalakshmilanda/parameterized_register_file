module tb;
parameter WIDTH = 8;
parameter DEPTH = 8;
parameter ADDR_WIDTH = 3;
  reg clk;
  reg we;
  reg [ADDR_WIDTH-1:0]waddr;
  reg [WIDTH-1:0]wdata;
  reg [ADDR_WIDTH-1:0]raddr1;
  reg [ADDR_WIDTH-1:0]raddr2;
  wire [WIDTH-1:0]rdata1;
  wire [WIDTH-1:0]rdata2;
  register_file #(.WIDTH(WIDTH),
                  .DEPTH(DEPTH),
                  .ADDR_WIDTH(ADDR_WIDTH)
                 ) 				     
  				dut(.clk(clk),
                    .we(we),
                    .waddr(waddr), 
                    .wdata(wdata),
                    .raddr1(raddr1),
                    .raddr2(raddr2),
                    .rdata1(rdata1),
                    .rdata2(rdata2)
                    );
  always #5 clk=~clk;
  initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0,tb);
    clk=0;
    we=0;
    waddr=0;wdata=0;
     //  Test Case 1
    // Write AA to Register 2
    we = 1;
    waddr = 3'b010;
    wdata = 8'hAA;
    @(posedge clk);

    // Read Register 2
    raddr1 = 3'b010;
    raddr2 = 3'b000;
    #10;

    //  Test Case 2 
    // Write 55 to Register 5
    waddr = 3'b101;
    wdata = 8'h55;
    @(posedge clk);

    // Read Register 5 and Register 2 simultaneously
    raddr1 = 3'b101;
    raddr2 = 3'b010;
    #10;
    // Test Case 3 
    // Overwrite Register 2 with FF
    waddr = 3'b010;
    wdata = 8'hFF;
    @(posedge clk);
	//Read Register 2
    raddr1 = 3'b010;
    #10;

    // Test Case 4 ----------------
    // Disable Write Enable
    we = 0;
    waddr = 3'b001;
    wdata = 8'h11;
    @(posedge clk);

    // Register 1 should remain unchanged
    raddr1 = 3'b001;
    #10;

    // Test Case 5 
    // Read Register 5 again
    raddr1 = 3'b101;
    #1 $finish;
  end
  initial begin
    $monitor("Time=%0t,clk=%b,we=%b,waddr=%b,wdata=%b,raddr1=%b,raddr2=%b,rdata1=%b,rdata2=%b",$time,clk,we,waddr,wdata,raddr1,raddr2,rdata1,rdata2);
  end
endmodule
