$string1 = "Coding in Perl";
$string2 = "is so much";
$string3 = "fun!";

#Simple print attempt
print $string1;
print $string2;
print $string3; 
#Output: Coding in Perlis so muchfun!

print "\n"; #line skip!

#Print line by line: string interpolation
print "$string1\n";
print "$string2\n";
print "$string3\n";
# Output:
# Coding in Perl
# is so much
# fun!

#Print line by line: using concatenation
print $string1. "\n";
print $string2. "\n";
print $string3. "\n";
# Output:
# Coding in Perl
# is so much
# fun!

#Print in one line: string interpolation
print "$string1 $string2 $string3\n";
# Output:
# Coding in Perl is so much fun!

#Print in one line: using concatenation
print $string1 . " " . $string2 . " " . $string3 . "\n";
# Output:
# Coding in Perl is so much fun!

print "Hey! I think $string1 $string2 $string3 Don't you agree?\n";