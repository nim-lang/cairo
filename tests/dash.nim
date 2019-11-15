# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

var
  dashes = @[
    50.0,  # ink
    10.0,  # skip
    10.0,  # ink
    10.0   # skip
  ]
  offset = -50.0

ctx.setDash(dashes, offset)
ctx.setLineWidth(10.0)

ctx.moveTo(128.0, 25.6)
ctx.lineTo(230.4, 230.4)
ctx.relLineTo(-102.4, 0.0)
ctx.curveTo(51.2, 230.4, 51.2, 128.0, 128.0, 128.0)

ctx.stroke()

discard surface.writeToPng("tests/dash.png")