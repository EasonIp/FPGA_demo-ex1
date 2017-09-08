library verilog;
use verilog.vl_types.all;
entity ex5_vlg_tst is
    generic(
        SEG_NUM0        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        SEG_NUM1        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0);
        SEG_NUM2        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi1);
        SEG_NUM3        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        SEG_NUM4        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0);
        SEG_NUM5        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1);
        SEG_NUM6        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1);
        SEG_NUM7        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1);
        SEG_NUM8        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        SEG_NUM9        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1);
        SEG_NUMA        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1);
        SEG_NUMB        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0);
        SEG_NUMC        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1);
        SEG_NUMD        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0);
        SEG_NUME        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1);
        SEG_NUMF        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SEG_NUM0 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM1 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM2 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM3 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM4 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM5 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM6 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM7 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM8 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUM9 : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUMA : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUMB : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUMC : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUMD : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUME : constant is 1;
    attribute mti_svvh_generic_type of SEG_NUMF : constant is 1;
end ex5_vlg_tst;
