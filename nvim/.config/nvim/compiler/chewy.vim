if exists("current_compiler")
  finish
endif
let current_compiler = "chewy"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" CompilerSet errorformat=%A%f:%l:%c:%m,%-G\\s%#,%-G%*\\d\ problem%.%#
CompilerSet makeprg=\{\ npx\ eslint\ -f\ unix\ --ext\ ts,tsx,js\ ./src/main/js\ --quiet;\ npx\ stylelint\ -f\ unix\ "./src/main/js/**/*/{css,scss}"\ --quiet\ \}
