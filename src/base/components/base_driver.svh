
virtual class base_driver extends uvm_driver;

    string MSG_ID;

    function new(string name="base_driver", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
