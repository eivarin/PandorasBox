{ ... }:

# let hyprlandGreeterConfig = pkgs.writeText "hyprland-greeter.conf" ''
#   env = GTK_USE_PORTAL=0
#   env = GDK_DEBUG,no-portals
#   exec-once = ${pkgs.greetd.regreet}/bin/regreet -v; ${pkgs.hyprland}/bin/hyprctl dispatch exit
#   misc {
#     disable_hyprland_logo = true
#     disable_splash_rendering = true
#     disable_hyprland_qtutils_check = true
#   }
# '';
# in
{
  environment.etc = {
    "greetd/wp.png".source = ../../../wallpapers/grk.png;
  };
  # users.extraUsers.greeter = {
  #   home = "/tmp/greeter-home";
  #   createHome = true;
  # };
  programs.regreet = {
    enable = true;
    cageArgs = [ "-s" "-m" "last" ];
    settings = {
      background = {
        path = "/etc/greetd/wp.png";
        fit = "Contain";
      };
      GTK.application_prefer_dark_theme = true;
    };
  }; 
  # services.greetd = {
  #   enable = true;
  # };
}
