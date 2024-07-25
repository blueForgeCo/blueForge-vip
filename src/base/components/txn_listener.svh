
class txn_listener #(type T = uvm_object) extends uvm_subscriber #(.T(T));

    `uvm_component_param_utils(txn_listener #(T))
    function new(string name = "txn_listener", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void write(T t);
        t.print();
    endfunction

endclass
