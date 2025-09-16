{ ... }:
let
  getSshConfig =
    {
      host,
      hostname ? host,
      identityFile,
    }:
    {
      inherit host hostname identityFile;

      identitiesOnly = true;
      addKeysToAgent = "yes";
      user = "git";
      extraOptions = {
        PreferredAuthentications = "publickey";
      };
    };
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "github-work" = getSshConfig {
        host = "github-work";
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519_GH_WORK";
      };

      "github-personal" = getSshConfig {
        host = "github.com";
        identityFile = "~/.ssh/id_ed25519_GH";
      };

      "gitlab-work" = getSshConfig {
        host = "git.rvision.pro";
        identityFile = "~/.ssh/id_ed25519_GL_WORK";
      };
    };
  };
}
