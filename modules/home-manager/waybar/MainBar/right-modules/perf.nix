{ ... }:
{
  programs.waybar.settings.mainbar = {
    "group/perf" = {
      orientation = "inherit";
      modules = [
        "group/cpuGroup"
        "group/memoryGroup"
        "group/diskGroup"
      ];
      drawer = {
        click-to-reveal = false;
      };
    };
    "group/cpuGroup" = {
      orientation = "inherit";
      modules = [
        "custom/cpuIcon"
        "cpu"
      ];
    };
    "custom/cpuIcon" = {
      format = "";
    };
    cpu = {
      format = "{usage}%";
    };
    "group/memoryGroup" = {
      orientation = "inherit";
      modules = [
        "custom/memoryIcon"
        "memory"
      ];
    };
    "custom/memoryIcon" = {
      format = "";
    };
    memory = {
      format = "{percentage}%";
    };
    "group/diskGroup" = {
      orientation = "inherit";
      modules = [
        "custom/diskIcon"
        "disk"
      ];
    };
    "custom/diskIcon" = {
      format = "";
    };
    disk = {
      format = "{percentage_free}%";
    };
  };
}