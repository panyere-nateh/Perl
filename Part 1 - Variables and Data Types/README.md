This section discusses the main building blocks and data types that come with running and coding a Perl program.

## Tutorial Chapters
1. [Variables and Data Types](1%20-%20Variables%20and%20Data%20Types/1%20-%20Variables%20and%20Data%20Types.md)
2. [Operators](2%20-%20Operators/2%20-%20Operators.md)
3. [Keywords and Reserved Words](Keywords%20and%20Reserved%20Words.md)

## Comments!
In my code snippets, you'll see some comments. You can make similar inline comments in Perl using the `#` tag. 

Perl also allows multi-line comments using the POD (Plain Old Documentation) syntax. There are two ways you could do this [[1](https://www.educba.com/perl-block-comment/), [2](https://www.perl.com/pub/2002/08/13/comment.html/)]:
```perl
=pod
    This is commented text.
    Multi-line comments in Perl can be hidden with =pod, then ended with =cut.
=cut
```
and 
```perl
=begin
    This is commented text.
    Multi-line comments in Perl can also be hidden with =begin, then ended with =end.
=end
```
The third method is the quote operator: `q{ }`.
```perl
q{
    This is commented text.
    This won't show.
}
```
