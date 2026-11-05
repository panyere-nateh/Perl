# Conditional Statements
Like many other programming languages, Perl allows us to decide what chunks of code should be executed.
## if/elsif/else/unless
| Clause | Task                                                                                                |
|--------|-----------------------------------------------------------------------------------------------------|
| if     | Executes the following block of code when its given condition is true.                              |
| elsif  | Executes the following block of code when its given condition is true AND the `if` clause is false. |
| else   | Executes the following block of code when all `if` or `elsif` statements are false.                 |
| unless | The opposite of `if`. Executes the following block of code when its given conditon is false.        |  

Conditional statements in Perl are always written with a parentheses `( )` containing the condition, and curly brackets `{ }` containing the code chunk:
```perl
if (condition) {
    -- code block here is executed --
}
```
Depending on the number of conditions you're tracking, Perl supports these following decision-making ladders: [[1](https://www.geeksforgeeks.org/perl/perl-decision-making-if-if-else-nested-if-if-elsif-ladder-unless-unless-else-unless-elsif/)]
* if
* if-elsif
* if-elsif-else
* if-else
* Nested if's
* unless
* unless-elsif
* unless-elsif-else
* unless-else
* Nested unless's

To see examples of code implementing these statements, check: [1 - Conditional Statements.pl](1%20-%20Conditional%20Statements.pl)

## Switch Statements
Perl also supports switch-case statements found in other programming languages called `given-when` statements. They take a given variable and compare it to other values to decide what to execute. [[2](https://www.geeksforgeeks.org/perl/perl-given-when-statement/)]
```perl
given(expression)
{
    when(value1) {Statement;}
    when(value2) {Statement;}

    default {# Code if no other case matches}
}
```

## Notes
* Perl does not have a dedicated Boolean data type (TRUE/FALSE) that some programming languages come with. Instead, logical operators return 1 for TRUE statements and 0 for FALSE statements. 
* Since Perl uses `{ }` as delimiters, dangling else problems aren't an issue. 
* As demonstated with the `&&`/`AND` and `||`/`OR` operators, [Perl supports short-circuit evaluation](https://github.com/panyere-nateh/Perl/blob/4389c707677d97353a53a7c1f53ab514b9e8d64f/Part%202%20-%20Conditional%20Statements%20and%20Loops/1%20-%20Conditional%20Statements/1%20-%20Conditional%20Statements.pl#L81).

## References
[1] https://www.geeksforgeeks.org/perl/perl-decision-making-if-if-else-nested-if-if-elsif-ladder-unless-unless-else-unless-elsif/ \
[2] https://www.geeksforgeeks.org/perl/perl-given-when-statement/
