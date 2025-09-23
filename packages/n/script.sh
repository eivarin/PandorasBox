
run(){
  nix run nixpkgs#"$1" -- "$@"
}

shell(){
  nix shell nixpkgs#"$1"
}



subargs=("${@:2}")
# echo $subargs
case "$1" in
  r)
    run "${subargs[@]}"
    ;;
  s)
    shell "${subargs[@]}"
    ;;

  *)
    echo "Usage: $0 {r|s} [args]"
    ;;
esac
