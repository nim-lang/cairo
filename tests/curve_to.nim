# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

var
  x=25.6
  y=128.0
  x1=102.4
  y1=230.4
  x2=153.6
  y2=25.6
  x3=230.4
  y3=128.0

ctx.moveTo(x, y)
ctx.curveTo(x1, y1, x2, y2, x3, y3)

ctx.setLineWidth( 10.0)
ctx.stroke()

ctx.setSourceRGBA(1, 0.2, 0.2, 0.6)
ctx.setLineWidth(6.0)
ctx.moveTo(x, y)
ctx.lineTo(x1, y1)
ctx.moveTo(x2, y2)
ctx.lineTo(x3, y3)
ctx.stroke()

discard surface.writeToPng("tests/curve_to.png")