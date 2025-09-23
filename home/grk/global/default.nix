{ hostname, systemArch, ... }:
{
  imports = [
    ../features/cli
    
    ../../../options/global
  ];

  inherit hostname systemArch;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "grk";
    homeDirectory = "/home/grk";
    stateVersion = "24.11"; # Please read the comment before changing.
    file = {};
    sessionVariables = {};
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "eivarin";
      userEmail = "rodrigommpereira309@gmail.com";
      extraConfig = {
        init = { defaultBranch = "main"; };
      };
    };
  };

  systemd.user.targets.tray = {
		Unit = {
			Description = "Home Manager System Tray";
			Requires = [ "graphical-session-pre.target" ];
		};
	};
}
