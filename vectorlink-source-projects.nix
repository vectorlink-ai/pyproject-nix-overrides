pkgs: final: prev:
let
  addHatchling = (old: {
    buildInputs = old.buildInputs or [] ++ (with final; [hatchling pathspec pluggy packaging trove-classifiers]);
  });
in
{
  vectorlink-gpu = prev.vectorlink-gpu.overrideAttrs addHatchling;
  vectorlink = prev.vectorlink.overrideAttrs addHatchling;
}
