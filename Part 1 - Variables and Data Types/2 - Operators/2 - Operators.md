# Operators
Similar to other programming languages, we can perform actions on variables and data types using operators.

## Scalar Operators
These operators are intended for scalar data types. 
### Numeric-Exclusive Operators
Must be used with **numeric** data types. 
| Task                     |  Operator          |
|--------------------------|------------------  |
| Arithmetics              |     +,-,*,/,%,**   |
| Arithmetic Assignments   | +=,-=,*=,/=,%=,**= |
| Change a number's sign   |          -         |
| Increment/Decrement by 1 |       ++, --       |  

Note: An integer division operator doesn't exist in Perl.

### String-Exclusive Operators
Must be used with **string** data types. [[1](https://www.geeksforgeeks.org/perl/perl-string-operators/)]

| Task                                                     |  Operator          |
|----------------------------------------------------------|------------------  |
| Concatenation                                            |         .          |
| Repeating a string for an integer ``n`` amount of times  |         x  `n`     |
| Assignment Operators for repeating strings               |       .=, x=       |  
| Regular Expressions (Match/Negation Binding)             |       =~, /!~      |
| Increment a string alphabetically/alphanumerically       |         ++         |
### Comparison Operators
Commonly used with **strings** and **numeric** data types.
| Task                      |    String Op    |    Numeric Op    |
|---------------------------|-----------------|------------------|
| Greater than              |       gt        |        >         |
| Less than                 |       lt        |        <         |
| Greater than or equal to  |       ge        |        >=        |
| Less than or equal to     |       le        |        <=        |
| Equal to                  |       eq        |        ==        |
| Not equal to              |       ne        |        !=        |
| Three-way comparison      |       cmp       |        <=>       |

**Notes**: 
* Strings used in comparison operators are evaluated by alphabetical order (the smaller it is, the earlier it appears in a dictionary). [[2](https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/conditionals/string.html)]
* Perl string comparison is case-sensitive by default (e.g., `"John" eq "john"` would output false). Case-insensitive comparisons have to be done using the lc (lowercase) or uc (uppercase) functions for the strings to be comparable.
* <=> returns -1 if the left argument is less than the right argument, 1 if more than, and 0 if both arguments are equal. [[3](https://perldoc.perl.org/perlop)]
### Logical operators
Commonly used with **strings** and **numeric** data types. [[4](https://www.perl.com/article/32/2013/7/6/Use-the-logical-or-and-defined-or-operators-to-provide-default-subroutine-variable-behaviour/)]
| Task                                      | C-Style | Text-Style |
|-------------------------------------------|---------|------------|
| Check if all conditions are true          |   &&    |    and     |
| Check if at least one condition is true   |  \|\|   |    or      |
| Negates the result of a condition         |    !    |    not     |
| Check if both conditions are different    |         |    xor     |
| Checks if left-hand condition is defined  |   //    |            |

Perl utilizes two formats of logical operators: C-style and text-style. [[5](https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/conditionals/boolean.html)]

The C-style format is logical operators borrowed from the programming language [C](https://en.wikipedia.org/wiki/C_(programming_language)). They essentially function the same as their text-style equivalents, except they carry more precedence in a statement and group their operands tightly. [[6](https://en.wikibooks.org/wiki/Perl_Programming/Operators#Precedence)]

The text-style format carries less precedence and doesn't group its operands tightly (case-sensitive in lowercase).

For example, say we have the following:
```
$x = 5 < 2 || 3 < 9; 
$y = 5 < 2 or 3 < 9; 
```
* `$x` would return true, while `$y` returns false. This is because `$x` looks at both sides of the operator as if there were parentheses wrapped around it due to the high precedence of `||`. 
* Meanwhile, `$y` runs from left to right since `or` has a low precedence. Perl's interpreter would first perform the assignment `$y = 5`, then perform the comparison operator (`$y < 2` returns `""`), then the `or` statement (`0 or 3` returns 3), and finally the last comparison operator (`3 < 9` returns `""`).
* It is strongly recommended to use text-style logical operators for control flow statements (if, else, elsif) and C-style operators for most general uses of logic. [[3](https://perldoc.perl.org/perlop)] <!-- might link my loop section here -->

Note that Perl does not have a dedicated Boolean data type (TRUE/FALSE) that some programming languages come with. Instead, logical operators return `1` for TRUE statements and `0` for FALSE statements. [[7](https://www.geeksforgeeks.org/computer-science-fundamentals/perl-boolean-values/)]

False values in Perl are the following: [[8](https://perlmaven.com/boolean-values-in-perl)]
* The number `0`
* The string `"0"`
* An empty string `""`
* An empty array `()`
* An undefined value, or literally `undef`

Any other non-zero value is counted as True. Take note that these pitfalls are also considered True:
* A string with a space in it `" "`
* Two or more zeroes in a string `"00"`
* 0 followed by a newline `"0\n"`
* The string "false" `"false"` or `"False"`

### Bitwise Operators
Commonly used with **strings** and **numeric** data types. These operators manipulate a value's data by their individual bits (0's and 1's), which result in a different value output.
| Task                                            | Operator |
|-------------------------------------------------|----------|
| Writes bits that exist in BOTH operands         |   &, &=  |
| Writes bits that exist in at least one operand  |  \|, \|= |
| Change a 0 bit -> 1 bit and a 1 bit -> 0 bit    |   ~, ~=  | 
| Writes bits that exists in only one operand     |    ^     |
| Moves all bits to the left `n` amount of times  | <<, <<=  |
| Moves all bits to the right `n` amount of times | >>, >>=  |

## Array Operators
These operators are used with array variables. [[9](https://www.learn-perl.org/en/Arrays)]
| Task                                                      |  Operator               |
|-----------------------------------------------------------|-------------------------|
| Accessing an array's element by index # `n`               |  `array_name[n]`        |
| Create a range of numbers or letters                      |  `('a'..'z')`, `(1..5)` |
| Slice an array using `[ ]` and `..` from indices m to n   |   `array_name[m..n]`    |
| Get the last index position of an array                   |     `$#array_name`      |  

## Mixing Data Types with Operators 
Perl is considered a weakly typed language that allows you to easily mix different data types with operators, though some combinations are inappropiate for certain contexts.

If you end up using numeric operators (arithmetic, comparison, assignment) on non-numeric data types and non-scalar variables, they will be implicitly converted into a numeric context. [[10](https://www.modernperlbooks.com/books/modern_perl_2014/04-perl-operators)]

* When using numeric operators on a string, Perl attempts to convert that string into a number. Strings that begin with a letter character are converted in the number 0 by default, as shown in the [2 - Operators.pl](https://github.com/panyere-nateh/Perl/blob/main/Part%201%20-%20Variables%20and%20Functions%20(Subroutines)/2%20-%20Operators/2%20-%20Operators.pl) file. [[11](https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/Perl1_Basics.html)]
    * For example, if you were to compare the string `"unicorn"` with the number `0`, Perl would consider them equal, because all strings are defined as 0.
    * If you were to compare the string `"unicorn"` with the number `5`, Perl would not consider them equal.

* When using numeric operators on an array, Perl reads the number of elements rather than the array itself. [[12](https://www.math.utah.edu/docs/info/perl_6.html), [3](https://perldoc.perl.org/perlop)]
    * For example, if you have the array `@apples = ("green", "yellow", "red")`, performing `@apples + 5` would output 8, as `@apples` is viewed as having 3 elements.

* When using numeric operators on a hash, Perl reads the number of keys. [[13](https://www.geeksforgeeks.org/perl/perl-hash-in-scalar-and-list-context/)]
    * For example, if you have the hash `%clothes = (shirts => 20, jeans => 5, shoes => 10);`, performing `%clothes + 9` would output 12, as `%clothes` is viewed as having 3 keys
    * A more standard method of performing numeric operators on a hash is utilizing the value instead. For example: ``$clothes{jeans}++`` or ``$clothes{jeans} += 1`` would change the value of jeans to 6.

Perl operators determine the context of their operations at compile time. [[3](https://perldoc.perl.org/perlop)]

## References
[1] https://www.geeksforgeeks.org/perl/perl-string-operators/ \
[2] https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/conditionals/string.html \
[3] https://perldoc.perl.org/perlop \
[4] https://www.perl.com/article/32/2013/7/6/Use-the-logical-or-and-defined-or-operators-to-provide-default-subroutine-variable-behaviour/ \
[5] https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/conditionals/boolean.html \
[6] https://en.wikibooks.org/wiki/Perl_Programming/Operators#Precedence \
[7] https://www.geeksforgeeks.org/computer-science-fundamentals/perl-boolean-values/ \
[8] https://perlmaven.com/boolean-values-in-perl \
[9] https://www.learn-perl.org/en/Arrays \
[10] https://www.modernperlbooks.com/books/modern_perl_2014/04-perl-operators \
[11] https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/Perl1_Basics.html \
[12] https://www.math.utah.edu/docs/info/perl_6.html \
[13] https://www.geeksforgeeks.org/perl/perl-hash-in-scalar-and-list-context/ \
