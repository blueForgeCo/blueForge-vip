
`include "params/params_pkg.sv"

package test_lib_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import bforge_base_lib_pkg::*;
    import bforge_apb_lib_pkg::*;

    import base_test_lib_pkg::*;
    import params_pkg::*;

    `include "components/env.svh"
    `include "tests/test.svh"

endpackage

`include "tb/top.sv"
