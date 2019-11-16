#
# Translation of cairo-win32.h version 1.4
# by Luiz Américo Pereira Câmara 2007
#

import
  cairo, windows

proc win32SurfaceCreate*(hdc: HDC): PSurface {.cdecl, importc: "cairo_win32_surface_create", dynlib: LIB_CAIRO.}
proc win32SurfaceCreateWithDdb*(hdc: HDC, format: TFormat, width, height: int32): PSurface {.cdecl, importc: "cairo_win32_surface_create_with_ddb", dynlib: LIB_CAIRO.}
proc win32SurfaceCreateWithDib*(format: TFormat, width, height: int32): PSurface{. cdecl, importc: "cairo_win32_surface_create_with_dib", dynlib: LIB_CAIRO.}
proc win32SurfaceGetDc*(surface: PSurface): HDC {.cdecl, importc: "cairo_win32_surface_get_dc", dynlib: LIB_CAIRO.}
proc win32SurfaceGetImage*(surface: PSurface): PSurface {.cdecl, importc: "cairo_win32_surface_get_image", dynlib: LIB_CAIRO.}
proc win32FontFaceCreateForLogfontw*(logfont: PLOGFONTW): PFontFace {.cdecl, importc: "cairo_win32_font_face_create_for_logfontw", dynlib: LIB_CAIRO.}
proc win32FontFaceCreateForHfont*(font: HFONT): PFontFace {.cdecl, importc: "cairo_win32_font_face_create_for_hfont", dynlib: LIB_CAIRO.}
proc win32ScaledFontSelectFont*(scaled_font: PScaledFont, hdc: HDC): TStatus{. cdecl, importc: "cairo_win32_scaled_font_select_font", dynlib: LIB_CAIRO.}
proc win32ScaledFontDoneFont*(scaled_font: PScaledFont) {.cdecl, importc: "cairo_win32_scaled_font_done_font", dynlib: LIB_CAIRO.}
proc win32ScaledFontGetMetricsFactor*(scaled_font: PScaledFont): float64{. cdecl, importc: "cairo_win32_scaled_font_get_metrics_factor", dynlib: LIB_CAIRO.}
proc win32ScaledFontGetLogicalToDevice*(scaled_font: PScaledFont, logical_to_device: PMatrix) {.cdecl, importc: "cairo_win32_scaled_font_get_logical_to_device", dynlib: LIB_CAIRO.}
proc win32ScaledFontGetDeviceToLogical*(scaled_font: PScaledFont, device_to_logical: PMatrix) {.cdecl, importc: "cairo_win32_scaled_font_get_device_to_logical", dynlib: LIB_CAIRO.}
# implementation
