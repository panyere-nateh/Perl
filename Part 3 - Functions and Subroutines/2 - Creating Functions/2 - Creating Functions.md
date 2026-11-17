# Creating Functions
Functions in Perl are called **subroutines**. Because of that, function declarations in perl are denoted using the `sub` keyword.

```perl
sub <function_name> {
    --function content goes here--
}
```
Compared to other programming languages, you may have noticed that the function declaration doesn't use parentheses carrying parameters. This is because Perl passes in their parameters within the code block instead using two methods: the `@_` array or list indexing with `$_[]`.
```perl
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
```
What's happening here is that all parameters in a function call (as in `multiply(3,6)`) are carried in a literal list, as in `(3,6)`. Because of that, the only way we can access these arguments is to use Perl's referencing alises: `@_` or `$_[]`. [[1](https://www.perl.com/article/passing-by/)]

An example of Perl passing by reference can be shown in this code snippet: 
```perl
@a = (0..10); #we have an array called a, consisting of values 0-10
print "Values of array before function call: @a\n"; # Output: 0 1 2 3 4 5 6 7 8 9 10

change(@a); #perfom function "change" on array a
print "Values of array after function call: @a"; # Output: A B 2 3 4 5 6 7 8 9 10

sub change { 
    $_[0] = "A"; #change index 0 to value A
    $_[1] = "B"; #change index 1 to value B
}
```
Here, we can see that even a global variable can have its values changed within a function due to the function accessing its reference value. [[2](https://www.geeksforgeeks.org/perl/perl-pass-by-reference/)]

## Local Variables and Scoping
So far, we have been working with global variables. But sometimes, passing these into Perl functions can lead to unintentional side-effects on the function's output. So, we use local variables instead. 

We create local variables to functions in Perl using the `my` keyword. Perl programmers typically use `my` even outside of functions, it's a helpful modifier that allows our variables to be tied (lexically) to whatever enclosing code block it's surrounded by. [[3](https://perldoc.perl.org/functions/my)] That way, we cant prevent our variables from being accidentally overwritten if we use the same variable name on another code chunk. [[4](https://www.geeksforgeeks.org/perl/perl-my-keyword/)]

It's also a handy way to manage your program's memory efficiently, because `my` variables only live inside its enclosed block (like `{}`), which are automatically destroyed out of the memory once that block finishes executing. [[5](https://www.perl.com/pub/2002/05/14/mod_perl.html/)]

```perl
# A function that takes in a string and splits it into two
sub string_split {
    my ($str) = @_;

    my $mid = int(length($str) / 2); #midpoint index of the string, converted into an integer
    
    # used Perl's built-in substr function. This has... mixed results depending on the string input
    my $first_half  = substr($str, 0, $mid); #from index 0 to the middle half (stated explicitly)
    my $second_half = substr($str, $mid); #from the middle half to the end (found implicitly)

    return ($first_half, $second_half); #return a list of two scalars in a list
}
```
The `$str` variable takes on a value from the parameters passed in the function call. However, the other variables, `$mid`, `$first_half` and `$second_half` are local variables only tied to the `string_split` subroutine. Therefore, we won't see their values if we called their variables names outside of the function.

Now let's check an unintentional side-effect when we don't use `my` on our function parameter using a recursive function:
```perl
# A function that calculates factorials (using recursion)
sub factorial {
    ($n) = @_;
    return undef if $n < 0;
    return 1 if $n <= 1;
    return($n * factorial($n - 1));
};

print factorial(4) . "\n"; # Output: 1
```
Without using `my` on the function parameter `$n`, the function ends up returning 1. This is because `$n` is considered a global variable not tied to the function, so every recursive call ends up overwriting `$n`, leading to the function performing 1 * (2-1) on the last call.

Once we use `my` on the function parameter, the variable is tied locally without being overwritten, and the recursion can perform smoothly as intended!
```perl
# A function that calculates factorials (using recursion)
sub factorial {
    my ($n) = @_; #use "my", so that the variable is considered local and can update per recursion
    return undef if $n < 0;
    return 1 if $n <= 1;
    return($n * factorial($n - 1));
};

print factorial(4) . "\n"; # Output: 24
print factorial(6) . "\n"; # Output: 720
```

Here are some handy keywords used to declare a variable's scope in Perl [[6](https://metacpan.org/pod/perlfunc#my-VARLIST), [7](https://metacpan.org/pod/perlfunc#our-VARLIST),[8](https://metacpan.org/pod/perlfunc#local-VARLIST), [9](https://metacpan.org/pod/perlfunc#state-VARLIST)]:
| Keyword | Use                                                                                  |
|---------|--------------------------------------------------------------------------------------|
|   my    | Declares the listed variables to be local (lexically) to the enclosing block or file |
|   our   | Makes a lexical alias to a package (i.e. global) variable of the same name in the current package for use within the current lexical scope. |
|  local  | Modifies the listed variables to be local (dynamically) to the enclosing block, file, or eval.  |
|  state  | Declares a lexically scoped variable, just like `my`. However, those variables will never be reinitialized.  |

## Recursion
Speaking of recursion, Perl offers a neat way to refer to recursion without needing to use the name again. We can use the `__SUB__` token, which returns a reference to the current subroutine, or `undef` outside of a subroutine. [[10](https://perldoc.perl.org/functions/__SUB__)]
```perl
sub factorial {
    my ($x) = @_;
    return undef if $n < 0;
    return 1 if $x == 1;
    return($x * __SUB__->( $x - 1 ) );
};
```

## Other Notes
* Because all declarations take effect at compile time, we can place Perl functions anywhere in our code file. [[11](https://perldoc.perl.org/perlsyn#Declarations)]
* When mixing data types like arrays or hashes in a function's parameters, `@_` ends up flattening them into one, unified array (rather than a nested array). So, you have to pass them as references: `\@array` and `\%hash`.
* All Perl variables are stored in a heap-like array, classified by references to their datatype SV, AV and HV. Lexical variables are destroyed when their lexical scope is exited, while package variables are destroyed once the program exits. [[12](https://perldoc.perl.org/5.005/perlguts)]

## References
[1] https://www.perl.com/article/passing-by/ \
[2] https://www.geeksforgeeks.org/perl/perl-pass-by-reference/ \
[3] https://perldoc.perl.org/functions/my \
[4] https://www.geeksforgeeks.org/perl/perl-my-keyword/ \
[5] https://www.perl.com/pub/2002/05/14/mod_perl.html/ \
[6] https://metacpan.org/pod/perlfunc#my-VARLIST \
[7] https://metacpan.org/pod/perlfunc#our-VARLIST \
[8] https://metacpan.org/pod/perlfunc#local-VARLIST \
[9] https://metacpan.org/pod/perlfunc#state-VARLIST \
[10] https://perldoc.perl.org/functions/__SUB__/ \
[11] https://perldoc.perl.org/perlsyn#Declarations \
[12] https://perldoc.perl.org/5.005/perlguts 


https://perldoc.perl.org/perlsub
