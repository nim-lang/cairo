#
# Translation of cairo-win32.h version 1.4
# by Luiz Américo Pereira Câmara 2007
#

import
  cairo, winim

{.push dynlib: LibCairo, cdecl.}

proc win32SurfaceCreate*(hdc: HDC): ptr Surface {.importc: "cairo_win32_surface_create".}
proc win32SurfaceCreateWithDdb*(hdc: HDC, format: Format, width, height: int32): ptr Surface {.importc: "cairo_win32_surface_create_with_ddb".}
proc win32SurfaceCreateWithDib*(format: Format, width, height: int32): ptr Surface {.importc: "cairo_win32_surface_create_with_dib".}
proc win32SurfaceGetDc*(surface: ptr Surface): HDC {.importc: "cairo_win32_surface_get_dc".}
proc win32SurfaceGetImage*(surface: ptr Surface): ptr Surface {.importc: "cairo_win32_surface_get_image".}
proc win32FontFaceCreateForLogfontw*(logfont: PLOGFONTW): ptr FontFace {.importc: "cairo_win32_font_face_create_for_logfontw".}
proc win32FontFaceCreateForHfont*(font: HFONT): ptr FontFace {.importc: "cairo_win32_font_face_create_for_hfont".}
proc win32ScaledFontSelectFont*(scaledFont: ptr ScaledFont, hdc: HDC): Status {.importc: "cairo_win32_scaled_font_select_font".}
proc win32ScaledFontDoneFont*(scaledFont: ptr ScaledFont) {.importc: "cairo_win32_scaled_font_done_font".}
proc win32ScaledFontGetMetricsFactor*(scaledFont: ptr ScaledFont): float64 {.importc: "cairo_win32_scaled_font_get_metrics_factor".}
proc win32ScaledFontGetLogicalToDevice*(scaledFont: ptr ScaledFont, logicalToDevice: ptr Matrix) {.importc: "cairo_win32_scaled_font_get_logical_to_device".}
proc win32ScaledFontGetDeviceToLogical*(scaledFont: ptr ScaledFont, deviceToLogical: ptr Matrix) {.importc: "cairo_win32_scaled_font_get_device_to_logical".}

{.pop.}