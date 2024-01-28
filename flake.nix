{
  description = "A direnv integration for Neovim";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs, flake-utils, self}: 
  flake-utils.lib.eachDefaultSystem (system: 
    let pkgs = nixpkgs.legacyPackages.${system}; in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          lua-language-server
        ];
      };
    }
  );
}
