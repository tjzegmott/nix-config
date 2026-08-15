self: super: {
  pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
    (pyfinal: pyprev: {
      plumbum = pyprev.plumbum.overridePythonAttrs (old: {
        # procps' `ps` does not work on darwin, so local.pgrep() finds nothing
        disabledTests = (old.disabledTests or [ ]) ++ [ "test_pgrep" ];
      });
    })
  ];
}
