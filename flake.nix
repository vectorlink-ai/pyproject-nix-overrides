{
  outputs = {...}:
    {
      overrides = pkgs: {
        cuda = import ./cuda.nix pkgs;
        default = import ./overlay.nix pkgs;
      };
    };
}
