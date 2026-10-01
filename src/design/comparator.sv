module comparator(
    input logic [31:0] rs1,rs2,
    input logic [2:0] branchOp,
    input logic [6:0] op,
    output logic out
);

always_comb begin

case ({branchOp,op}) //only trigger when the instruction is branch to save computation effort
    10'b0001100011: out=(rs1==rs2)? 1:0; //Branch if equal
    10'b0011100011: out=(rs1!=rs2)? 1:0; //Branch if unequal
    10'b1101100011: out=(rs1<rs2)?  1:0; //Branch if less than, unsigned
    10'b1111100011: out=(rs1>=rs2)? 1:0; //Branch if greater or equal, unsigned
    10'b1001100011: out=($signed(rs1)<$signed(rs2))?  1:0; //Branch if less than
    10'b1011100011: out=($signed(rs1)>=$signed(rs2))? 1:0; //Branch if greater or equal
    default: out=0; //no branch
endcase
end

endmodule