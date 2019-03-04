
module seqdt(output reg z,
	input x, clk, reset);// Module declaration and Port declarations.

reg [1:0] cst, nst;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

always @(*)
 begin
 case (cst)

   S0: if (x == 1'b1)// Checking for first '1' in the sequence '101'
          begin
         nst = S1;
          z=1'b0;
          end
      else
          begin
           nst = S0;// Stay in the same state if '0' id setected.
          z=1'b0;
          end

   S1: if (x == 1'b0)// Checking for '0'
          begin
        nst = S2;
          z=1'b0;
          end
       else
          begin
	nst = S1;
          z=1'b0;
          end

   S2: if (x == 1'b1)
          begin
         nst = S1;// '101' detected. Go to state S1 as it is a overlapping sequence.
          z=1'b1;// Output assigned to '1'.
          end    
            else
          begin
	nst = S0;// Go to the first state.
          z=1'b0;
          end

 default:
	begin
 	nst = S0;
	z = 1'b0;
	end
  endcase
end

always@(posedge clk,negedge reset)
begin
           if (!reset)
             cst <= S0;
           else
             cst <= nst;
end
endmodule
