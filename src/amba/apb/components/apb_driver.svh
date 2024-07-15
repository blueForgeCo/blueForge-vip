
class apb_driver extends base_driver #( apb_txn );
    
    `uvm_component_utils(apb_driver)

    virtual bforge_apb_if vif;
    apb_config cfg;

    function new(string name="apb_driver", uvm_component parent);
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
        drive_txn();
    endtask

    task drive_txn();
        forever begin
            apb_txn txn;
            seq_item_port.get_next_item(txn);
            @(posedge vif.pclk);
            vif.psel <= 1'b1;
            vif.pwrite <= txn.is_write();
            vif.paddr <= txn.addr;
            if(txn.is_write()) begin
                vif.pstrb <= txn.strb;
                vif.pwdata <= txn.data;
            end
            @(posedge vif.pclk);
            vif.penable <= 1'b1;
            do
                @(posedge vif.pclk);
            while(vif.pready !== 1'b1);
            vif.penable <= 1'b0;
            vif.psel    <= 1'b0;
        end
    endtask

endclass
