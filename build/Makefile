
all: build sim

EXTRA_SIM_ARGS ?= 

build:
	vlog ../src/base/bforge_base_lib_pkg.sv
	vlog ../src/amba/apb/bforge_apb_lib_pkg.sv
	vlog ../src/amba/apb/interfaces/bforge_apb_if.sv
	vlog ../src/amba/apb/modules/bforge_apb_initiator.sv
	vlog ../src/amba/apb/modules/bforge_apb_target.sv
	vlog ../src/amba/apb/modules/bforge_apb_monitor.sv
	vlog ../tests/base/base_test_lib_pkg.sv
	vlog ../tests/amba/apb/params/params_pkg.sv
	vlog ../tests/amba/apb/test_lib_pkg.sv
	vlog ../tests/amba/apb/tb/top.sv

sim:
	vsim -c work.top -do "run -a; q" +UVM_TESTNAME=test ${EXTRA_SIM_ARGS}


clean:
	git clean -xdf .
