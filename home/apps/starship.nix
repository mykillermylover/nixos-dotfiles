{ lib, ... }:
let
  createLang =
    {
      symbol,
      bg ? "white",
      fg ? "black",
      format ? "[ $symbol $version ]($style)",
      ...
    }:
    {
      inherit symbol;
      style = "fg:${fg} bg:${bg}";
      format = lib.concatStrings [
        "[](fg:${bg})"
        format
        "[](fg:${bg})"
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

        "$deno"
        "$nodejs"
        "$php"
        "$python"
        "$ruby"
        "$terraform"
        "$vagrant"
        "$nix_shell"

        "[](fg:black)"
        "("
        "$cmd_duration"
        "$jobs"
        "[](bg:black fg:white)"
        ")"

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
        style = "bold bg:black fg:white";

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

      git_status = {
        style = "fg:green bg:black";
        format = "[$all_status$ahead_behind]($style)";
      };

      nodejs = createLang {
        symbol = "";
        bg = "green";
      };

      c = createLang {
        symbol = "";
        bg = "bright-blue";
      };

      rust = createLang {
        symbol = "";
        bg = "red";
      };

      python = createLang rec {
        symbol = "";
        bg = "cyan";

        venvName = "[#$virtualenv](bold $style)";
        format = "[ $symbol $version ${venvName} ]($style)";
      };

      nix_shell = createLang rec {
        symbol = "";
        bg = "bright-blue";

        shellName = "[$name](bold $style)";
        format = "[ $symbol $state ${shellName} ]($style)";
      };

      docker_context = createLang {
        symbol = "";
        bg = "purple";
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
          white = "#E9E9E9";
          bright-white = "#FFFFFF";

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
