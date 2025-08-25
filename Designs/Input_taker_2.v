`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 20:49:18
// Design Name: 
// Module Name: input_taker_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module input_taker_2 #(parameter N=8, M=4, C=8)(
input clk,
input reset,
input [N-1:0] key,
input [M-1:0] Plaintxt,
input start,
output [31:0] data,
output [63:0] key_out,
output  reg done
    );
    
    reg [3:0] i_cur;
    reg [3:0] i_next;
    reg [3:0] r0, r1, r2, r3, r4, r5, r6, r7;
    reg [7:0] k0, k1, k2, k3, k4, k5, k6, k7;
    reg [3:0] s0, s1, s2, s3, s4, s5, s6, s7;
    reg [7:0] t0, t1, t2, t3, t4, t5, t6, t7;
    reg [N-1:0] key_buf;
    reg [M-1:0] Plaintxt_buf;
    reg start_buf;

    assign key_out = {k0, k1, k2, k3, k4, k5, k6, k7};
    assign data = {r0, r1, r2, r3, r4, r5, r6, r7};
    
    
    always @(posedge clk)
    begin
        if(reset)
        begin
            i_cur<=0;
            s0 <= 4'd0;
            s1 <= 4'd0;
            s2 <= 4'd0;
            s3 <= 4'd0;
            s4 <= 4'd0;
            s5 <= 4'd0;
            s6 <= 4'd0;
            s7 <= 4'd0;
            t0 <= 8'd0;
            t1 <= 8'd0;
            t2 <= 8'd0;
            t3 <= 8'd0;
            t4 <= 8'd0;
            t5 <= 8'd0;
            t6 <= 8'd0;
            t7 <= 8'd0;
            key_buf<=0;
            Plaintxt_buf<=0;
            start_buf<=0;
        end
        else
        begin
            i_cur<=i_next;
            s0 <= r0;  
            s1 <= r1;  
            s2 <= r2;  
            s3 <= r3;
            s4 <= r4;  
            s5 <= r5;  
            s6 <= r6;  
            s7 <= r7;
    
           t0 <= k0;  
           t1 <= k1;  
           t2 <= k2;  
           t3 <= k3;
           t4 <= k4;  
           t5 <= k5;  
           t6 <= k6;  
           t7 <= k7;
           key_buf<=key;
           Plaintxt_buf<=Plaintxt;
           start_buf<=start;
       end
    end
    
    always@*
    begin
        case(i_cur)
    0:
    begin
        if(start_buf)
        begin
            i_next = i_cur+1;
        end
        else
        begin
            i_next = 0;
        end
            r0 = 0;  r1 = 0;  r2 = 0;  r3 = 0;
            r4 = 0;  r5 = 0;  r6 = 0;  r7 = 0;

            k0 = 0;  k1 = 0;  k2 = 0;  k3 = 0;
            k4 = 0;  k5 = 0;  k6 = 0;  k7 = 0;
        done =0;
    end

    1:
    begin
        i_next = i_cur+1;
        done =0;
            r0 = Plaintxt_buf;  r1 = s1;  r2 = s2;  r3 = s3;
            r4 = s4;        r5 = s5;  r6 = s6;  r7 = s7;

            k0 = key_buf;       k1 = t1;  k2 = t2;  k3 = t3;
            k4 = t4;        k5 = t5;  k6 = t6;  k7 = t7;
    end
    2:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = Plaintxt_buf;  r2 = s2;  r3 = s3;
        r4 = s4;  r5 = s5;        r6 = s6;  r7 = s7;

        k0 = t0;  k1 = key_buf;       k2 = t2;  k3 = t3;
        k4 = t4;  k5 = t5;        k6 = t6;  k7 = t7;
    end
    3:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = s1;  r2 = Plaintxt_buf;  r3 = s3;
        r4 = s4;  r5 = s5;  r6 = s6;        r7 = s7;

        k0 = t0;  k1 = t1;  k2 = key_buf;       k3 = t3;
        k4 = t4;  k5 = t5;  k6 = t6;        k7 = t7;
    end

    4:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = Plaintxt_buf;
        r4 = s4;  r5 = s5;  r6 = s6;  r7 = s7;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = key_buf;
        k4 = t4;  k5 = t5;  k6 = t6;  k7 = t7;
    end

    5:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
        r4 = Plaintxt_buf;  r5 = s5;  r6 = s6;  r7 = s7;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
        k4 = key_buf;  k5 = t5;  k6 = t6;  k7 = t7;
    end

    6:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
        r4 = s4;  r5 = Plaintxt_buf;  r6 = s6;  r7 = s7;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
        k4 = t4;  k5 = key_buf;  k6 = t6;  k7 = t7;
    end

    7:
    begin
        i_next = i_cur+1;
        done =0;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
        r4 = s4;  r5 = s5;  r6 = Plaintxt_buf;  r7 = s7;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
        k4 = t4;  k5 = t5;  k6 = key_buf;       k7 = t7;
    end

    8:
    begin
        done =1;
        i_next = i_cur+1;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
        r4 = s4;  r5 = s5;  r6 = s6;  r7 = Plaintxt_buf;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
        k4 = t4;  k5 = t5;  k6 = t6;  k7 = key_buf;
    end
    9:
    begin
        if(start_buf)
        begin
            i_next =1;
        end
        else
        begin
            i_next = i_cur;
        end
        done =0;
            r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
            r4 = s4;  r5 = s5;  r6 = s6;  r7 = s7;

            k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
            k4 = t4;  k5 = t5;  k6 = t6;  k7 = t7;
    end
    default:
    begin
        i_next = 0;
        r0 = s0;  r1 = s1;  r2 = s2;  r3 = s3;
        r4 = s4;  r5 = s5;  r6 = s6;  r7 = s7;

        k0 = t0;  k1 = t1;  k2 = t2;  k3 = t3;
        k4 = t4;  k5 = t5;  k6 = t6;  k7 = t7;
    end
endcase
end
endmodule
