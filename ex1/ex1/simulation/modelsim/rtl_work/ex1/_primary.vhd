library verilog;
use verilog.vl_types.all;
entity ex1 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        led             : out    vl_logic
    );
end ex1;
