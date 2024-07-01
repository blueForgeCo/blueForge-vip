
virtual class base_monitor extends uvm_monitor;

    string MSG_ID;

    function new(string name="base_monitor", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
