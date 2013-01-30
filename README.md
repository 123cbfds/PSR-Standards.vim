PSR-Standards.vim
=================

This is a very simple vim script that will some simple coding errors in order to
bring them in-line with the [PSR Coding Standards] (https://github.com/php-fig/fig-standards/tree/master/accepted). 

At the moment it just fixes simple errors such as space and curly brace issues.

It fixes the errors on saving.

##There may be side effects
As this script is very young and I am working on it as I carry coding my usual
project there may be unintentional side effects that I have not spotted.

##Installation
Simply drop it into your ~/.vim/plugin/ directory (for unix based systems)

##TODO
I obviously have to consider such things as how to tackle the incorrect naming
of methods inside classes etc (these should be camelCase). I do have several
options including renaming an incorrectly named method and insering a
placeholder e.g.

    Class eg
    {
        public static function test_function()
        {
            // Do stuff
        }
    }

Will turn into
    Class eg
    {
        public static function test_function()
        {
            Example::testFunction()
        }
        
        public static function testFunction()
        {
            // Do stuff
        }
    }

and other such options. The same goes for the namespacing issues with regards to
underscores.

##Other Stuff
I'm still new to this vimscript lark so if you have anything to add then please
let me know.


