# Variables and Data Types
Writing variables in Perl is pretty straightforward. Similar to Python, they only need a name and an assigned value.

Because Perl is dynamically typed [[1](https://web.eecs.utk.edu/~bvanderz/cs465/notes/perl/perl1.html)], we don't need to explicity declare a variable's data type. Instead, Perl implicity determines the type at runtime. Variables are also mutable, so we can freely overwrite and change a variable's stored value. 

However, we still have to specify the structure of values that a variable can hold. Perl lets us do this by using [sigils](https://en.wikipedia.org/wiki/Sigil_(computer_programming)). These sigils allow for three types of variables in Perl:
* **[Scalars](#scalars)**
* **[Arrays](#arrays)**
* **[Hashes](#hashes)**

## Scalars
Scalars are variables that carry a single value [[2](https://en.wikibooks.org/wiki/Perl_Programming/Data_types)]. This variable type is tagged with the "$" sigil.

Scalars can hold three data types: **numbers**, **strings** or a **reference**.

### Strings
First let's look at strings. Remember the "Hello World!.pl" file? There, the code printed a string by itself. We can assign this data type to variables too.  
```perl
$string1 = "Coding in Perl";
$string2 = "is so much";
$string3 = "fun!";
```
We can print these strings too! But, if we just printed by itself, we will get the following output:
```perl
print $string1;
print $string2;
print $string3;

#Output: Coding in Perlis so muchfun!
```

Again, we should utilize the escape sequence "\n" to structure our strings. There are several ways to do this, including interpolating strings and concatenating them.

**Method #1:** Print line by line using string interpolation
```perl
print "$string1\n";
print "$string2\n";
print "$string3\n";

#Output:
#Coding in Perl
#is so much
#fun!
```

**Method #2:** Print line by line using using concatenation
```perl
print $string1. "\n";
print $string2. "\n";
print $string3. "\n";

#Output:
#Coding in Perl
#is so much
#fun!
```

**Method #3:** Print in one line using string interpolation
```perl
print "$string1 $string2 $string3\n";

#Output:
#Coding in Perl is so much fun!
```

**Method #4:** Print in one line using concatenation
```perl
print $string1 . " " . $string2 . " " . $string3 . "\n";
#Output:
#Coding in Perl is so much fun!
```
So, what were are all these code snippets doing? Methods 1 and 3 utilize a technique called string interpolation, where you insert a variable inside the quotes of a string. Unlike in other programming languages, you don't need to convert non-string variables into a string, Perl does it for you. You also can combine string variables with regular text in a string. Try running this snippet `print "Hey! I think $string1 $string2 $string3 Don't you agree?\n";` and test what it outputs.
* **NOTE:** Variables do not interpolate in single quotes. Running `print 'Hey! $string1\n';` prints `Hey! $string1\n` without accessing the variable's value.

Meanwhile, Methods 2 and 4 utilize a technique called concatenation. Perl utilizes the dot operator (.) to connect different data types into one string. [[3](https://www.perl.com/article/8/2013/3/31/Perl-string-functions---concatenate-substring-and-split/)] It's handy when you don't want to wrap your variables into entire quotation marks. 

### Numbers
Now, let's look at the different kinds of number notation we can work with in Perl.
```perl
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
```
&emsp;[*Source, pages 33-34 of First Steps In Perl*](https://docs.google.com/viewer?url=https%3A%2F%2Fblob.perl.org%2Fbooks%2Fbeginning-perl%2F3145_Chap01.pdf)

Note that Perl lacks the float or double data type that some programming languages have. All decimals in Perl are classified as numerics. 

Perl can also store numbers as strings. If you perform arithmetics on numerical strings, Perl converts them into an integer or decimal to compute them. [[5](https://floating-point-gui.de/languages/perl/)]

### References 
References are a scalar variable that points to another piece of data. [[6](https://www.cs.ait.ac.th/~on/O/oreilly/perl/perlnut/ch04_02.htm)] Similar to a pointer in C, they allow a variable to access a value's location. [[7](https://www.cs.cmu.edu/~zhirong/perl/ch18.htm)] 

To assign a reference, we use the `\` operator before the name of a variable being assigned:
```perl
$var = 10;
$pointer = \$var; #the pointer variable carries the address of the $var variable
print $pointer; #output: SCALAR(0x2727f30d398)
```
We can dereference the pointer variable by adding an extra `$` sigil behind it:
```perl
print $$pointer; #output: 10
```
References doesn't just point to scalars, but also arrays and hashes too, allowing us to create complex data structures. [[7](https://www.cs.cmu.edu/~zhirong/perl/ch18.htm)] 

## Arrays
Also called a list, this is a variable that carries an ordered collection of scalars. [[2](https://en.wikibooks.org/wiki/Perl_Programming/Data_types)]. This variable type is tagged with the "@" sigil.

The first index of all Perl arrays is counted as 0. So the last index of an array with 7 elements is 6. [[6](https://www.cs.ait.ac.th/~on/O/oreilly/perl/perlnut/ch04_02.htm)]

Here is an example of arrays in Perl:
```perl
@array_num = (1,2,3,4,5); #an array with numerical elements
@array_str = ("a","b","c"); #an array with string elements
@array_mixed = ("apples", 23, "sweaters", 78.5, "h", 0xfff); #arrays can also have a mix of numbers and strings
```
We can also access the values of arrays using the scalar variable tag ($) of the variable name, square brackets, and the index.
```perl
print $array_num[4]; #output: 5
print $array_num[-1]; #output: 5 (count backwards)
print $array_mixed[-2]; #output: "h"

#changing the value of an array
$array_str[2] = "see";
print @array_str; #array_str now: ("a", "b", "see")
```
Arrays can also hold scalar variable names rather than the data. However, if you attempt to store an array within an array, Perl will convert it into a single array. [[8](https://medium.com/hackernoon/the-magic-of-array-references-in-perl-cb0bdd82a448)]

## Hashes
This is a variable that holds unordered collection of key-value pairs, similar to dictionaries in other programming languages. [[6](https://www.cs.ait.ac.th/~on/O/oreilly/perl/perlnut/ch04_02.htm)] This variable type is tagged with the "%" sigil.

Here, I'm making a hash variable called "food" in two ways:
```perl
#Hash Way 1
%food = ('cookies', 3, 'ice cream', 6); #key cookie has value 3. key ice cream has value 6.

#Hash Way s2 (the better way)
%food = (
    'cookies' => 3, 
    'ice cream' => 6

); 
```
Similar to lists, you can also access the value in a hash key using the scalar variable tag ($), curly brackets `{ }`, and the name of a key.
```perl
#Accesing values in a hash
%grades = (
    "ELA" => "A-",
    "Math" => "B+",
    "History" => "B-",
    "Science" => "C+"
);

print $grades{"History"} . "\n"; #Output: B-
$grades{"Math"} = "A+"; #changing my math grade to an A+
print %grades{"Math"} . "\n"; #Output: A+
```

## Variable Naming Conventions!
Most Perl programmers agree that the language's variable names should...
* start with a letter followed by alphanumeric characters and underscores
* start with an underscore followed by a letter, then alphanumeric characters and underscores

According to [Perl's style guide documentation](https://perldoc.perl.org/perlvar#The-Syntax-of-Variable-Names), the name syntax for Perl variables primarily follow:
| Naming Convention     |  Use                           |
|-----------------------|--------------------------------|
|   $Pascal_Case        | for global variables           |
|   $snake_case         | for local variables (ex. `my $x`) |
| $SCREAMING_SNAKE_CASE | for constants                    |


Another fun fact: A scalar, array and hash variable can share the same name in Perl. However, if you assign a value to a scalar variable using ``{}`` or ``[]``, and it happens to share the same name with a array/hash variable, the value in the index ends up being overwritten. [[8](https://www.stat.berkeley.edu/~spector/extension/perl/notes/node16.html)] Either way, try not to have overlapping variable names in your Perl programs.

## Notes and References
[1] https://web.eecs.utk.edu/~bvanderz/cs465/notes/perl/perl1.html \
[2] https://en.wikibooks.org/wiki/Perl_Programming/Data_types \
[3] https://www.perl.com/article/8/2013/3/31/Perl-string-functions---concatenate-substring-and-split/ \
[4] https://docs.google.com/viewer?url=https%3A%2F%2Fblob.perl.org%2Fbooks%2Fbeginning-perl%2F3145_Chap01.pdf \
[5] https://floating-point-gui.de/languages/perl/ \
[6] https://www.cs.ait.ac.th/~on/O/oreilly/perl/perlnut/ch04_02.htm \
[7] https://www.cs.cmu.edu/~zhirong/perl/ch18.htm \
[8] https://medium.com/hackernoon/the-magic-of-array-references-in-perl-cb0bdd82a448 \