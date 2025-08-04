{ config, ... }:

{
  programs.waybar.style = ''
${builtins.readFile ./style.css}
* {
  font-family: "Hurmit Nerd Font Propo";
  font-size: 12px;
}
  '';
}
# font-size: ${if config.waybar.compactMode then "12" else "14"}px;