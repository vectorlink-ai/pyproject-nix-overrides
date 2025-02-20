pkgs:
let
  addCuda = package: package.overrideAttrs (p: {
    buildInputs = p.buildInputs ++ (with pkgs.cudaPackages; [
      cudatoolkit
      cudnn
      cuda_cudart
      nccl
    ]);
    postInstall = ''
rm -f $out/lib/python3.12/site-packages/nvidia/__pycache__/__init__.cpython-312.pyc
'';
  });
  ignoreCuda = package: package.overrideAttrs (p: {
    autoPatchelfIgnoreMissingDeps = [ "libcuda.so.1" "libcudart.so.1" ];
  });

  addCudaTo = packageSet: names: builtins.listToAttrs (map
    (name: { inherit name;
             value = addCuda packageSet.${name};
           })
    names
  );
  ignoreCudaFor = packageSet: names: builtins.listToAttrs (map
    (name: { inherit name;
             value = ignoreCuda packageSet.${name};
           })
    names
  );
in
final: prev: ignoreCudaFor prev [
  "nvidia-cusolver-cu12"
  "nvidia-cusparse-cu12"
  "nvidia-cublas-cu12"
  "nvidia-cuda-cupti-cu12"
  "nvidia-cuda-nvrtc-cu12"
  "nvidia-cudnn-cu12"
  "nvidia-cufft-cu12"
  "nvidia-curand-cu12"
  "nvidia-nccl-cu12"
  "nvidia-nvjitlink-cu12"
  "nvidia-nvtx-cu12"
  "torch"
  "numba"
]
