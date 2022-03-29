defmodule Cmplx do
  def new(r, i) do
    {r, i}
  end

  def add({ra, ia}, {rb, ib}) do
    {ra + rb, ia + ib}
  end

  def sqr({r, i}) do
    {:math.pow(r, 2) - :math.pow(i, 2), 2 * r * i}
  end

  def abs({r, i}) do
    :math.sqrt(:math.pow(r, 2) + :math.pow(i, 2))
  end
end
