
virtual class base_component extends uvm_component;

    string MSG_ID;

    function new(string name="base_component", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
