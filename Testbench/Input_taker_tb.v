`timescale 1ns / 1ps
//same testbench is used for all designs
module input_taker_another_tb;

    // Parameters
    parameter N = 8;
    parameter M = 4;
    parameter C = 8;

    // Inputs
    reg clk;
    reg reset;
    reg [N-1:0] key;
    reg [M-1:0] Plaintxt;
    reg start;

    // Outputs
    wire [31:0] data;
    wire [63:0] key_out;
    wire done;

    // Instantiate the Unit Under Test (UUT)
    input_taker_3 #(N, M, C) uut (
        .clk(clk),
        .reset(reset),
        .key(key),
        .Plaintxt(Plaintxt),
        .start(start),
        .data(data),
        .key_out(key_out),
        .done(done)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns period

    // Test sequence
    integer i;

    initial begin
        // Initialize
        reset = 1;
        start = 0;
        key = 8'h00;
        Plaintxt = 4'h0;

        #10;
        reset = 0;
       #5;

        // ======= First Input Set =======
        // Start high for 3 cycles
        start = 1;
       
        
       // Drive data for 8 cycles
#5;    key = 8'hA0; Plaintxt = 4'h1;

    #10;
    key = 8'hA1; Plaintxt = 4'h2;

        #10;;
    key = 8'hA2; Plaintxt = 4'h3;

    #10;    key = 8'hA3; Plaintxt = 4'h4;

    #10;    key = 8'hA4; Plaintxt = 4'h5;

    #10;    key = 8'hA5; Plaintxt = 4'h6;

    #10;    key = 8'hA6; Plaintxt = 4'h7;

    #10;    key = 8'hA7; Plaintxt = 4'h8;

        start = 0;


        // Wait for done
        wait(done == 1);

        $display("=========== First Output ===========");
        $display("Plaintext Out: %h", data);
        $display("Key Out      : %h", key_out);
        $display("====================================");

      
        $finish;
    end

endmodule
