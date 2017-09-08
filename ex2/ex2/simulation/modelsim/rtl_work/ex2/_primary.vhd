library verilog;
use verilog.vl_types.all;
entity ex2 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        fm              : out    vl_logic
    );
end ex2;
