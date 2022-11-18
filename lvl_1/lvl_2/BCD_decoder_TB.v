`include "BCD_decoder.v"

module BCD_decoder_TB;
   reg [3:0] x_TB, y_TB, z_TB;  //inputs
   wire [6:0] x_segs_TB, y_segs_TB, z_segs_TB; //outputs

   BCD_decoder UUT (.min(x_TB), .sec_tens(y_TB), .sec_ones(z_TB),
      .min_segs(x_segs_TB), .sec_tens_segs(y_segs_TB), .sec_ones_segs(z_segs_TB));

   initial
    begin
      $dumpfile("BCD_decoder.vcd");
      $dumpvars(0, BCD_decoder_TB);

      x_TB = 4'b0000; //0
      y_TB = 4'b0001; //1
      z_TB = 4'b0010; //2

      #10
      x_TB = 4'b0001; //1   
      y_TB = 4'b0010; //2
      z_TB = 4'b0011; //3

      #10
      x_TB = 4'b0010; //2
      y_TB = 4'b0011; //3
      z_TB = 4'b0100; //4

      #10
      x_TB = 4'b0011; //3
      y_TB = 4'b0100; //4
      z_TB = 4'b0101; //5

      #10 
      x_TB = 4'b0100; //4
      y_TB = 4'b0101; //5
      z_TB = 4'b0110; //6

      #10 
      x_TB = 4'b0101; //5
      y_TB = 4'b0110; //6
      z_TB = 4'b0111; //7

      #10 
      x_TB = 4'b0110; //6
      y_TB = 4'b0111; //7
      z_TB = 4'b1000; //8

      #10 
      x_TB = 4'b0111; //7
      y_TB = 4'b1000; //8
      z_TB = 4'b1001; //9

      #10 
      x_TB = 4'b1000; //8
      y_TB = 4'b1001; //9
      z_TB = 4'b0000; //0

      #10
      x_TB = 4'b1001; //9
      y_TB = 4'b0000; //0
      z_TB = 4'b0001; //1

      #10 
      x_TB = 4'b1111; //INVÁLIDA
      y_TB = 4'b1010; //INVÁLIDA
      z_TB = 4'b1101; //INVÁLIDA

      #1;
    
   end
endmodule