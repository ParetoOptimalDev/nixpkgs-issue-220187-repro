{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux";};
    in
      {
        devShell.x86_64-linux = pkgs.mkShell {
          buildInputs = with pkgs; [ emacs docker ];
          shellHook = ''
        echo "opening docker ubuntu container with emacs"
        echo "path is: "
        container_id=$(docker run -it --rm --detach ubuntu) emacs -Q --batch --load config.el
        exit
        '';
        };

      };
}
