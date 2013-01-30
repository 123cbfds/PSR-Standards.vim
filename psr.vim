" This is a quick script that ill correct inconsistencies in php scripts

function! PSRIt()

    " Save the position of the cursor so that it can be restored later
    let save_cursor = getpos(".")

    " Move the curly braces after the Class/method declaration to a new line
    silent! :%s/\([Class|class|function]\) \(.*\) {/\1 \2\r{

    " get rid of spaces around the arguments in brackets
    silent! :%s/( /(/g

    " get rid of spaces around the arguments in brackets
    silent! :%s/ )/)/g

	" Use 4 spaces instead of tabs
	silent! :%s/\t/    /g

	" DO NOT put parenthesis next to keywords
	" but instead seperate them with a space
	silent! :%s/\(while|if|for|do|switch|foreach|throw|catch|declare|return|try\)(/\1 (

    " Make sure that methods don't have a space after the method name
    silent! :%s/\(\%(\^\s*\)function\) \(.*\) (/\1 \2(

	" Boolean checks on statements should ask if make sure that the function
	" does not retuen a false result as such
	" if (FALSE != funct())
	" so we want to replace anything that looks like this
	" if (!function())
	" with this
	" if (FALSE != function())
	silent! :%s/if\s*(!\s\=\(.*\)\s\=(/if (FALSE != \1(

    " include & require & statements not functions so remove parens
    silent! :%s/\(require|include\%(_once\)\?\)\s\?(\(.*\))/\1 \2

    " Restore the cursor position
    call setpos('.', save_cursor)

endfunction

" Call the psrIt function before the buffer is saved
" This will tidy the code up a bit should there be mistakes
autocmd BufWritePre *.php call PSRIt()

