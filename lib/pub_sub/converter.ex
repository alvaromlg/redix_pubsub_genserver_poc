defmodule PubSub.Converter do

  @moduledoc """
    Converting files with ExMagick to png, pdf, etc
  """

  def convert_to_pdf(filepath) do
    name = Path.rootname(filepath)
    ExMagick.init!()
    |> ExMagick.image_load!(Path.absname(filepath))
    |> ExMagick.image_dump!("#{name}.pdf")
    IO.puts "Converted #{name}.png to #{name}.pdf inside data/ folder"
  end

end
