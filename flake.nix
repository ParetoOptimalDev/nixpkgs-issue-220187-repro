{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, nixpkgs, ...  }@inputs:
    let pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [inputs.emacs-overlay.overlay];};
    in
      {
        devShell.x86_64-linux = pkgs.mkShell {
          buildInputs = with pkgs; [ emacsGit docker ];
          shellHook = ''
        echo "evaluate the contents of the config.el file opened in emacs and see the paths printed out to the *Messages* buffer"
        '';
        };

      };
}
