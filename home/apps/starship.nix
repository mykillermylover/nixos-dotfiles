{ lib, ... }:
let
  createLang =
    {
      symbol,
      bg ? "black",
      fg ? "white",
      format ? "[ $symbol $version ]($style)",
      ...
    }:
    {
      inherit symbol;
      style = "fg:${fg} bg:${bg}";
      format = lib.concatStrings [
        format
        "[](fg:white bg:${bg})"
      ];
    };
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    enableInteractive = true;

    settings = {
      format = lib.concatStrings [
        "[╭─](bright-black)"

        "[ ](bg:black)"
        "$os"
        "[](bg:black fg:white)"

        "$username"
        "$directory"

        "("
        "[](bg:black fg:white)"
        "$git_branch"
        "$git_status"
        ")"

        "[](fg:black)"

        "$fill"

        "[](fg:black)"
        "("
        "$cmd_duration"
        "$jobs"
        "[](bg:black fg:white)"
        ")"

        "$deno"
        "$nodejs"
        "$php"
        "$python"
        "$ruby"
        "$terraform"
        "$vagrant"
        "$nix_shell"

        "$time"
        "$status"
        "[─╮](bright-black)"

        "$line_break"
        "[╰─](bright-black)"
        "$shell"
        "$character"
      ];

      right_format = "[─╯](bright-black)";

      palette = "powerlevel10k";

      fill = {
        symbol = " ";
      };

      os = {
        disabled = false;
        style = "bold bg:black fg:bright-white";

        symbols = {
          Windows = "";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          NixOS = " ";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
        };
      };

      username = {
        show_always = false;
        style_user = "bg:red fg:black";
        style_root = "bg:red fg:black";
        format = "[ $user]($style)";
      };

      directory =
        let
          folderIcon = "[]($style blue)";
        in
        {
          style = "bg:black fg:cyan";
          format = "[ ${folderIcon} $path ]($style)";
          truncation_length = 2;
          truncate_to_repo = false;
          fish_style_pwd_dir_length = 3;
        };

      git_branch = {
        symbol = "";
        style = "fg:bright-green bg:black";
        format = "[ $symbol $branch ]($style)";
      };

      git_status =
        let
          ahead_behind = "($ahead_behind )";

          all_status = lib.concatStrings (
            map (str: "(${str} )") [
              "$conflicted"
              "$stashed"
              "$deleted"
              "$renamed"
              "$modified"
              "$typechanged"
              "$staged"
              "$untracked"
            ]
          );
        in
        {
          ahead = "⇡$count";
          diverged = "⇕⇡$ahead_count⇣$behind_count";
          behind = "⇣$count";
          conflicted = "$count";
          untracked = "?$count";
          stashed = "\$$count";
          staged = "+$count";
          renamed = "»$count";
          deleted = "[-$count](fg:red bg:black)";
          typechanged = "$count";
          modified = "!$count";

          style = "fg:green bg:black";
          format = "[${all_status}${ahead_behind}]($style)";
        };

      nodejs = createLang {
        symbol = "";
        fg = "green";
      };

      c = createLang {
        symbol = "";
        fg = "bright-blue";
      };

      rust = createLang {
        symbol = "";
        fg = "red";
      };

      python = createLang rec {
        symbol = "";
        fg = "cyan";

        venvName = "[#$virtualenv](bold $style)";
        format = "[ $symbol $version ${venvName} ]($style)";
      };

      nix_shell = createLang rec {
        symbol = "";
        fg = "bright-blue";

        shellName = "[$name](bold $style)";
        format = "[ $symbol $state ${shellName} ]($style)";
      };

      docker_context = createLang {
        symbol = "";
        fg = "purple";
        format = "[ $symbol $context ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%T";
        style = "bg:black";
        format = "[[ $time ](fg:bright-cyan bg:black)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[❯](bold fg:green)";
        error_symbol = "[❯](bold fg:red)";
        vimcmd_symbol = "[❮](bold fg:green)";
        vimcmd_replace_one_symbol = "[❮](bold fg:blue)";
        vimcmd_replace_symbol = "[❮](bold fg:blue)";
        vimcmd_visual_symbol = "[❮](bold fg:yellow)";
      };

      cmd_duration = {
        show_milliseconds = false;
        format = "[  $duration ]($style)";
        style = "bg:black fg:bright-yellow";
        disabled = false;
        show_notifications = false;
      };

      palettes = {
        powerlevel10k = {
          white = "#7D7D7D";
          bright-white = "#E9E9E9";

          black = "#303030";
          bright-black = "#5B5F62";

          green = "#64D110";
          bright-green = "#64D110";

          yellow = "#82885C";

          blue = "#0085B3";
          bright-blue = "#10A5F2";
        };
      };

    };
  };
}
