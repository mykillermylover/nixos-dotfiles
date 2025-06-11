{ lib, ... }:
let
  createLang =
    {
      symbol,
      bg ? "white",
      fg ? "gray",
      format ? "[ $symbol( $version) ]($style)",
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

        "[ ](bg:gray)"
        "$os"
        "[](bg:gray fg:white)"

        "$username"
        "$directory"

        "("
        "[](bg:gray fg:white)"
        "$git_branch"
        "$git_status"
        ")"

        "[](fg:gray)"

        "$fill"

        "$deno"
        "$nodejs"
        "$php"
        "$python"
        "$ruby"
        "$terraform"
        "$vagrant"
        "$nix_shell"

        "[](fg:gray)"
        "("
        "$cmd_duration"
        "$jobs"
        "[](bg:gray fg:white)"
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
        style = "bold bg:gray fg:white";

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

      directory = {
        style = "bg:gray fg:cyan";
        format = "[  $path ]($style)";
        truncation_length = 2;
        truncate_to_repo = false;
        fish_style_pwd_dir_length = 3;
      };

      git_branch = {
        symbol = "";
        style = "fg:bright-green bg:gray";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:green bg:gray";
        format = "[$all_status$ahead_behind]($style)";
      };

      nodejs = createLang {
        symbol = "";
        bg = "bright-green";
      };

      c = createLang {
        symbol = "";
        bg = "bright-blue";
      };

      rust = createLang {
        symbol = "";
        bg = "red";
      };

      python = createLang {
        symbol = "";
        bg = "bright-cyan";
        format = "[ $symbol( $version)(\\(#$virtualenv\\)) ]($style)";
      };

      nix_shell = createLang {
        symbol = "";
        bg = "blue";
        format = "[ $symbol $state \\($name\\) ]($style)";
      };

      docker_context = createLang {
        symbol = "";
        bg = "purple";
        format = "[ $symbol( $context) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%T";
        style = "bg:gray";
        format = "[[ $time ](fg:bright-cyan bg:gray)]($style)";
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
        style = "bg:gray fg:bright-yellow";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 10000;
      };

      palettes = {
        powerlevel10k = {
          white = "#E9E9E9";
          gray = "#303030";
        };
      };

    };
  };
}
