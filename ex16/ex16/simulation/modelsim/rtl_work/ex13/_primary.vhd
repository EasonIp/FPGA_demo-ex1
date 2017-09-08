library verilog;
use verilog.vl_types.all;
entity ex13 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        ram_dout        : out    vl_logic_vector(7 downto 0)
    );
end ex13;
