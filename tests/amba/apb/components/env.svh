
class env extends uvm_env;
    `uvm_component_utils(env)

    apb_agent initiator;
    apb_agent init_monitor;
    apb_agent target[TARGET_COUNT];
    apb_agent trgt_monitor[TARGET_COUNT];

    function new(string name="env", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        apb_config cfg;
        super.build_phase(phase);
        initiator = apb_agent::type_id::create("initiator", this);
        cfg = apb_config::type_id::create("cfg");
        cfg.is_active = 1'b1;
        cfg.agent_type = INITIATOR;
        initiator.cfg = cfg;

        init_monitor = apb_agent::type_id::create("init_monitor", this);
        cfg = apb_config::type_id::create("cfg");
        cfg.is_active = 1'b0;
        init_monitor.cfg = cfg;

        foreach(target[i]) begin
            target[i] = apb_agent::type_id::create($psprintf("target_%0d", i), this);
            cfg = apb_config::type_id::create("cfg");
            cfg.is_active = 1'b1;
            cfg.agent_type = TARGET;
            target[i].cfg = cfg;

            trgt_monitor[i] = apb_agent::type_id::create($psprintf("trgt_monitor_%0d", i), this);
            cfg = apb_config::type_id::create("cfg");
            cfg.is_active = 1'b0;
            trgt_monitor[i].cfg = cfg;
        end
    endfunction

endclass
