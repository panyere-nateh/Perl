# When defining subroutines/functions in Perl, you don't typically write the passed arguments next to the variable definition
# This is because in Perl, all parameters in a function call (as in multiply(1,2)) are carried in a list. 
# Put shortly, the "()" in a function call is a literal list.
# Perl passes arguments by reference (pass-by-reference) using the '@_' or '$_' aliases to copy the values used in the original function call

# A function that takes in two numbers, multiplies them, and returns the output
## Method 1: Assign passed arguments to an array (the standard method)
sub multiply1 {
    ($a, $b) = @_;
    return $a * $b;
}

## Method 2: Accessing the array values through list indexing
sub multiply2 {
    return $_[0] * $_[1]; 
}

print multiply1(3,6) . "\n"; #18
print multiply2(3,6) . "\n"; #18

# A function that calculates factorials (using recursion)
sub factorial {
    my ($n) = @_; #use "my", so that the variable is considered local and can update per recursion (otherwise 1 is returned because the function overwrites itself)
    return 1 if $n <= 1;
    return($n * factorial($n - 1));
};

print factorial(4) . "\n"; # Output: 24
print factorial(6) . "\n"; # Output: 720

# A function that takes in a string and splits it into two
sub string_split {
    my ($str) = @_;

    my $mid = int(length($str) / 2); #midpoint index of the string, converted into an integer
    
    # used Perl's built-in substr function. This has... mixed results depending on the string input
    my $first_half  = substr($str, 0, $mid); #from index 0 to the middle half (stated explicitly)
    my $second_half = substr($str, $mid); #from the middle half to the end (found implicitly)

    return ($first_half, $second_half); #return split string in a list
}

## assigning the returned list values to another list. then printing the variable values of the split text assignments
($one, $two) = string_split("Hello World!\n");
print $one . "\n";
print $two . "\n";

($one, $two) = string_split("HelloWorld!\n");
print $one . "\n";
print $two . "\n";

($one, $two) = string_split("Perl is great.\n");
print $one . "\n";
print $two . "\n";

# A function that tests whether your language is pass-by-reference or pass-by-value.

## Perl is pass-by-reference because parameters are called by reference
## Changing the value of a function call's argument in the function also changes their value globally
## Source: https://www.geeksforgeeks.org/perl/perl-pass-by-reference/

@a = (0..10); #we have an array called a, consisting of values 1-10
print "Values of array before function call: @a\n";

change(@a); #perfom function "change" on array a
print "Values of array after function call: @a"; #check change

sub change { 
    $_[0] = "A";
    $_[1] = "B";
}
