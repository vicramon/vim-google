fun! URLEncode(params)
  let params =  system("echo $(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' \"" . a:params . "\")")
  return params
endfun

fun! Google(ft, ...)
  let params = join(a:000, " ")
  let encoded_params = URLEncode(params)
  let url = "http://www.google.com/search?q=" . encoded_params
  silent! exe "!open " . shellescape(url, 1) | redraw!
endfun

command! -nargs=* -range Google :call Google('', <f-args>)

nnoremap <leader>g :Google<space>
