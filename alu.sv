module alu (
    input logic [31:0] a,b,
    input logic [3:0] ALUcontrol,
    output logic [31:0] result
);



    always_comb begin
    case(ALUcontrol)
        4'b0000 :   result=a+b; //Addition
        4'b0001 :   result=a-b; //Substraction
        4'b0010 :   result=a&b; //Bitwise AND
        4'b0011 :   result=a|b; //Bitwise OR
        4'b0100 :   result=a^b; //Bitwise XOR
        4'b0101 :   result= a<<b[4:0]; //Shift left logical
        4'b0110 :   result= a>>b[4:0]; //Shift right logical
        4'b0111 :   result= $signed(a)>>>b[4:0]; //Shift right arithmetic
        4'b1000 :   result=($signed(a)<$signed(b))?32'b1:32'b0; //Set less than
        4'b1001 :   result=(a<b)?32'b1:32'b0; //Set less than unsigned
        default :   result=32'b0;

    endcase
    end


endmodule
