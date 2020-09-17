nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', ['nested', 'toggle']) :
  \ defx#do_action('multi', ['drop', 'quit'])
nnoremap <silent><buffer><expr> o defx#do_action('open_directory')
nnoremap <silent><buffer><expr> r defx#do_action('rename')
nnoremap <silent><buffer><expr> d defx#do_action('remove')
nnoremap <silent><buffer><expr> m defx#do_action('move')
nnoremap <silent><buffer><expr> A defx#do_action('new_directory')
nnoremap <silent><buffer><expr> a defx#do_action('new_file')
nnoremap <silent><buffer><expr> P defx#do_action('paste')
nnoremap <silent><buffer><expr> y defx#do_action('yank_path')
nnoremap <silent><buffer><expr> q defx#do_action('quit')
nnoremap <silent><buffer><expr> P defx#do_action('preview')
nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
nnoremap <silent><buffer><expr> p defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
nnoremap <silent><buffer><expr> S defx#do_action('search')

call defx#custom#column('indent', {
  \ 'indent': ' │ ',
  \ })
