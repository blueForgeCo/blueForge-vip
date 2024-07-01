
class test extends uvm_test;
    `uvm_components_utils(test)

    env e;

    function new(string name="test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        e = env::type_id::create("e");
    endfunction

endclass

