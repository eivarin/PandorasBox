{ ... }:
{
  programs.waybar.settings.mainbar = {
    "group/perf" = {
      orientation = "inherit";
      modules = [
        "cpu"
        "memory"
        "disk"
      ];
      drawer = {
        click-to-reveal = false;
      };
    };
    cpu = {
      format = " {usage}%";
    };
    memory = {
      format = " {percentage}%";
    };
    disk = {
      format = "󰋊 {percentage_free}%";
    };
  };
}