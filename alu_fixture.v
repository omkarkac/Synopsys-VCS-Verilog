// Top level module

`include "alu.v"


// Module Declaration

module alu_fixture;
parameter size = 32;

reg signed [size-1:0] A;
reg signed [size-1:0] B;
reg [1:0] CTRL;
reg signed [size:0] R;
reg Cin;
reg O = 1'b0;
reg Z = 1'b0;
reg N = 1'b0;

reg signed [size-1:0] a;
reg signed [size-1:0] b;
reg [1:0] ctrl;

wire signed [size:0] r;
wire o;
wire z;
wire n;

initial
$vcdpluson;

// Initialize alu
alu a1(.A(a),.B(b),.CTRL(ctrl),.R(r),.O(o),.N(n),.Z(z));

initial

begin

$monitor("A:%h   B:%h   CTRL:%b     R:%h     O:%b     Z:%b     N:%b   ", a, b, ctrl,r[size-1:0] , O, Z,N,);

$display("			ADDITION			");

	ctrl = 2'b00;
	a = 32'shFFFFF000; 
	b = 32'shFFFFFFFF;
	R=r;
	assign  Z = ~(|r[size-1:0]);
        assign N = (r[size-1] == 1 && (ctrl == 00 || ctrl == 01));
//      	assign O = (r[size] == 1 && (ctrl == 00 || ctrl == 01));
	assign {O,R} = {1'b0,a} + {1'b0,b};
	#10;
        a = 32'shFFFFFFFF;
        b = 32'sh000F00F0;
        
        #10;
        a = 32'sh67676767;
        b = 32'sh12431243;
        
        #10;
        a = 32'shAAAAAAAA;
        b = 32'shEFABCD19;
        
        #10;
        a = 32'shFFFFFFFF;
        b = 32'sh00000001;
        
        #10;
        a = 32'shFFFFFFFF;
        b = 32'shFFFFFFFF;
        
        #10;
        a = 32'shFFFFFFFC;
        b = 32'shFFFFFFFC;
        
        #10;
        a = 32'shFFFF0000;
        b = 32'sh00001342;
        
        #10;
        a = 32'sh01234567;
        b = 32'sh00080808;
	        
        #10;
$display("----------X----------X----------X----------X----------X----------X----------X----------");
$display("                      SUBTRACTION                        ");
	ctrl= 2'b01;
       
   	a = 32'shFFFFF000;
        b = 32'shFFFFFFFF;
      	#10;
     

        a = 32'shFFFFFFFF;
        b = 32'sh000F00F0;
        
        #10;
        a = 32'sh67676767;
        b = 32'sh12431243;
        
        #10;
        a = 32'shAAAAAAAA;
        b = 32'shEFABCD19;
        
        #10;
        a = 32'shFFFFFFFF;
        b = 32'sh00000001;
        
        #10;
        a = 32'shFFFFFFFF;
        b = 32'shFFFFFFFF;
        
        #10;
        a = 32'shFFFFFFFC;
        b = 32'shFFFFFFFC;
        
        #10;
        a = 32'shFFFF0000;
        b = 32'sh00001342;
        
        #10;
        a = 32'sh01234567;
        b = 32'sh00080808;
        
        #10;

$display("----------X----------X----------X----------X----------X----------X----------X----------");
$display("                      BITWISE AND                        ");
	ctrl= 2'b10;
	a = 32'shFFFFFFFF;
	b = 32'sh0A0AB0B0;
	#10;
        a = 32'shABCD4545;
        b = 32'sh12383588;
        
        #10;
        a = 32'shF0F0F0F0;
        b = 32'shCFCFCFCF;
        
        #10;
        a = 32'sh00000000;
        b = 32'sh11000001;
        
        #10;
$display("----------X----------X----------X----------X----------X----------X----------X----------");
$display("                      BITWISE OR                        ");
	ctrl= 2'b11;
        a = 32'shFFFFFFFF;
        b = 32'sh0A0AB0B0;
        #10;
        a = 32'shABCD4545;
        b = 32'sh12383588;
        #10;
        a = 32'shF0F0F0F0;
        b = 32'shCFCFCFCF;
        #10;
        a = 32'sh00000000;
        b = 32'sh11000001;
        #10;

$display("----------X----------X----------X----------X----------X----------X----------X----------");
	$finish;


end

endmodule
  
