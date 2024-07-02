import uvm_pkg::*;
import test_lib_pkg::*;
module top;


    bforge_apb_initiator #( "initiator" ) initiator (
    );
    bforge_apb_monitor #( "init_monitor" ) init_monitor (
    );

    bforge_apb_target #( "target_0" ) target_0 (
    );
    bforge_apb_monitor #( "trgt_monitor_0" ) trgt_monitor_0 (
    );

    bforge_apb_target #( "target_1" ) target_1 (
    );
    bforge_apb_monitor #( "trgt_monitor_1" ) trgt_monitor_1 (
    );

    bforge_apb_target #( "target_2" ) target_2 (
    );
    bforge_apb_monitor #( "trgt_monitor_2" ) trgt_monitor_2 (
    );

    bforge_apb_target #( "target_3" ) target_3 (
    );
    bforge_apb_monitor #( "trgt_monitor_3" ) trgt_monitor_3 (
    );

    bforge_apb_target #( "target_4" ) target_4 (
    );
    bforge_apb_monitor #( "trgt_monitor_4" ) trgt_monitor_4 (
    );


    initial
        run_test();


endmodule
