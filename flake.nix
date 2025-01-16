{
  outputs = {
      ...
  }:
    {
      overlays = {
        cuda = import ./cuda.nix;
        default = import ./overlay.nix;
      };
    };
}
