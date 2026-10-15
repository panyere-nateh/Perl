@array_num = (1,2,3,4,5); #an array with numerical elements
@array_str = ("a","b","c"); #an array with string elements
@array_mixed = ("apples", 23, "sweaters", 78.5, "h", 0xfff); #arrays can also have a mix of numbers and strings

print $array_num[4]; #output: 5
print $array_num[-1]; #output: 5 (count backwards)
print $array_mixed[-2]; #output: "h"

print "\n"; 

#changing the value of an array
$array_str[2] = "see";
print @array_str; #array_str now: ("a", "b", "see")