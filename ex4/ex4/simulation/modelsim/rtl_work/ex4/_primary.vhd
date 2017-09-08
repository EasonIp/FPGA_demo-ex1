library verilog;
use verilog.vl_types.all;
entity ex4 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sw              : in     vl_logic_vector(3 downto 1);
        led             : out    vl_logic_vector(7 downto 0)
    );
end ex4;
