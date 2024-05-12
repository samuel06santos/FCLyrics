defmodule FaroesteCabocloWeb.PageController do
  use FaroesteCabocloWeb, :controller
  use Timex


  def home(conn, _params) do
    render(conn, :home, layout: false, dia: _getDay())
  end

  def _getDay do
    agora = Timex.now("America/Sao_Paulo")# Timex.parse!("2024-05-12 00:00:00", "%Y-%m-%d %H:%M:%S", :strftime) |> Timex.to_datetime("America/Sao_Paulo")
    inicio_da_marmota =
      Timex.parse!("2024-02-06 00:00:00", "%Y-%m-%d %H:%M:%S", :strftime)
      |> Timex.to_datetime("America/Sao_Paulo")
      |> Timex.shift(days: -1) # corrige a contagem de dias

    Timex.diff(agora, inicio_da_marmota, :days)
  end
end
