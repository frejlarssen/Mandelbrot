defmodule Main do
  def demo() do
    small(-0.155, 1.032, -0.15)
  end
  def small(x0, y0, xn) do
    width = 960
    height = 540
    depth = 128
    k = (xn - x0) / width
    image = Mandel.mandelbrot(width, height, x0, y0, k, depth)
    PPM.write("small.ppm", image)
  end
end
