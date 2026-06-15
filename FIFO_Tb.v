`timescale 1ns / 1ps

module fifo_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #20;
    rst = 0;

    // Write data
    data_in = 8'h11; wr_en = 1; #10;
    data_in = 8'h22; #10;
    data_in = 8'h33; #10;
    data_in = 8'h44; #10;
    wr_en = 0;

    // Read data
    #20;
    rd_en = 1;
    #40;
    rd_en = 0;

    #50;
    $stop;

end

endmodule