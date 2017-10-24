if !exists('g:test#javascript#webdriver#file_pattern')
  let g:test#javascript#webdriver#file_pattern = '\vtest/specs/.*\.js$'
endif

function! test#javascript#webdriver#test_file(file) abort
  return a:file =~# g:test#javascript#webdriver#file_pattern
    \ && !empty(glob('wdio.conf.js'))
endfunction

function! test#javascript#webdriver#build_position(type, position) abort
  return []

  if a:type == 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

function! test#javascript#webdriver#build_args(args) abort
  return ['wdio.conf.js'] + a:args
endfunction

function! test#javascript#webdriver#executable() abort
  if filereadable('node_modules/.bin/wdio')
    return 'node_modules/.bin/wdio'
  else
    return 'wdio'
  endif
endfunction
