#include <icv.rh>

ndm_options(internal_designs = {{ use = FILL_USE, read_from = ALL, out_of_date = USE }});

error_options(error_limit_per_check = 2147483647);

// structure for metal data
met_data_s : newtype struct of {
  name  : string;
  metal : polygon_layer;
  fill  : polygon_layer;
};

metal_data_list : list of met_data_s = {};
M1_metal  = assign ( {{11}}, ndm = {read_from = {VIEWS}} );
M1_fill  = assign ( {{11}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M1", M1_metal,M1_fill});

M2_metal  = assign ( {{13}}, ndm = {read_from = {VIEWS}} );
M2_fill  = assign ( {{13}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M2", M2_metal,M2_fill});

M3_metal  = assign ( {{15}}, ndm = {read_from = {VIEWS}} );
M3_fill  = assign ( {{15}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M3", M3_metal,M3_fill});

M4_metal  = assign ( {{17}}, ndm = {read_from = {VIEWS}} );
M4_fill  = assign ( {{17}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M4", M4_metal,M4_fill});

M5_metal  = assign ( {{19}}, ndm = {read_from = {VIEWS}} );
M5_fill  = assign ( {{19}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M5", M5_metal,M5_fill});

M6_metal  = assign ( {{21}}, ndm = {read_from = {VIEWS}} );
M6_fill  = assign ( {{21}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M6", M6_metal,M6_fill});

M7_metal  = assign ( {{23}}, ndm = {read_from = {VIEWS}} );
M7_fill  = assign ( {{23}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M7", M7_metal,M7_fill});

M8_metal  = assign ( {{25}}, ndm = {read_from = {VIEWS}} );
M8_fill  = assign ( {{25}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M8", M8_metal,M8_fill});

M9_metal  = assign ( {{27}}, ndm = {read_from = {VIEWS}} );
M9_fill  = assign ( {{27}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"M9", M9_metal,M9_fill});

MRDL_metal  = assign ( {{41}}, ndm = {read_from = {VIEWS}} );
MRDL_fill  = assign ( {{41}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
metal_data_list.push_back ({"MRDL", MRDL_metal,MRDL_fill});

VIA1_fill  = assign ( {{12}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA2_fill  = assign ( {{14}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA3_fill  = assign ( {{16}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA4_fill  = assign ( {{18}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA5_fill  = assign ( {{20}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA6_fill  = assign ( {{22}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA7_fill  = assign ( {{24}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIA8_fill  = assign ( {{26}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
VIARDL_fill  = assign ( {{42}},  ndm = { read_from = {INTERNAL_DESIGNS} , internal_designs = { FILL_USE }} );
for (i=0 to metal_data_list.size() - 1) {
  { @ "Metal fill shorts to metal";
     interacting (metal_data_list[i].fill, metal_data_list[i].metal);
  }
}
  { @ "via fill shorts to metal";
     interacting (VIA1_fill, or( M1_metal, M2_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA2_fill, or( M2_metal, M3_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA3_fill, or( M3_metal, M4_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA4_fill, or( M4_metal, M5_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA5_fill, or( M5_metal, M6_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA6_fill, or( M6_metal, M7_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA7_fill, or( M7_metal, M8_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIA8_fill, or( M8_metal, M9_metal));
  }
  { @ "via fill shorts to metal";
     interacting (VIARDL_fill, or( M9_metal, MRDL_metal));
  }
