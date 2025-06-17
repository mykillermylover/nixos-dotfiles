{
  description = "NixOS and Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-your-shell = {
      url = "github:MercuryTechnologies/nix-your-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rofi-tools = {
      url = "github:szaffarano/rofi-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    unimatrix = {
      url = "github:will8211/unimatrix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    WaveFox = {
      url = "github:QNetITQ/WaveFox?dir=chrome";
      flake = false;
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

    # My ags shell
    mshell.url = "github:mykillermylover/ags-dotfiles";

    # Private local repo
    my-apps = {
      url = "path:/home/mihail/Apps/nix-apps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      sops-nix,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs; };

          modules = [
            ./nixos
            sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.mihail = import ./home;

                backupFileExtension = "bak";

                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
