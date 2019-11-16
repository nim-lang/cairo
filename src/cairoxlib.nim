#
# Translation of cairo-xlib.h version 1.4
# by Jeffrey Pohlmeyer
# updated to version 1.4 by Luiz Américo Pereira Câmara 2007
#

import
  cairo, x, xlib, xrender

include "cairo_pragma.nim"

proc xlibSurfaceCreate*(dpy: PDisplay, drawable: TDrawable, visual: PVisual, width, height: int32): PSurface {.cdecl, importc: "cairo_xlib_surface_create", libcairo.}
proc xlibSurfaceCreateForBitmap*(dpy: PDisplay, bitmap: TPixmap, screen: PScreen, width, height: int32): PSurface{. cdecl, importc: "cairo_xlib_surface_create_for_bitmap", libcairo.}
proc xlibSurfaceCreateWithXrenderFormat*(dpy: PDisplay, drawable: TDrawable, screen: PScreen, format: PXRenderPictFormat, width, height: int32): PSurface {.cdecl, importc: "cairo_xlib_surface_create_with_xrender_format", libcairo.}
proc xlibSurfaceGetDepth*(surface: PSurface): int32 {.cdecl, importc: "cairo_xlib_surface_get_depth", libcairo.}
proc xlibSurfaceGetDisplay*(surface: PSurface): PDisplay {.cdecl, importc: "cairo_xlib_surface_get_display", libcairo.}
proc xlibSurfaceGetDrawable*(surface: PSurface): TDrawable {.cdecl, importc: "cairo_xlib_surface_get_drawable", libcairo.}
proc xlibSurfaceGetHeight*(surface: PSurface): int32 {.cdecl, importc: "cairo_xlib_surface_get_height", libcairo.}
proc xlibSurfaceGetScreen*(surface: PSurface): PScreen {.cdecl, importc: "cairo_xlib_surface_get_screen", libcairo.}
proc xlibSurfaceGetVisual*(surface: PSurface): PVisual {.cdecl, importc: "cairo_xlib_surface_get_visual", libcairo.}
proc xlibSurfaceGetWidth*(surface: PSurface): int32 {.cdecl, importc: "cairo_xlib_surface_get_width", libcairo.}
proc xlibSurfaceSetSize*(surface: PSurface, width, height: int32) {.cdecl, importc: "cairo_xlib_surface_set_size", libcairo.}
proc xlibSurfaceSetDrawable*(surface: PSurface, drawable: TDrawable, width, height: int32) {.cdecl, importc: "cairo_xlib_surface_set_drawable", libcairo.}
# implementation
