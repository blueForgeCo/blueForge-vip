
class apb_txn extends uvm_sequence_item;

    `uvm_object_utils(apb_txn)

    function new(string name = "apb_txn");
        super.new(name);
    endfunction

    rand  addr_t      addr;

    rand  int4_t      strb;
    rand  int32_t     data;

    rand  apb_txn_t   txn_type;

    function bit is_write();
        return (txn_type == WRITE);
    endfunction

    function bit is_read();
        return (txn_type == READ);
    endfunction

    function bit set_txn_type(bit pwrite);
        if(pwrite) txn_type = WRITE;
        else       txn_type = READ;
    endfunction

    // TODO: fix
    // rand  apb_prot_t  prot;

endclass
