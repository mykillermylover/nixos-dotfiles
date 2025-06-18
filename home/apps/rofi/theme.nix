{ config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi.theme = {
    "*" = {
      font = "JetBrainsMono Nerd Font 12";

      background = mkLiteral "#202536FF";
      bg1 = mkLiteral "#7E7E7E80";
      bg2 = mkLiteral "#D4DBFFFF";

      fontColor = mkLiteral "#E3E1E9FF";
      fg1 = mkLiteral "#102255FF";
      fg2 = mkLiteral "#DEDEDE80";
      outline = mkLiteral "#B1B1BBFF";

      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@fontColor";

      margin = mkLiteral "0";
      padding = mkLiteral "0";
      spacing = mkLiteral "0";
    };

    window = {
      background-color = mkLiteral "@background";

      location = mkLiteral "center";
      width = mkLiteral "640";
      border-radius = mkLiteral "10";
      border = mkLiteral "1px";
      border-color = mkLiteral "@outline";
    };

    inputbar = {
      font = "JetBrainsMono Nerd Font 20";
      padding = mkLiteral "12px";
      spacing = mkLiteral "12px";
      children = mkLiteral "[ icon-search, entry ]";
    };

    icon-search = {
      expand = mkLiteral "false";
      filename = "search";
      size = mkLiteral "28px";
    };

    "icon-search, entry, element-icon, element-text" = {
      vertical-align = mkLiteral "0.5";
    };

    entry = {
      font = mkLiteral "inherit";

      placeholder = "Search";
      placeholder-color = mkLiteral "@fg2";
    };

    message = {
      border = mkLiteral "2px 0 0";
      border-color = mkLiteral "@bg1";
      background-color = mkLiteral "@bg1";
    };

    textbox = {
      padding = mkLiteral "8px 24px";
    };

    listview = {
      lines = mkLiteral "10";
      columns = mkLiteral "1";

      fixed-height = mkLiteral "false";
      border = mkLiteral "1px 0 0";
      border-color = mkLiteral "@fg2";
    };

    element = {
      padding = mkLiteral "8px 16px";
      margin = mkLiteral "5px";
      border-radius = mkLiteral "5";
      spacing = mkLiteral "16px";
      background-color = mkLiteral "transparent";
    };

    "element normal active" = {
      text-color = mkLiteral "@bg2";
    };

    "element alternate active" = {
      text-color = mkLiteral "@bg2";
    };

    "element selected normal, element selected active" = {
      background-color = mkLiteral "@bg2";
      text-color = mkLiteral "@fg1";
    };

    element-icon = {
      size = mkLiteral "1.5em";
    };

    element-text = {
      text-color = mkLiteral "inherit";
    };
  };
}
