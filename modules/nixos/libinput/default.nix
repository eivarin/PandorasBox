{ ... }:

{
  services.libinput = {
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
      horizontalScrolling = true;
    };
  };
}