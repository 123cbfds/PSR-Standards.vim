" This is a quick script that ill correct inconsistencies in php scripts

function! PSRIt()

    " Move the curly braces after the Class declaration to a new line
    silent! :%s/Class \(.*\) {/Class \1\r{

    " get rid of spaces around the arguments in brackets
    silent! %:s/( /(

    " get rid of spaces around the arguments in brackets
    silent! %:s/ )/)

	" Use 4 spaces instead of tabs
	silent! :%s/\t/    /g

	" DO NOT put parenthesis next to keywords
	" but instead seperate them with a space
	silent! :%s/\([while|if|for|do|switch|foreach|require|throw|catch|declare|function|require_once|include|include_once|return|try]\)(/\1 (

	" Boolean checks on statements should ask if make sure that the function
	" does not retuen a false result as such
	" if (FALSE != funct())
	" so we want to replace anything that looks like this
	" if (!function())
	" with this
	" if (FALSE != function())
	silent! :%s/if\s*(!\s\=\(.*\)\s\=(/if (FALSE != \1(

endfunction
