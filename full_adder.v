module full_adder (
	input		wire	a,
	input		wire	b,
	input		wire	cin,
	output	wire	sum,
	output	wire	cout
);

	assign sum = a^b^cin; //Sum
	assign cout = (a & b)|(a & cin)|(b & cin); //Carry out

endmodule 