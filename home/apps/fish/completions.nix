{ lib, ... }:
let
  tldr_completions = ''
    # TLDR https://github.com/tldr-pages/tldr-python-client/issues/183
    complete -c tldr -s h -l help                    -d "show this help message" -f
    complete -c tldr -s v -l version                 -d "show program's version number" -f
    complete -c tldr -s u -l update -l update_cache  -d "Update the local cache of pages" -f
    complete -c tldr -s p -l platform                -d "Override the operating system" -xa "android linux osx freebsd netbsd openbsd sunos windows common" -f
    complete -c tldr -s l -l list                    -d "List all commands in the cache" -f
    complete -c tldr -s s -l source                  -d "Override the default page source" -r
    complete -c tldr -s c -l color                   -d "Override color stripping" -f
    complete -c tldr -s r -l render                  -d "Render local markdown files" -r
    complete -c tldr -s L -l language                -d "Override the default language" -f
    complete -c tldr -s m -l markdown                -d "Just print the plain page file" -f
    complete -c tldr -l print-completion             -d "Print shell completion script" -xa "bash zsh tcsh"
    complete -c tldr -l search                       -d "Search for a specific command from a query" -f

    function __tldr_commands
        tldr --list | string replace -a -r " \(.*\)" ""
    end

    complete -f -c tldr -a "(__tldr_commands)"
  '';

  dvm_completins = ''
    # DVM https://github.com/justjavac/dvm

    # Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
    function __fish_dvm_global_optspecs
      string join \n h/help V/version
    end

    function __fish_dvm_needs_command
      # Figure out if the current invocation already has a command.
      set -l cmd (commandline -opc)
      set -e cmd[1]
      argparse -s (__fish_dvm_global_optspecs) -- $cmd 2>/dev/null
      or return
      if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
      end
      return 0
    end

    function __fish_dvm_using_subcommand
      set -l cmd (__fish_dvm_needs_command)
      test -z "$cmd"
      and return 1
      contains -- $cmd[1] $argv
    end

    complete -c dvm -n "__fish_dvm_needs_command" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_needs_command" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "completions" -d 'Generate shell completions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "info" -d 'Show dvm info.'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "install" -d 'Install deno executable to the given version.'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "i" -d 'Install deno executable to the given version.'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "add" -d 'Install deno executable to the given version.'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "list" -d 'List all installed versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "ls" -d 'List all installed versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "ll" -d 'List all installed versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "la" -d 'List all installed versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "list-remote" -d 'List all released versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "lr" -d 'List all released versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "ls-remote" -d 'List all released versions'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "uninstall" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "un" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "unlink" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "rm" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "remove" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "use" -d 'Use a given version or a semver range or a alias to the range.'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "alias" -d 'Set or unset an alias'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "activate" -d 'Activate Dvm'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "deactivate" -d 'Deactivate Dvm'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "doctor" -d 'Fixing dvm specific environment variables and other issues'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "upgrade" -d 'Upgrade aliases to the latest version, use `self` to upgrade dvm itself'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "exec" -d 'Execute deno command with a specific deno version'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "clean" -d 'Clean dvm cache'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "registry" -d 'Change registry that dvm fetch from'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "update" -d 'Update remove version list local cache to the latest'
    complete -c dvm -n "__fish_dvm_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
    complete -c dvm -n "__fish_dvm_using_subcommand completions" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand info" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand info" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand install" -l no-use -d 'Only install to local, but not use'
    complete -c dvm -n "__fish_dvm_using_subcommand install" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand i" -l no-use -d 'Only install to local, but not use'
    complete -c dvm -n "__fish_dvm_using_subcommand i" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand add" -l no-use -d 'Only install to local, but not use'
    complete -c dvm -n "__fish_dvm_using_subcommand add" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand list" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand list" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand ls" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand ls" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand ll" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand ll" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand la" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand la" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand list-remote" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand list-remote" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand lr" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand lr" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand ls-remote" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand ls-remote" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand uninstall" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand un" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand unlink" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand rm" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand remove" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand use" -s L -l write-local -d 'Writing the version to the .dvmrc file of the current directory if present'
    complete -c dvm -n "__fish_dvm_using_subcommand use" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -f -a "set" -d 'Set an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -f -a "unset" -d 'Unset an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -f -a "list" -d 'List all aliases'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and not __fish_seen_subcommand_from set unset list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from unset" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Unset an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all aliases'
    complete -c dvm -n "__fish_dvm_using_subcommand alias; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand activate" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand activate" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand deactivate" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand deactivate" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand doctor" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand doctor" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand upgrade" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand upgrade" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand exec" -s v -l version -d 'The version to use' -r
    complete -c dvm -n "__fish_dvm_using_subcommand exec" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand clean" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand clean" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "list" -d 'List predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "show" -d 'Show current binary registry and version registry'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "set" -d 'Set registry to one of predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "binary" -d 'Binary registry operations'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "version" -d 'Version registry operations'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and not __fish_seen_subcommand_from list show set binary version help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from show" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from set" -s L -l write-local -d 'Write to current directory .dvmrc file instead of global(user-wide) config'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from binary" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from binary" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from binary" -f -a "show" -d 'Show current binary registry'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from binary" -f -a "set" -d 'Set binary registry to one of predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from binary" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from version" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from version" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from version" -f -a "show" -d 'Show current version registry'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from version" -f -a "set" -d 'Set version registry to one of predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from version" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "list" -d 'List predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show current binary registry and version registry'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set registry to one of predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "binary" -d 'Binary registry operations'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "version" -d 'Version registry operations'
    complete -c dvm -n "__fish_dvm_using_subcommand registry; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand update" -s h -l help -d 'Print help'
    complete -c dvm -n "__fish_dvm_using_subcommand update" -s V -l version -d 'Print version'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "completions" -d 'Generate shell completions'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "info" -d 'Show dvm info.'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "install" -d 'Install deno executable to the given version.'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "list" -d 'List all installed versions'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "list-remote" -d 'List all released versions'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "uninstall" -d 'Uninstall a given version'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "use" -d 'Use a given version or a semver range or a alias to the range.'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "alias" -d 'Set or unset an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "activate" -d 'Activate Dvm'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "deactivate" -d 'Deactivate Dvm'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "doctor" -d 'Fixing dvm specific environment variables and other issues'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "upgrade" -d 'Upgrade aliases to the latest version, use `self` to upgrade dvm itself'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "exec" -d 'Execute deno command with a specific deno version'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "clean" -d 'Clean dvm cache'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "registry" -d 'Change registry that dvm fetch from'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "update" -d 'Update remove version list local cache to the latest'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and not __fish_seen_subcommand_from completions info install list list-remote uninstall use alias activate deactivate doctor upgrade exec clean registry update help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "set" -d 'Set an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "unset" -d 'Unset an alias'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from alias" -f -a "list" -d 'List all aliases'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from registry" -f -a "list" -d 'List predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from registry" -f -a "show" -d 'Show current binary registry and version registry'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from registry" -f -a "set" -d 'Set registry to one of predefined registries'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from registry" -f -a "binary" -d 'Binary registry operations'
    complete -c dvm -n "__fish_dvm_using_subcommand help; and __fish_seen_subcommand_from registry" -f -a "version" -d 'Version registry operations'
  '';
  perl_rename_completions = ''
    complete -c rename -s b -l backup                 -d "make backup before removal" -f
    complete -c rename -s B -l prefix                 -d "set backup filename prefix" -r
    complete -c rename -s f -l force                  -d "remove existing destinations, never prompt" -f
    complete -c rename -s i -l interactive            -d "prompt before overwrite" -f
    complete -c rename -s l -l link-only              -d "link file instead of rename" -f
    complete -c rename -s n -l just-print -l dry-run  -d "don't rename, implies --verbose" -f
    complete -c rename -s v -l verbose                -d "explain what is being done" -f
    complete -c rename -s V -l version-control        -d "override the usual version control" -r
    complete -c rename -s Y -l basename-prefix        -d "set backup filename basename prefix" -r
    complete -c rename -s z -s S -l suffix            -d "set backup filename suffix" -r
    complete -c rename -l help                        -d "display help and exit" -f
    complete -c rename -l version                     -d "output version information and exit" -f
  '';

  buf_completions = ''
        # fish completion for buf                                  -*- shell-script -*-

    function __buf_debug
        set -l file "$BASH_COMP_DEBUG_FILE"
        if test -n "$file"
            echo "$argv" >> $file
        end
    end

    function __buf_perform_completion
        __buf_debug "Starting __buf_perform_completion"

        # Extract all args except the last one
        set -l args (commandline -opc)
        # Extract the last arg and escape it in case it is a space
        set -l lastArg (string escape -- (commandline -ct))

        __buf_debug "args: $args"
        __buf_debug "last arg: $lastArg"

        # Disable ActiveHelp which is not supported for fish shell
        set -l requestComp "BUF_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

        __buf_debug "Calling $requestComp"
        set -l results (eval $requestComp 2> /dev/null)

        # Some programs may output extra empty lines after the directive.
        # Let's ignore them or else it will break completion.
        # Ref: https://github.com/spf13/cobra/issues/1279
        for line in $results[-1..1]
            if test (string trim -- $line) = ""
                # Found an empty line, remove it
                set results $results[1..-2]
            else
                # Found non-empty line, we have our proper output
                break
            end
        end

        set -l comps $results[1..-2]
        set -l directiveLine $results[-1]

        # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
        # completions must be prefixed with the flag
        set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

        __buf_debug "Comps: $comps"
        __buf_debug "DirectiveLine: $directiveLine"
        __buf_debug "flagPrefix: $flagPrefix"

        for comp in $comps
            printf "%s%s\n" "$flagPrefix" "$comp"
        end

        printf "%s\n" "$directiveLine"
    end

    # this function limits calls to __buf_perform_completion, by caching the result behind $__buf_perform_completion_once_result
    function __buf_perform_completion_once
        __buf_debug "Starting __buf_perform_completion_once"

        if test -n "$__buf_perform_completion_once_result"
            __buf_debug "Seems like a valid result already exists, skipping __buf_perform_completion"
            return 0
        end

        set --global __buf_perform_completion_once_result (__buf_perform_completion)
        if test -z "$__buf_perform_completion_once_result"
            __buf_debug "No completions, probably due to a failure"
            return 1
        end

        __buf_debug "Performed completions and set __buf_perform_completion_once_result"
        return 0
    end

    # this function is used to clear the $__buf_perform_completion_once_result variable after completions are run
    function __buf_clear_perform_completion_once_result
        __buf_debug ""
        __buf_debug "========= clearing previously set __buf_perform_completion_once_result variable =========="
        set --erase __buf_perform_completion_once_result
        __buf_debug "Successfully erased the variable __buf_perform_completion_once_result"
    end

    function __buf_requires_order_preservation
        __buf_debug ""
        __buf_debug "========= checking if order preservation is required =========="

        __buf_perform_completion_once
        if test -z "$__buf_perform_completion_once_result"
            __buf_debug "Error determining if order preservation is required"
            return 1
        end

        set -l directive (string sub --start 2 $__buf_perform_completion_once_result[-1])
        __buf_debug "Directive is: $directive"

        set -l shellCompDirectiveKeepOrder 32
        set -l keeporder (math (math --scale 0 $directive / $shellCompDirectiveKeepOrder) % 2)
        __buf_debug "Keeporder is: $keeporder"

        if test $keeporder -ne 0
            __buf_debug "This does require order preservation"
            return 0
        end

        __buf_debug "This doesn't require order preservation"
        return 1
    end


    # This function does two things:
    # - Obtain the completions and store them in the global __buf_comp_results
    # - Return false if file completion should be performed
    function __buf_prepare_completions
        __buf_debug ""
        __buf_debug "========= starting completion logic =========="

        # Start fresh
        set --erase __buf_comp_results

        __buf_perform_completion_once
        __buf_debug "Completion results: $__buf_perform_completion_once_result"

        if test -z "$__buf_perform_completion_once_result"
            __buf_debug "No completion, probably due to a failure"
            # Might as well do file completion, in case it helps
            return 1
        end

        set -l directive (string sub --start 2 $__buf_perform_completion_once_result[-1])
        set --global __buf_comp_results $__buf_perform_completion_once_result[1..-2]

        __buf_debug "Completions are: $__buf_comp_results"
        __buf_debug "Directive is: $directive"

        set -l shellCompDirectiveError 1
        set -l shellCompDirectiveNoSpace 2
        set -l shellCompDirectiveNoFileComp 4
        set -l shellCompDirectiveFilterFileExt 8
        set -l shellCompDirectiveFilterDirs 16

        if test -z "$directive"
            set directive 0
        end

        set -l compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
        if test $compErr -eq 1
            __buf_debug "Received error directive: aborting."
            # Might as well do file completion, in case it helps
            return 1
        end

        set -l filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
        set -l dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
        if test $filefilter -eq 1; or test $dirfilter -eq 1
            __buf_debug "File extension filtering or directory filtering not supported"
            # Do full file completion instead
            return 1
        end

        set -l nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
        set -l nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

        __buf_debug "nospace: $nospace, nofiles: $nofiles"

        # If we want to prevent a space, or if file completion is NOT disabled,
        # we need to count the number of valid completions.
        # To do so, we will filter on prefix as the completions we have received
        # may not already be filtered so as to allow fish to match on different
        # criteria than the prefix.
        if test $nospace -ne 0; or test $nofiles -eq 0
            set -l prefix (commandline -t | string escape --style=regex)
            __buf_debug "prefix: $prefix"

            set -l completions (string match -r -- "^$prefix.*" $__buf_comp_results)
            set --global __buf_comp_results $completions
            __buf_debug "Filtered completions are: $__buf_comp_results"

            # Important not to quote the variable for count to work
            set -l numComps (count $__buf_comp_results)
            __buf_debug "numComps: $numComps"

            if test $numComps -eq 1; and test $nospace -ne 0
                # We must first split on \t to get rid of the descriptions to be
                # able to check what the actual completion will be.
                # We don't need descriptions anyway since there is only a single
                # real completion which the shell will expand immediately.
                set -l split (string split --max 1 \t $__buf_comp_results[1])

                # Fish won't add a space if the completion ends with any
                # of the following characters: @=/:.,
                set -l lastChar (string sub -s -1 -- $split)
                if not string match -r -q "[@=/:.,]" -- "$lastChar"
                    # In other cases, to support the "nospace" directive we trick the shell
                    # by outputting an extra, longer completion.
                    __buf_debug "Adding second completion to perform nospace directive"
                    set --global __buf_comp_results $split[1] $split[1].
                    __buf_debug "Completions are now: $__buf_comp_results"
                end
            end

            if test $numComps -eq 0; and test $nofiles -eq 0
                # To be consistent with bash and zsh, we only trigger file
                # completion when there are no other completions
                __buf_debug "Requesting file completion"
                return 1
            end
        end

        return 0
    end

    # Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
    # so we can properly delete any completions provided by another script.
    # Only do this if the program can be found, or else fish may print some errors; besides,
    # the existing completions will only be loaded if the program can be found.
    if type -q "buf"
        # The space after the program name is essential to trigger completion for the program
        # and not completion of the program name itself.
        # Also, we use '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.
        complete --do-complete "buf " > /dev/null 2>&1
    end

    # Remove any pre-existing completions for the program since we will be handling all of them.
    complete -c buf -e

    # this will get called after the two calls below and clear the $__buf_perform_completion_once_result global
    complete -c buf -n '__buf_clear_perform_completion_once_result'
    # The call to __buf_prepare_completions will setup __buf_comp_results
    # which provides the program's completion choices.
    # If this doesn't require order preservation, we don't use the -k flag
    complete -c buf -n 'not __buf_requires_order_preservation && __buf_prepare_completions' -f -a '$__buf_comp_results'
    # otherwise we use the -k flag
    complete -k -c buf -n '__buf_requires_order_preservation && __buf_prepare_completions' -f -a '$__buf_comp_results'
  '';
in
lib.concatLines [
  tldr_completions
  dvm_completins
  perl_rename_completions
  buf_completions
]
