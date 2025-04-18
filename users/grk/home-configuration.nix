{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "grk";
  home.homeDirectory = "/home/grk";
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  fonts.fontconfig.enable = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = [
  #   pkgs.pavucontrol
  #   pkgs.discord
  #   inputs.zen-browser.packages."${hostOptions.system}".beta
  # ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    userName = "eivarin";
    userEmail = "rodrigommpereira309@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

  systemd.user.targets.tray = {
		Unit = {
			Description = "Home Manager System Tray";
			Requires = [ "graphical-session-pre.target" ];
		};
	};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
