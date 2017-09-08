library verilog;
use verilog.vl_types.all;
entity ex_rom is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end ex_rom;
