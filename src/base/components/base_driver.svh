
virtual class base_driver #(type REQ, type RSP=REQ) 
    extends uvm_driver #(REQ, RSP);

    string MSG_ID;

    function new(string name="base_driver", uvm_component parent);
        super.new(name, parent);
        MSG_ID = get_type_name();
    endfunction

endclass
