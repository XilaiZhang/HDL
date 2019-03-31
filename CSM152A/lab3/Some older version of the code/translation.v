/*
	Inputs: Need seconds,deca_seconds,minutes,deca_minutes,on_off
*/

input [7:0] sevenSegCathodes;
input [3:0] sevenSegAnodes;
output seg[0];
output seg[1];
output seg[2];
output seg[3];
output seg[4];
output seg[5];
output seg[6];
output seg[7];
output an[0];
output an[1];
output an[2];
output an[3];

for (i=0;i<8;i=i+1)begin
	case(sevenSegCathodes[i])
		1:seg[7-i]=1'b1;
		0:seg[7-i]=1'b0;
end

for (i=0;i<4;i=i+1)begin
	case(sevenSegAnodes[i])
		1:an[3-i]=1'b1;
		0:an[3-i]=1'b0;
end

