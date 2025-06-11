{
  description = "First NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

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
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

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
