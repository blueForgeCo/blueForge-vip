
virtual class base_agent extends uvm_agent;

    string MSG_ID;

    function new(string name="base_agent", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
