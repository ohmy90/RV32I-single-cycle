module imem(
    input logic [31:0] addr,
    output logic [31:0] instr
);

    logic [31:0] mem [0:31]; 

    initial $readmemh("test.hex",mem);

    assign instr=mem[addr>>2];
    //mem[n] contains 4 bytes, divide by 4 to obtain proper instruction
    //input is PC addres, which has jumps of 4


endmodule