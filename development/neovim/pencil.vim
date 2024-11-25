augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({"wrap": "soft"})
  autocmd FileType text         call pencil#init({"wrap": "soft"})
augroup END
