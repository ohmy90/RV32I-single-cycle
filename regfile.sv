module regfile(
    input logic [31:0] rs1,rs2,
    input logic [31:0] wr,wd,
    input logic RegWrite, clk, 
    output logic [31:0] rd1,rd2
);

    logic [31:0] registers [0:31]; //Verilator initializes everything to 0


    always_ff @(posedge clk) begin
        if (RegWrite && (wr!=0)) registers[wr]<=wd;
        end
    end

    always_comb begin
        rd1=registers[rs1];
        rd2=regsiters[rs2];
    end

endmodule
