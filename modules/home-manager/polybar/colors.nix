{ pkgs, lib, config, ... }:
{
    services.polybar.config.colors = {
      background = "#222";
      background-alt = "#444";
      foreground = "#dfdfdf";
      foreground-alt = "#dfdfdf";
      primary = "#e2232a";
      primary-20 = "#b51c22";
      primary-40 = "#881519";
      primary-60 = "#5d0e10";
      primary-80 = "#320708";
      secondary = "#ffb52a";
      tertiary = "#2a9dfb";
      alert = "#bd2c40";

      white = "#FFFFFF";
      black = "#000000";
      red = "#EC7875";
      pink = "#EC6798";
      purple = "#BE78D1";
      blue = "#75A4CD";
      cyan = "#00C7DF";
      teal = "#00B19F";
      green = "#61C766";
      lime = "#B9C244";
      yellow = "#EBD369";
      amber = "#EDB83F";
      orange = "#E57C46";
      brown = "#AC8476";
      gray = "#9E9E9E";
      indigo = "#6C77BB";
      blue-gray = "#6D8895";
    };
}