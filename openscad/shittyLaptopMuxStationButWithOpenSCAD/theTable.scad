
$laptopdepth=398.6;
$laptopheight=26.2;
$laptopwidth=290.0;
$clearance=20.0;

//computed crap

$tabledepth=$clearance+$laptopdepth;
$tablewidth=$clearance+$laptopwidth;
$tableheight=$clearance+$laptopheight;
$tablethickness=20.0;

$topboardwidth=$tablewidth+(2.0*$tablethickness);

//table body
translate([0,0,$tableheight])
    cube([
    $topboardwidth,
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
    
//tell the user what they need to cut
echo (str("Cut 1 board  to ",
    $topboardwidth," by ",
    $tabledepth," by ",
    $tablethickness));

echo (str("Cut 2 boards to ",
    $tablethickness," by ",
    $tabledepth," by ",
    $tableheight));