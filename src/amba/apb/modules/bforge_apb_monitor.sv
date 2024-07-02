
import bforge_apb_lib_pkg::*;
import uvm_pkg::*;
module bforge_apb_monitor #(
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
    input   logic  [DATA_WIDTH-1:00]    PRDATA,
    input   logic  [00:00]               PREADY,
    input   logic  [00:00]               PSLVERR
);

    bforge_apb_if apb_if();

    assign  apb_if.pclk     =  PCLK;
    assign  apb_if.presetn  =  PRESETn;
    assign  apb_if.psel     =  PSEL;
    assign  apb_if.penable  =  PENABLE;
    assign  apb_if.paddr    =  PADDR;
    assign  apb_if.pwrite   =  PWRITE;
    assign  apb_if.pwdata   =  PWDATA;
    assign  apb_if.pstrb    =  PSTRB;

    assign  apb_if.prdata   =  PRDATA;
    assign  apb_if.pready   =  PREADY;
    assign  apb_if.pslverr  =  PSLVERR;

    initial begin
        uvm_config_db#(virtual bforge_apb_if)::set(null, {"*.", AGENT_NAME}, "vif", apb_if);
    end

endmodule
