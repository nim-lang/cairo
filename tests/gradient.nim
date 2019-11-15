# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, 256, 256)
  ctx = surface.create()

var linerGradient = patternCreateLinear(0.0, 0.0,  0.0, 256.0)
linerGradient.addColorStopRgba(1, 0, 0, 0, 1)
linerGradient.addColorStopRgba(0, 1, 1, 1, 1)
ctx.rectangle(0, 0, 256, 256)
ctx.setSource(linerGradient)
ctx.fill()

var radialGradient  = patternCreateRadial(115.2, 102.4, 25.6, 102.4,  102.4, 128.0)
radialGradient.addColorStopRgba(0, 1, 1, 1, 1)
radialGradient.addColorStopRgba(1, 0, 0, 0, 1)
ctx.setSource(radialGradient)
ctx.arc(128.0, 128.0, 76.8, 0, 2 * PI)
ctx.fill()

discard surface.writeToPng("tests/gradient.png")