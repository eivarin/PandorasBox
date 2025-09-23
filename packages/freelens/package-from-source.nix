{

  stdenv,
  fetchFromGitHub,
  nodejs,
  pnpm,
  corepack_22,
  ...
}:

stdenv.mkDerivation (finalAttrs: rec {
  pname = "freelens";
  version = "1.5.3";

  src = fetchFromGitHub {
    owner = "freelensapp";
    repo = "freelens";
    rev = "v${version}";
    hash = "sha256-ORKXzk0HEGtHdKRgXCE6OGsJz17ut+yVLRdzCrHIzS4=";
  };

  nativeBuildInputs = [
    corepack_22
    nodejs
    pnpm.configHook
  ];

  pnpmWorkspaces = [ "@astrojs/language-server" ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    fetcherVersion = 1;
    hash = "sha256-sltt5twiJm3CgrF5LwOyCT4iqf6Ci92pYNW0U6JtvJU=";
  };

  buildPhase = ''
    runHook preBuild

    NODE_ENV=production corepack pnpm -r build

    runHook postBuild
  '';

  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp -r dist $out/
  #   chmod +x $out/bin/calisto
  # '';

  # meta = {
  #   description = "Free IDE for Kubernetes";
  #   homepage = "https://github.com/freelensapp/freelens?tab=readme-ov-file";
  #   license = lib.licenses.mit;
  #   maintainers = with lib.maintainers; [ ];
  #   mainProgram = "freelens";
  #   platforms = lib.platforms.all;
  # };
})
