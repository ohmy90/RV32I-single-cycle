module dmem(
    input logic [31:0] addr,wdata,
    input logic memWrite, clk,
    output logic [31:0] rdata
);

   logic [31:0] mem [0:31]; 

   assign rdata=mem[addr>>2];

   always_ff @(posedge clk)
    if (memWrite) mem[addr>>2]<=wdata;
   end

endmodule