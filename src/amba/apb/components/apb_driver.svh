
class apb_driver extends base_driver;
    
    `uvm_components_utils(apb_driver)

    virtual apb_if vif;
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
        forever begin
            #100;
            `uvm_info(MSG_ID, "Driver ....")
        end
    endtask

endclass
