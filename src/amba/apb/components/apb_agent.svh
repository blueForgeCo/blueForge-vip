
class apb_agent extends base_agent;

    `uvm_component_utils(apb_agent)

    function new(string name="apb_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual apb_if vif;

    apb_config cfg;
    apb_driver driver;
    apb_monitor monitor;
    apb_sequencer sequencer;

    function void build_phase(uvm_phase phase);
        if(vif == null) begin
            if(!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
                `uvm_error(MSG_ID, "Unable to fetch vif")
        end
        if(cfg == null) begin
            if(!uvm_config_db#(apb_config)::get(this, "", "cfg", cfg))
                `uvm_error(MSG_ID, "Unable to fetch cfg")
        end

        if(cfg.is_active) begin
            sequencer = apb_sequencer::type_id::create("sequencer", this);
            driver = apb_driver::type_id::create("driver", this);
            driver.vif = vif;
            driver.cfg = cfg;
        end

        monitor = apb_monitor::type_id::create("monitor", this);
        monitor.vif = vif;
        monitor.cfg = cfg;
    endfunction

endclass
