# Truth Table

## Description

The gem of truth

## Summary

Generate a truth table for a logical expression

## Usage

To use, pass a logical expression consiting of varibale names and logical operators.

    $ irb -r 'truth-table'
    > tt = TruthTable.new("(a && b) || c")
    > puts tt.table_string
     a | b | c | (a && b) || c 
	---┼---┼---┼---------------
 	 T | T | T |      T 
 	 T | T | F |      T 
 	 T | F | T |      T 
 	 T | F | F |      F 
	 F | T | T |      T 
	 F | T | F |      F 
	 F | F | T |      T 
	 F | F | F |      F 

Variable names must begin with a lower case letter and be alphanumeric with underscores.

Accepted operators:

* and
* or
* &&
* ||
* !
* not
* ^
* xor (gets converted to ^)

## License

Copyright (c) 2012 Les Fletcher

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
