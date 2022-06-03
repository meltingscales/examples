
$laptopdepth=398.6;
$laptopheight=26.2;
$laptopwidth=290.0;
$clearance=20;

$tabledepth=$clearance+$laptopdepth;
$tablewidth=$clearance+$laptopwidth;
$tableheight=$clearance+$laptopheight;
$tablethickness=20;

//table body
translate([0,0,$tableheight])
    cube([
    $tablewidth+2*$tablethickness,
    $tabledepth,
    $tablethickness]);

//legs
translate([0,0,0])
    cube([
    $tablethickness,
    $tabledepth,
    $tableheight]);
    
translate([$tablewidth+$tablethickness,0,0])
    cube([
    $tablethickness,
    $tabledepth,
    $tableheight]);