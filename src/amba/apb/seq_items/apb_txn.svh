
class apb_txn extends uvm_sequence_item;

    `uvm_object_utils(apb_txn)

    function new(string name = "apb_txn");
        super.new(name);
    endfunction

    rand  addr_t      addr;

    rand  int4_t      strb;
    rand  int32_t     data;

    rand  apb_txn_t   is_write;
    // TODO: fix
    // rand  apb_prot_t  prot;

endclass
