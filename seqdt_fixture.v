`include "seqdt.v"

module seqdt_fixture;

reg x,clk,reset;
wire z;

seqdt A1(z,x,clk, reset);//Initialization of sequence detector

initial
begin
	reset=0;
	clk=0;
	x=0;

	$monitor($time, , ,"X=%b     Z=%b     RESET=%b",x,z,reset);
// Input sequence

	@(posedge clk) reset = 0;
	@(posedge clk) reset = 1;
	@(posedge clk) x=0;
	@(posedge clk) x=1;
	@(posedge clk) x=0;
	@(posedge clk) x=1;
	@(posedge clk) x=1;
	@(posedge clk) x=0;
	@(posedge clk) x=1;
	@(posedge clk) x=0;
	@(posedge clk) x=1;
	@(posedge clk) x=0;
	@(posedge clk) x=0;
	@(posedge clk) reset = 0;
	@(posedge clk) reset = 1;
	@(posedge clk) x=1;
	@(posedge clk) x=0;
	@(posedge clk) x=1;
	@(posedge clk) x=1;
end

always// Clock decleration
#5 clk=~clk;

initial
#400 $finish;

endmodule
