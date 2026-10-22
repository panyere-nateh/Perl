#if statement
## Let's test two types of if statements: a true and false one
## We will check if a number is even or not using remainder division as a condition.
$num = 5;
if ($num % 2 == 0) {print "Even!\n";}

# if-elsif
## With the if-elsif ladder, we must specifiy conditions for both clauses
if ($num % 2 == 0) {print "Even!\n";}
elsif ($num % 2 == 1) {print "Odd!\n";}

# * if-else
## With the if-else ladder, we don't have to specify a condition for the else clause
if ($num % 2 == 0) {print "Even!\n";}
else {print "Odd!\n";}

# if-elsif-else
## Let's try remainder divsion again by finding a multiple of 9 or 3. What code chunk do you think will execute?
$num = 799;
if ($num % 9 == 0) {print "Multiple of 3!\n";}
elsif ($num % 3 == 0) {print "Multiple of 3!\n";}
else {print "Not a multiple of 3 or 9!\n";}

# Nested if's
## We can nest if statements in another. If the first if statement is correct, then the code continues on to check if the nested if statement is correct too
$num = 40;
if ($num > 10) {
    if ($num > 20) {
     print("40 is bigger than both 10 and 20!\n");
    }
}
##Logical operators are a more optimal alternative to this.

# unless
## will execute if the given condition is false
$num = 21;
unless ($num > 34) {
    print("21 is nor bigger than 34!\n")
}

# unless-elsif
## ditto as above. what do you think will execute? the unless clause or the elsif clause?
$apples = "green";
unless ($apples eq "green") {
    print("Apples are not Green!\n")
}
elsif (not($apples eq "red")) {
    print("Apples are Green!\n")
}

# unless-elsif-else
## let's apply complex logical operators
$num = 6;
unless ($num > 9 || 5 < 1) {
    print("Perl 1");
}
elsif ($num > 9 && 5 < 1) {
    print("Perl 2");
}
else {
    print("Perl 3");
}

# unless-else
$num = 100;
unless ($num % 2 == 0) {
    print($num . "is even?\n");
}
else {
     print($num . "is even!\n");
}

# Nested unless's
$num = 99;
unless ($num < 2 && $num > 0) {
    unless ($num * 2 == 9999) {
        print("Two wrongs make a right in unless statements!");
    }
}