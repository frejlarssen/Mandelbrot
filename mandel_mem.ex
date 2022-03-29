defmodule Mandel_mem do
  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w, h) ->
        Cmplx.new(x + k * (w - 1), y - k * (h - 1))
      end
    mem = %{}
    rows(width, height, trans, depth, [], mem)
  end

  def rows(_width, 0, _trans, _depth, acc, _mem) do acc end
  def rows(width, height, trans, depth, acc, mem) do
    acc = [pixels(width, height, trans, depth, [], mem) | acc]
    rows(width, height - 1, trans, depth, acc, mem)
  end

  def pixels(0, _height, _trans, _depth, acc, _mem) do acc end
  def pixels(width, height, trans, depth, acc, mem) do
    complex = trans.(width, height)
    d = Brot.mandelbrot(complex, depth, mem)
    color = Color.convert(d, depth)
    acc = [color | acc]
    pixels(width - 1, height, trans, depth, acc, mem)
  end
end
