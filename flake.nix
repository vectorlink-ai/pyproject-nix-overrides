{
  outputs = {...}:
    {
      overrides = pkgs: {
        cuda = import ./cuda.nix pkgs;
        vectorlink-source-projects = import ./vectorlink-source-projects.nix pkgs;
        default = import ./overlay.nix pkgs;
      };
    };
}
