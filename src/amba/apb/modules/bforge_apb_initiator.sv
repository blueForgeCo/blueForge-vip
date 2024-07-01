
module bforge_apb_initiator #(
    parameter string AGENT_NAME
) (
    input   logic  [00:00]               PCLK,
    input   logic  [00:00]               PRESETn,
    output  logic  [00:00]               PSEL,
    output  logic  [00:00]               PENABLE,
    output  logic  [`ADDR_WIDTH-1:00]    PADDR,
    output  logic  [00:00]               PWRITE,
    output  logic  [`DATA_WIDTH-1:00]    PWDATA,
    output  logic  [`DATA_WIDTH/8-1:00]  PSTRB,
    input   logic  [`DATA_WIDTH-1:00]    PRDATA,
    input   logic  [00:00]               PREADY,
    input   logic  [00:00]               PSLVERR
);

    bforge_apb_if apb_if;

    assign  apb_if.pclk     =  PCLK;
    assign  apb_if.presetn  =  PRESETn;
    assign  apb_if.psel     =  PSEL;
    assign  apb_if.penable  =  PENABLE;
    assign  apb_if.paddr    =  PADDR;
    assign  apb_if.pwrite   =  PWRITE;
    assign  apb_if.pwdata   =  PWDATA;
    assign  apb_if.pstrb    =  PSTRB;

    assign  PRDATA          =  apb_if.prdata;
    assign  PREADY          =  apb_if.pready;
    assign  PSLVERR         =  apb_if.pslverr;

    initial begin
        uvm_config_db#(virtual bforge_apb_if)::set(null, "", {"*.", AGENT_NAME}, apb_if);
    end

endmodule
