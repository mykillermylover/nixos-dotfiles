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
in
lib.concatLines [
  tldr_completions
  dvm_completins
]
