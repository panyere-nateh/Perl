# Loops
We can use loops in Perl to repeatedly execute a chunk of code without having to write it manually.

To see examples of code implementing these loops, check: [2 - Loops.pl](2%20-%20Loops%20.pl)

## Loop Types
Perl tests the condition of a loop before it is executed. [[1](https://www.tutorialspoint.com/perl/perl_loops.htm)]
| Term       | Task                                                                                                      |
|------------|-----------------------------------------------------------------------------------------------------------|
| for        | Executes a sequence of statements multiple times and abbreviates the code that manages the loop variable. |
| foreach    | Iterates over an array's value and sets the variable VAR to be each element of the list in turn.          |
| while      | Repeats a statement or group of statements while a given condition is true.                               |
| do...while | Like a while statement, except that it tests the condition at the end of the loop body                    |  
| until      | The opposite of a while loop. Repeats a statement or group of statements until a given condition is true. | 

Similar to conditional statements in the previous section, loops in Perl are always written with a parentheses `( )` containing the condition, and curly brackets `{ }` containing the code chunk:
```perl
while (condition) {
    -- code block here is executed until the condition is false--
}

for ($i = 0; $i < 3; $i++) {
    -- code block here is executed 3 times--
}
```
This is different for `foreach` loops. While `for` and `foreach` can be used interchangeably, it is widely accepted to pass in an array or an array variable, instead of a standard condition [[2](https://dev.to/lnationorg/learning-perl-loops-and-iteration-5e71)]:
```perl
foreach $item (@array_name) {
    -- code block here is executed --
}
```

## Loop Control Statements
We can control when a loop's decision to execute code using these keywords [[1](https://www.tutorialspoint.com/perl/perl_loops.htm)]: 
| Term     | Task                                                                                                           |
|----------|----------------------------------------------------------------------------------------------------------------|
| next     | Skips the rest of the current loop body moves on to the next loop iteration/evaluation                         |
| last     | Terminates the entire loop  (similar to `break` in other lanugages)                                            |
| redo     | Restarts the loop block without evaluating the conditional again. The continue block, if any, is not executed. |  
| goto     | Transfers execution to a specified point in the program (similar to `jump` in other languages)                 |  

Note that `goto` statements can be written in the following forms: `goto label`, `goto expr`, and `goto &name`. [[3](https://perldoc.perl.org/functions/goto)]

There's also `continue`, a supplementary code block that's similar to a loop control statement, except that it must be followed by a code block. Continue blocks always execute at the end of a loop's iteration, right before its condition is evaluated again.

```perl
#we can use continue to increment the loop control variable of a while loop
$i = 0;
while ($i < 3) {
    print "Value: $i\n";
} continue {
    $i++; #Always executes before the condition ($i < 3) is checked again
}
``` 

`next`, `last`, or `redo` can appear in `continue` blocks. However, `last` and `redo` behave as if they had been executed within the main block. [[4](https://perldoc.perl.org/functions/continue)]
```perl
while (condition) {
    #[ redo in a continue block would jump back here]
    #[ Main body ]
    
} continue {
    #[ next in a main body would jump here ]
    #[ Continue body ]
} 
# [ last in either the main or continue body would jump here ]
```

If you used `continue` as is, with no code block following it, the term essentially functions as a `next` statement, skipping the rest of the of the loop code and moves onto the next loop iteration.
```perl
foreach my $num (1..3) {
    if ($num == 2) {
        continue; # Skips the print statement below
    }
    print "$num\n";
}
# Output:
# 1
# 3
```

## References
[1] https://www.tutorialspoint.com/perl/perl_loops.htm \
[2] https://dev.to/lnationorg/learning-perl-loops-and-iteration-5e71 \ 
[3] https://perldoc.perl.org/functions/goto \
[4] https://perldoc.perl.org/functions/continue \
