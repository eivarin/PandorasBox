{ config, ... }:

{
  programs.waybar.style = ''
* {
  all: unset;
  font-family: "Hurmit Nerd Font Propo";
  font-size: 12px;
}
${builtins.readFile ./style.css}
  '';
}
# font-size: ${if config.waybar.compactMode then "12" else "14"}px;