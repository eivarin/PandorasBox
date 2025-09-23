{ writeShellApplication }:
writeShellApplication {
  name = "n";
  runtimeInputs = [ ];
  text = builtins.readFile ./script.sh;
}
