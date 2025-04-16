{ pkgs, lib, config, ... }:

{
    home.packages = with pkgs; [ macchina ];
    home.file.".config/macchina" = {
        source = ./.;
        recursive = true;
    };
}