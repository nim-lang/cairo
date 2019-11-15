# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

ctx.arc(128.0, 128.0, 76.8, 0, 2*PI)
ctx.clip()
ctx.newPath() # path not consumed by clip()

var
  image = imageSurfaceCreateFromPng("tests/data/romedalen.png")
  w = float image.getWidth()
  h = float image.getHeight()

ctx.scale(256.0 / w, 256.0 / h)

ctx.setSource(image, 0, 0)
ctx.paint()

ctx.stroke()

discard surface.writeToPng("tests/clip_image.png")