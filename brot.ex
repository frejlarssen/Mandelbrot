defmodule Brot do
  def mandelbrot(c, m) do
    z0 = Cmplx.new(0, 0)
    i = 0
    test(i, z0, c, m)
  end

  def test(i, z, c, m) do
    if i < m do
      if Cmplx.abs(z) > 2 do
        i
      else
        test(i + 1, Cmplx.add(Cmplx.sqr(z), c), c, m)
      end
    else
      0
    end
  end
end
