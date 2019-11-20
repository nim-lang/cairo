# included by cairo bindings

when declared(use_pkg_config) or declared(use_pkg_config_static):
  {.pragma: libcairo, cdecl.}
  when defined(use_pkg_config_static):
    {.passl: gorge("pkg-config cairo --libs --static").}
  else:
    {.passl: gorge("pkg-config cairo --libs").}
else:
  when defined(windows):
    const LibCairo* = "libcairo-2.dll"
  elif defined(macosx):
    const LibCairo* = "libcairo(|.2).dylib"
  else:
    const LibCairo* = "libcairo.so(|.2)"
  {.pragma: libcairo, cdecl, dynlib: LibCairo.}
