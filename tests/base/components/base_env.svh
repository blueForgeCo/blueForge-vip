
virtual class base_env extends uvm_env;

    string MSG_ID;

    function new(string name="base_env", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
