function! QuoteNumberList()
  execute "normal! :%s#\<space>#\\r#\<cr>ggGI'G$A'Gk$A,VGgJ0$h"
endfunction

function! MakeHashComment()
  execute "normal! A #0VypVr#yykPj"
endfunction
