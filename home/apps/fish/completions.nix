{ lib, ... }:
let
  tldr_completions = ''
    # TLDR https://github.com/tldr-pages/tldr-python-client/issues/183
    complete -c tldr -s h -l help               -d "show this help message" -f
    complete -c tldr -s v -l version            -d "show program's version number" -f
    complete -c tldr -s u -l update -l update_cache     -d "Update the local cache of pages" -f
    complete -c tldr -s p -l platform           -d "Override the operating system" -xa "android linux osx freebsd netbsd openbsd sunos windows common" -f
    complete -c tldr -s l -l list               -d "List all commands in the cache" -f
    complete -c tldr -s s -l source             -d "Override the default page source" -r
    complete -c tldr -s c -l color              -d "Override color stripping" -f
    complete -c tldr -s r -l render             -d "Render local markdown files" -r
    complete -c tldr -s L -l language           -d "Override the default language" -f
    complete -c tldr -s m -l markdown           -d "Just print the plain page file" -f
    complete -c tldr -l print-completion        -d "Print shell completion script" -xa "bash zsh tcsh"
    complete -c tldr -l search                  -d "Search for a specific command from a query" -f

    function __tldr_commands
        tldr --list | string replace -a -r " \(.*\)" ""
    end

    complete -f -c tldr -a "(__tldr_commands)"
  '';
in
lib.concatLines [
  tldr_completions
]
