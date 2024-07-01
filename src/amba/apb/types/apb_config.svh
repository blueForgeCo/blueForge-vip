
class apb_config extends uvm_object;
    `uvm_object_utils(apb_config);

    bit         is_active;
    apb_agent_t agent_type;

endclass
