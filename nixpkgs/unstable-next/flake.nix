{
  description = "Nix4Loong unstable-next nixpkgs builds";

  inputs = {
    nixpkgs.url = "github:loongson-community/nixpkgs?ref=loong-master-next";
  };

  outputs =
    { nixpkgs, ... }:
    let
      pkgs = import nixpkgs {
        system = "loongarch64-linux";
        config.allowUnfree = true;
      };
    in
    {
      hydraJobs = import ../pkgs.nix { inherit pkgs nixpkgs; };
    };
}
