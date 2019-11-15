# generates tests markdown

import os
import strutils


echo """
# cairo

Nim cairo wrapper, solving your vector and text drawing needs.

"""


proc cutBetween(str, a, b: string): string =
  let
    cutA = str.find(a)
    cutB = str.find(b)
  if cutA == -1 or cutB == -1:
    return ""
  return str[cutA + a.len..<cutB]


for kind, path in walkDir("tests"):
  if path.endsWith("nim"):
    let code = readFile(path)
    let innerCode = code.cutBetween("surface.create()\n", "\ndiscard surface.writeToPng(")
    echo "## example: ", path.replace("\\", "/")
    echo "```nim"
    echo innerCode
    echo "```"
    echo "![example output](", path.replace(".nim", ".png").replace("\\", "/"), ")"
    echo ""


echo """

"""
