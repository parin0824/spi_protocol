module tb();
 
reg clk = 0, rst = 0, newd = 0;
reg [11:0] din = 0;
wire [11:0] dout;
wire done;
 integer i;
always #10 clk = ~clk;
 
top dut (clk, rst, newd, din, dout, done);
 
initial begin
    rst = 1;
    repeat(5) @(posedge clk);
    rst = 0;

    
    for(i = 0; i < 10; i = i +1) begin
        newd = 1;
        din = $urandom;
        @(posedge dut.s1.sclk);
        newd = 0;
        @(posedge done);
    end
end

endmodule
