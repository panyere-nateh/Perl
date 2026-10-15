## Scalar Operators
### Numeric-Exclusive Operators
$add = 1 + 2; #output: 3
$sub = 5 - 6; #output: -1
$mult = 7 * 4.5; #output: 31.5
$div = 7 / 2; #output: 3.5
$mod_div = 7 % 2; #output: 1
$exp = 4 ** 3; #output: 64

### String-Exclusive Operators
$greeting = "hi";
$concatenated = "hi" . "person\n"; #now: "hi person"
$repeat_greet = $greeting x 3; #now: "hihihi"
$concatenated .= "over there"; #now: "hi person over there"
$repeat_greet x= 2; #now: "hihihihihihi"
$concatenated =~ "\w"; #regex looking to match a word character in the concatenated variable
$greeting++; #now: "hj". the next alphabetic character after "i" is "j"

$alphanumeric = "A9"; #let's increment an alphanumeric
$alphanumeric++; #now: B0. The next digit from 9 is 0. We can't go to A0 since that's before A9, so A moves onto the next letter, B.
$alphanumeric++; #now: B1

### Comparison Operators
print "b" lt "g"; #returns 1 because b is before g on the alphabet
print 2 <=> 4; #returns -1 because 2 is smaller than 4
print "bananas" cmp "apples"; #returns 1 because bananas are larger than apples
#### Pitfall test
print "Equal." if ("red" == "yellow"); #this ends up printing because the strings use a numerical operator "==", converting them both to 0.
print "Equal." if ("red" eq "yellow"); #instead, use eq. "Equal." will not print as a result.

### Logical Operators
print "\n";
$x = 5 < 2 || 3 < 9; #output: 1 (true)
$y = 5 < 2 or 3 < 9;  #output: "" (false)
$z = ((5 < 2) xor (3 < 9)); #output: 1 (true, left is 0 and right is 1)
$a = ((5 < 2) // (3 < 9)); #output "" (false, the left operand is false and thus does not exist)

### Bitwise Operators
$m = 5; #0b0101 
$n = 3; #0b0011

print "\n";
print $m & $n; #output: 1 (creates: 0b0001)
print $m | $n; #output: 7 (creates: 0b0111)
print $m ^ $n; #output: 6 (creates: 0b0110)
print $m << 1; #output: 10 (creates: 0b1010)
print $m >> 1; #output: 2 (creates: 0b0010)

## Array Operators 
print "\n";
@animals = ("cow", "chicken", "flamingo", "bunny", "cat", 'dog');
print @animals[4]; #outputs cat, at index 4
print @animals[3..5]; #outputs bunnycatdog at indeices 3 through 5
print $#animals; #outputs 5

print "\n";
print("a".."n"); #outputs abcdefghijklmn
print("66".."70"); #prints 6667686970... space it out 

## Using Operators on Different Data Types
### Numeric operators on strings
print "\n";
$apple = "10 apples";
$apple *= 2; #outputs 20. because Perl reads 10 and automatically assumes the string is a number, not a character string
$bananas = "bananas in bunches of 5";
$bananas *= 3; #outputs 0. 5 isn't in front of the string, so the entire string just renders as 0 times whatever number
#### strings with numerics
$fruit_1 = "2 pineapples";
$fruit_2 = "5 tangerines";
$fruits = $fruit_1 + $fruit_2; #outputs 7, because 2+5 is recognized as the first characters in the strings
#### strings with non-numerics
$good_fruit = "good" + "fruit"; #outputs 0


### String operators on numbers
$concatenate_attempt = 10 . 5; 
print $concatenate_attempt; #simply converts them into strings. output: 105

### Numeric operators on arrays
print "\n";
@apples = ("green", "yellow", "red");
print @apples + 5; #outputs 8 (3 elements plus 5)

### Numeric operators on hash
print "\n";
%clothes = (shirts => 20, jeans => 5, shoes => 10, foo => 10);
print %clothes + 9 + '\n'; #outputs 13 (4 keys plus 9)
