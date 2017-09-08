library verilog;
use verilog.vl_types.all;
entity ex12 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        led             : out    vl_logic
    );
end ex12;
