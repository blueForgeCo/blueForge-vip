
interface bforge_apb_if;

    localparam ADDR_WIDTH = `ADDR_WIDTH;
    localparam DATA_WIDTH = `DATA_WIDTH;
    localparam STRB_WIDTH = DATA_WIDTH/8;

    logic  [00:00]            pclk;
    logic  [00:00]            presetn;
    logic  [00:00]            psel;
    logic  [00:00]            penable;
    logic  [ADDR_WIDTH-1:00]  paddr;
    logic  [00:00]            pwrite;
    logic  [DATA_WIDTH-1:00]  pwdata;
    logic  [STRB_WIDTH-1:00]  pstrb;
    logic  [DATA_WIDTH-1:00]  prdata;
    logic  [00:00]            pready;
    logic  [00:00]            pslverr;

endinterface
