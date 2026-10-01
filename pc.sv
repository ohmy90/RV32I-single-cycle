module pc(
    input logic [31:0] PCinput,
    input logic clk,rst,
    output logic [31:0] PC
);

always_ff @(posedge clk && !rst) begin
    if (rst)
        PC<=32'b0;
    else begin
        PC<=PCinput;
    end
end



endmodule