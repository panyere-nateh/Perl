$int = 123;
$neg_int = -456;
$decimal = -78.9;
$scientific_notation = 1.02E10;
$hexadecimal = 0xfff;     #Note: Perl recognizes hex once you place 0x in front of the digits!
$underlines = 123_456_789;
$octal = 01101;           #Note: Perl recognizes octal numbers once you put a leading 0

print $scientific_notation. "\n"; #output: 10200000000
print $underlines. "\n"; #output: 123456789
print $hexadecimal. "\n"; #output: 4095
print $octal. "\n"; #output: 577

# Concatenate scalars initialised as numbers
$hour = 8;
$minutes = 30;
$time_string = $hour . ":" . $minutes . "\n"; # 8:30
print $time_string