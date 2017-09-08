library verilog;
use verilog.vl_types.all;
entity ex6 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        lcd_en          : out    vl_logic;
        lcd_clk         : out    vl_logic;
        lcd_hsy         : out    vl_logic;
        lcd_vsy         : out    vl_logic;
        lcd_db_r        : out    vl_logic_vector(4 downto 0);
        lcd_db_g        : out    vl_logic_vector(5 downto 0);
        lcd_db_b        : out    vl_logic_vector(4 downto 0)
    );
end ex6;
