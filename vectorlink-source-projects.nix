pkgs: final: prev: {
  vectorlink-gpu = prev.vectorlink-gpu.overrideAttrs (old: {
    buildInputs = old.buildInputs or [] ++ [final.hatchling final.pathspec final.pluggy final.packaging final.trove-classifiers];
  });
  vectorlink-py = prev.vectorlink-py.overrideAttrs (old: {
    buildInputs = old.buildInputs or [] ++ [final.hatchling final.pathspec final.pluggy final.packaging final.trove-classifiers];
  });
}
