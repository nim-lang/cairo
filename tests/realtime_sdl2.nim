## This example show how to have real time cairo using sdl2 backend

import sdl2, sdl2/gfx, math, random
import cairo

let
  w: int32 = 256
  h: int32 = 256

var
  surface = imageSurfaceCreate(FORMAT_ARGB32, w, h)
  frameCount = 0
  window: WindowPtr
  render: RendererPtr
  mainSerface: SurfacePtr
  mainTexture: TexturePtr
  evt = sdl2.defaultEvent

proc display() =
  ## Called every frame by main while loop

  # draw shiny sphere on gradient background
  var ctx = surface.create()
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
  ctx.arc(128.0, 128.0 + sin(float(frameCount)/10.0) * 20, 76.8, 0, 2 * PI)
  ctx.fill()

  inc frameCount

  # cairo surface -> sdl serface -> sdl texture -> copy to render
  var dataPtr = surface.getData()
  mainSerface.pixels = dataPtr
  mainTexture = render.createTextureFromSurface(mainSerface)
  render.copy(mainTexture, nil, nil)
  render.present()

discard sdl2.init(INIT_EVERYTHING)
window = createWindow("Real time SDL/Cairo example", 100, 100, cint w, cint h, SDL_WINDOW_SHOWN)
const
  rmask = uint32 0x000000ff
  gmask = uint32 0x0000ff00
  bmask = uint32 0x00ff0000
  amask = uint32 0xff000000
mainSerface = createRGBSurface(0, cint w, cint h, 32, rmask, gmask, bmask, amask)


render = createRenderer(window, -1, 0)

while true:
  while pollEvent(evt):
    if evt.kind == QuitEvent:
      quit(0)
  display()
  delay(14)
