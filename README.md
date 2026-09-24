# Perl
This is an undergraduate project going over the programming language Perl.

## About Perl
Perl is an interpreted programming language created by Larry Wall in 1987. Perl stands for *Practical Extraction and Report Language*, as the developer wanted an easy way to extract and manipulate text data on the UNIX operating system. [[1](https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/intro/history.html)]

Perl is widely used for processing text. For example, you can pattern match, apply regular expressions, or parse strings when reading massive sets of data with Perl. It's also applied in web development, system administration, finance, and bioinformatics, and can perform automated tasks. [[2](http://www.catb.org/esr/writings/taoup/html/ch14s04.html#perl)] [[3](https://www.cio.com/article/274154/developer-you-used-perl-to-write-what.html)] [[4](https://www.youtube.com/watch?v=RCHhAEjEjKw)]

Web brands like Yahoo!, Amazon, Craiglist, iMDb as well as The Human Genome project were built on Perl, and it has been integrated in operating systems like Unix, Linux, Windows and macOS.

## Installing Perl
You can download the installer for Perl on its official website [here](https://www.perl.org/get.html)

Perl already comes installed on macOS and Linux/Unix platforms, but Windows users will have to go through the installation process. It is strongly recommended for Windows users to download "[Strawberry Perl](https://strawberryperl.com/)" as it sets up the tools for them to run Perl as intended on a Unix system.

## Getting started on Perl
Perl programs are typically run on a computer's command line interface or its system terminal.

As a Windows user, I use [VSCode](https://code.visualstudio.com/) as my preferred programming environment. If you choose to do so, you have to install "Perl Navigator" and the "Code Runner" [5] extensions for a streamlined experience in running Perl in VS Code. 
### Running "Hello World!"
We can now get started in coding Perl. Open any text editor and type the following in a new file, then save said file under the ".pl" extension:
```
#!/usr/local/bin/perl
print "Hello world!";
```
When you run this file, your terminal should output a simple "Hello world!". In the first line of the code, it tells the operating system the file path of the Perl interpreter. This is denoted by the she-bang symbol "#!", which is a feature specific to Linux environments. We have to include this line in *every* Perl program to make it executable. But this is ignored in Windows, so don't worry too much about it. [[6](https://www.cs.unc.edu/~jbs/resources/perl/perl-cgi/step1.html)] [[7](https://dev.to/grinnz/the-perl-shebang-1ojg)]

Then, the second line of the code calls the "print" function to output the input string "Hello world!". At the end, we close off with a semicolon (;), which we must include for every statement in Perl.

We can also include escape sequences such as "\n" in our string and print both " Hello " and " World! " on different lines.
```
#!/usr/local/bin/perl
print "Hello\nworld!";
```
Let's try running both lines together.
```
#!/usr/local/bin/perl
print "Hello world!";
print "Hello\nworld!";
```
You may notice that your output looks something like
```
Hello world!Hello
world!
```
which is pretty off-putting. It's recommended to add an escape sequence at the end of every string if you want them outputted on different lines. So we can revise our code to look like:
```
#  !/usr/local/bin/perl
print "Hello world!\n";
print "Hello\nworld!";
```

<!-- ## Variables
### Mutable Variables
### Immutable Variables

## Comments

## Booleans

## Operators
### Arithmetic Operators
### Comparison Operators
### Logical operators
### Assignment Operators
include incremental operator

## Conditional Statements
### "if"
An if statement in Perl is denoted as "if".
### "elsif"
An else-if statement in Perl is denoted as "elsif".
### "else"
An else statement in Perl is denoted as "else".

## Loops

## Functions

## Recursion
Perl supports recursive routines. 

## Objects and classes-->

## Notes and References
[1] https://www.shlomifish.org/lecture/Perl/Newbies/lecture1/intro/history.html \
[2] http://www.catb.org/esr/writings/taoup/html/ch14s04.html#perl \
[3] https://www.cio.com/article/274154/developer-you-used-perl-to-write-what.html \
[4] https://www.youtube.com/watch?v=RCHhAEjEjKw \
[5] https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner - Note that the Code Runner extension in VS Code displays your program's output on a tab called "Output" instead of the Terminal. You can right-click a dropdown menu and see an option called "Run in terminal", or adjust the settings so that Code Runner runs in the terminal instead. \
[6] https://www.cs.unc.edu/~jbs/resources/perl/perl-cgi/step1.html \
[7] https://dev.to/grinnz/the-perl-shebang-1ojg \
