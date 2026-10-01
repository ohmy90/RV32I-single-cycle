module aluControl(
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic [1:0] ALUop,
    output logic [3:0] ALUcontrol
);

always_comb begin

casez ({ALUop,funct3,funct7[5]}) 
    6'b00????:  ALUcontrol=4'b0000; //Load and store instructions
    6'b100000:  ALUcontrol=4'b0000; //Add
    6'b100001:  ALUcontrol=4'b0001; //Sub
    6'b11000?:  ALUcontrol=4'b0000; //ADDI

    6'b1?0010:  ALUcontrol=4'b0101; //Shift left
    6'b1?010?:  ALUcontrol=4'b1000; //Set less than
    6'b1?011?:  ALUcontrol=4'b1001; //SLT unsigned
    6'b1?1010:  ALUcontrol=4'b0110; //Shift right logical
    6'b1?1011:  ALUcontrol=4'b0111; //Shift right arithmetic
    6'b1?111?:  ALUcontrol=4'b0010; //and
    6'b1?110?:  ALUcontrol=4'b0011; //or
    6'b1?100?:  ALUcontrol=4'b0100; //xor


    default:    ALUcontrol=4'b1;
    endcase
end



endmodule