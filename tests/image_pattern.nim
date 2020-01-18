# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

var
  image = imageSurfaceCreateFromPng("tests/data/romedalen.png")
  w = float image.getWidth()
  h = float image.getHeight()

var pattern = patternCreateForSurface(image)
pattern.setExtend(EXTEND_REPEAT)

ctx.translate(128.0, 128.0)
ctx.rotate(PI / 4)
ctx.scale(1.0 / sqrt(2.0), 1.0 / sqrt(2.0))
ctx.translate(-128.0, -128.0)

var matrix: TMatrix
initScale(addr matrix, w/256.0 * 5.0, h/256.0 * 5.0)
pattern.setMatrix(addr matrix)

ctx.setSource(pattern)

ctx.rectangle(0, 0, 256.0, 256.0)
ctx.fill()

discard surface.writeToPng("tests/image_pattern.png")