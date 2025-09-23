{
  fetchurl,
  appimageTools,
  ...
}:

let
  pname = "freelens";
  version = "1.5.3";
  src = fetchurl {
    url = "https://github.com/freelensapp/freelens/releases/download/v${version}/Freelens-${version}-linux-amd64.AppImage";
    hash = "sha256-I6jmMGCkkdZPJoLNGfWhUc5SAjNcRzPJsVckxZ6eeng=";
  };
  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 { 
  inherit pname version src; 
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/freelens.desktop $out/share/applications/freelens.desktop
    cp -r ${appimageContents}/usr/share/icons $out/share/icons
    substituteInPlace $out/share/applications/freelens.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';
}