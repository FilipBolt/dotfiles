let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" autoclose after completion
let g:ycm_autoclose_preview_window_after_completion=1
" goto definition shortcut
noremap <leader>g :YcmCompleter GoTo<CR>
