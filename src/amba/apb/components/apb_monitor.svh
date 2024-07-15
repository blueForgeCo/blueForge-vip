
class apb_monitor extends base_monitor;
    
    `uvm_component_utils(apb_monitor)

    virtual bforge_apb_if vif;
    apb_config cfg;

    uvm_analysis_port #(apb_txn) ap;

    function new(string name="apb_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(vif == null)
            `uvm_error(MSG_ID, "vif not set")
        if(cfg == null)
            `uvm_error(MSG_ID, "cfg not set")
    endfunction
    
    task run_phase(uvm_phase phase);
        fork
            monitor_txn();
        join
    endtask

    task monitor_txn();
        apb_txn txn;
        forever begin
            @(posedge vif.pclk);
            case(1)
            ((vif.psel === 1'b1) && (vif.penable === 1'b0)): begin // setup
                txn = apb_txn::type_id::create("txn");
                txn.addr = vif.paddr;
                txn.set_txn_type(vif.pwrite);
                if(txn.is_write()) begin
                    txn.strb = vif.pstrb;
                    txn.data = vif.pwdata;
                end
            end
            ((vif.psel === 1'b1) && (vif.penable === 1'b1) && (vif.pready === 1'b1)): begin // access
                if(txn.is_read()) txn.data = vif.prdata;
                ap.write(txn);
            end
            endcase
        end
    endtask

endclass
