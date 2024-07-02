
import bforge_apb_lib_pkg::*;
module bforge_apb_target #(
    parameter string AGENT_NAME
) (
    input   logic  [00:00]               PCLK,
    input   logic  [00:00]               PRESETn,
    input   logic  [00:00]               PSEL,
    input   logic  [00:00]               PENABLE,
    input   logic  [ADDR_WIDTH-1:00]    PADDR,
    input   logic  [00:00]               PWRITE,
    input   logic  [DATA_WIDTH-1:00]    PWDATA,
    input   logic  [DATA_WIDTH/8-1:00]  PSTRB,
    output  logic  [DATA_WIDTH-1:00]    PRDATA,
    output  logic  [00:00]               PREADY,
    output  logic  [00:00]               PSLVERR
);
    import uvm_pkg::*;

    bforge_apb_if apb_if();

    assign  PCLK     =  apb_if.pclk;
    assign  PRESETn  =  apb_if.presetn;
    assign  PSEL     =  apb_if.psel;
    assign  PENABLE  =  apb_if.penable;
    assign  PADDR    =  apb_if.paddr;
    assign  PWRITE   =  apb_if.pwrite;
    assign  PWDATA   =  apb_if.pwdata;
    assign  PSTRB    =  apb_if.pstrb;

    assign  apb_if.prdata          =  PRDATA;
    assign  apb_if.pready          =  PREADY;
    assign  apb_if.pslverr         =  PSLVERR;

    initial begin
        uvm_config_db#(virtual bforge_apb_if)::set(null, {"*.", AGENT_NAME}, "vif", apb_if);
    end

endmodule
