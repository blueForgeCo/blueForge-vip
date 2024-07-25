import uvm_pkg::*;
import test_lib_pkg::*;
import bforge_apb_lib_pkg::*;
import params_pkg::*;
module top;

    logic  [00:00]              PCLK;
    logic  [00:00]              PRESETn;
    logic  [00:00]              PSEL;
    logic  [00:00]              PENABLE;
    logic  [ADDR_WIDTH-1:00]    PADDR;
    logic  [00:00]              PWRITE;
    logic  [DATA_WIDTH-1:00]    PWDATA;
    logic  [DATA_WIDTH/8-1:00]  PSTRB;
    logic  [DATA_WIDTH-1:00]    PRDATA;
    logic  [00:00]              PREADY;
    logic  [00:00]              PSLVERR;

    logic  [DATA_WIDTH-1:00]    decoded_PRDATA[TARGET_COUNT];
    logic  [00:00]              decoded_PREADY[TARGET_COUNT];
    logic  [00:00]              decoded_PSLVERR[TARGET_COUNT];

    logic  [00:00]              decoded_PSEL[TARGET_COUNT];

    bforge_apb_initiator #( "initiator" ) initiator (
        .*
    );
    bforge_apb_monitor #( "init_monitor" ) init_monitor (
        .*
    );

    always_comb begin
        decoded_PSEL[0] = 1'b0;
        decoded_PSEL[1] = 1'b0;
        decoded_PSEL[2] = 1'b0;
        decoded_PSEL[3] = 1'b0;
        case(PADDR[ADDR_WIDTH-1:ADDR_WIDTH-2])
            2'b00: decoded_PSEL[0] = 1'b1;
            2'b01: decoded_PSEL[1] = 1'b1;
            2'b10: decoded_PSEL[2] = 1'b1;
            2'b11: decoded_PSEL[3] = 1'b1;
        endcase
    end

    bforge_apb_target #( "target_0" ) target_0 (
        .PREADY(decoded_PREADY[0]),
        .PRDATA(decoded_PRDATA[0]),
        .PSLVERR(decoded_PSLVERR[0]),
        .*
    );
    bforge_apb_monitor #( "trgt_monitor_0" ) trgt_monitor_0 (
        .PREADY(decoded_PREADY[0]),
        .PRDATA(decoded_PRDATA[0]),
        .PSLVERR(decoded_PSLVERR[0]),
        .*
    );

    bforge_apb_target #( "target_1" ) target_1 (
        .PREADY(decoded_PREADY[1]),
        .PRDATA(decoded_PRDATA[1]),
        .PSLVERR(decoded_PSLVERR[1]),
        .*
    );
    bforge_apb_monitor #( "trgt_monitor_1" ) trgt_monitor_1 (
        .PREADY(decoded_PREADY[1]),
        .PRDATA(decoded_PRDATA[1]),
        .PSLVERR(decoded_PSLVERR[1]),
        .*
    );

    bforge_apb_target #( "target_2" ) target_2 (
        .PREADY(decoded_PREADY[2]),
        .PRDATA(decoded_PRDATA[2]),
        .PSLVERR(decoded_PSLVERR[2]),
        .*
    );
    bforge_apb_monitor #( "trgt_monitor_2" ) trgt_monitor_2 (
        .PREADY(decoded_PREADY[2]),
        .PRDATA(decoded_PRDATA[2]),
        .PSLVERR(decoded_PSLVERR[2]),
        .*
    );

    bforge_apb_target #( "target_3" ) target_3 (
        .PREADY(decoded_PREADY[3]),
        .PRDATA(decoded_PRDATA[3]),
        .PSLVERR(decoded_PSLVERR[3]),
        .*
    );
    bforge_apb_monitor #( "trgt_monitor_3" ) trgt_monitor_3 (
        .PREADY(decoded_PREADY[3]),
        .PRDATA(decoded_PRDATA[3]),
        .PSLVERR(decoded_PSLVERR[3]),
        .*
    );

    initial
        run_test();


endmodule
