# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

ctx.arc(128.0, 128.0, 76.8, 0, 2 * PI)
ctx.clip()

ctx.newPath()  # current path is not consumed by ctx.clip()
ctx.rectangle(0, 0, 256, 256)
ctx.fill()
ctx.setSourceRGB(0, 1, 0)
ctx.moveTo(0, 0)
ctx.lineTo(256, 256)
ctx.moveTo(256, 0)
ctx.lineTo(0, 256)
ctx.setLineWidth(10.0)
ctx.stroke()

discard surface.writeToPng("tests/clip.png")