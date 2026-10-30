{
  description = "ASCII Mandelbrot deep zoom";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "cli-mandelbrot";
        version = "0.1.0";
        src = ./mandelbrot.s;
        buildInputs = [ pkgs.mpfr ];
        dontUnpack = true;
        buildPhase = ''
          $CC -O2 -no-pie "$src" -lmpfr -o mandelbrot
        '';
        installPhase = ''
          install -Dm755 mandelbrot "$out/bin/mandelbrot"
        '';
        meta.mainProgram = "mandelbrot";
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ pkgs.mpfr ];
      };
    };
}
