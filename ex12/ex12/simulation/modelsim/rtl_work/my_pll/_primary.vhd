library verilog;
use verilog.vl_types.all;
entity my_pll is
    port(
        areset          : in     vl_logic;
        inclk0          : in     vl_logic;
        c0              : out    vl_logic;
        locked          : out    vl_logic
    );
end my_pll;
