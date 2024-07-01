
module top;


    bforge_apb_initiator #( "INITIATOR" ) initiator (
    );
    bforge_apb_monitor #( "MONITOR" ) monitor (
    );

    bforge_apb_target #( "TARGET0" ) target0 (
    );
    bforge_apb_monitor #( "MONITOR0" ) monitor0 (
    );

    bforge_apb_target #( "TARGET1" ) target1 (
    );
    bforge_apb_target #( "TARGET2" ) target2 (
    );
    bforge_apb_target #( "TARGET3" ) target3 (
    );



endmodule
