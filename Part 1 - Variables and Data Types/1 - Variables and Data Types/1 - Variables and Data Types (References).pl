$var = 10;
$pointer = \$var; #the pointer variable carries the address of the $var variable
print $pointer; #output: SCALAR(0x2727f30d398)
print "\n";
print $$pointer; #output: 10
