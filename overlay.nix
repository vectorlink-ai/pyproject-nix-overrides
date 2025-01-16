final: prev: {
  pybars3 = prev.pybars3.overrideAttrs (p:{
    nativeBuildInputs = p.nativeBuildInputs ++ [final.setuptools];
  });
  pymeta3 = prev.pymeta3.overrideAttrs (p:{
    nativeBuildInputs = p.nativeBuildInputs ++ [final.setuptools];
  });
  numba = prev.numba.overrideAttrs (p: {
    buildInputs = p.buildInputs ++ [final.tbb_2021_11];
  });
}
