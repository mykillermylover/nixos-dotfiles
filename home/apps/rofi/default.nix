{ pkgs, config, ... }:
{
  imports = [
    ./theme.nix
  ];

  programs.rofi =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      enable = true;
      package = pkgs.rofi-wayland;

      ############
      ### MAIN ###
      ############
      modes = [
        "window"
        "drun"
        "run"
        "ssh"
      ];
      font = "JetBrains Mono Nerd Font 12";
      location = "center";

      extraConfig =
        let
          # Workaround to insert object
          # Prop name and closing semicolon will be commented
          mkObject = name: value: {
            "// ${name}" = mkLiteral "\n${name} ${value} //";
          };
        in
        {
          show-icons = true;
          icon-theme = "Colloid-Dark";

          matching = "normal";
          tokenize = true;

          ############
          ### DRUN ###
          ############
          drun-match-fields = "name,generic,categories,keywords,comment";
          drun-show-actions = false;
          case-sensitive = false;
          case-smart = true;
          hover-select = false;
        }
        // mkObject "filebrowser" ''
          {
            directories-first: true;
            sorting-method: "name";
          }
        ''
        // mkObject "timeout" ''
          {
            action: "kb-cancel";
            delay: 0;
          }
        '';
    };
}
