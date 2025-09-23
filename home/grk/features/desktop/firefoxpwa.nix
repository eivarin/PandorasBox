{ pkgs, ... }:
{
  programs.firefoxpwa = {
    enable = true;
    profiles."01K5SWYM91WYWCXQHG8SCTEV8T" = {
      name = "Default Profile";
      sites = {
        "01K5SX1WZH0PK95RV4K5X5YSBJ" = {
          name = "YouTube";
          manifestUrl = "https://www.youtube.com/manifest.webmanifest";
          url = "https://www.youtube.com/";
          desktopEntry = {
            enable = true;
            icon = pkgs.fetchurl {
              url = "https://www.gstatic.com/youtube/img/branding/favicon/favicon_192x192_v2.png";
              sha256 = "sha256-Ngx9QctP6rxSmceeB9DlH3+RD5OBEiCl2Cond5Kz6TU=";
            };
          };
        };
        "01K5SX3150TDTD8HQT51DR51MF" = {
          name = "Home Assistant";
          manifestUrl = "https://hass.eivarin.xyz/manifest.json";
          url = "https://hass.eivarin.xyz/";
          desktopEntry = { 
            enable = true;
            icon = pkgs.fetchurl {
              url = "https://hass.eivarin.xyz/static/icons/favicon-512x512.png";
              sha256 = "sha256-ObRgquN2uDV5IcE+mEX+z8B0832iEB5RcJWT9tt9DgA=";
            };
          };
        };
      };
    };
  };
}
