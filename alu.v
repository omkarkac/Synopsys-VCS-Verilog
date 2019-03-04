// ALU
module alu(A,B,CTRL,R,O,N,Z,Cin);

parameter size = 32;

// I/O Declarations
input [size-1:0] A;
input [size-1:0] B;
input [1:0] CTRL;
output [size:0] R;
output O;
output N;
output Z;
input Cin;

// Reg Declarations
wire [size-1:0] A;
wire [size-1:0] B;
wire CTRL;

reg [size:0] R;

reg O;
//assign N  = R[size];
reg Z;


always @*
begin
	case (CTRL)

		2'b00:
		R <= A + B;
	
		2'b01:
		R <= A - B;
    	        	
		2'b10:
		R <= A & B;

		2'b11:
		R <= A | B;
		
		default: $display (" INVALID CONTROL SELECTION ");
	endcase
end
endmodule




