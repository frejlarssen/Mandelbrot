defmodule Brot_mem do
  def mandelbrot(c, m, mem) do
    z0 = Cmplx.new(0, 0)
    i = 0
    test(i, z0, c, m, mem)
  end

  def test(i, z, c, m, mem) do
    case Map.get(mem, c) do
      nil ->
        i = calc(i, z, c, m, mem)
        Map.put(mem, z, i)
        i
      i ->
        i
    end
  end

  def calc(i, z, c, m, mem) do
    if i < m do
      if Cmplx.abs(z) > 2 do
        i
      else
        test(i + 1, Cmplx.add(Cmplx.sqr(z), c), c, m, mem)
      end
    else
      0
    end
  end
end
