defmodule Mandel do
  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w, h) ->
        Cmplx.new(x + k * (w - 1), y - k * (h - 1))
      end
    rows(width, height, trans, depth, [])
  end

  def rows(_width, 0, _trans, _depth, acc) do acc end
  def rows(width, height, trans, depth, acc) do
    acc = [pixels(width, height, trans, depth, []) | acc]
    rows(width, height - 1, trans, depth, acc)
  end

  def pixels(0, _height, _trans, _depth, acc) do acc end
  def pixels(width, height, trans, depth, acc) do
    complex = trans.(width, height)
    d = Brot.mandelbrot(complex, depth)
    color = Color.convert(d, depth)
    acc = [color | acc]
    pixels(width - 1, height, trans, depth, acc)
  end
end
