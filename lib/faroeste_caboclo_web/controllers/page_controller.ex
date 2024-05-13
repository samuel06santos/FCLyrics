defmodule FaroesteCabocloWeb.PageController do
  use FaroesteCabocloWeb, :controller
  use Timex


  def home(conn, _params) do
    render(conn, :home, layout: false, dia: _getDay(), porcentagem: _get_percent())
  end

  def _get_percent do
    # Retorna a porcentagem concluida: x / 1230
    (_getDay()/1230)*100 |> Float.ceil(2) |> dbg
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
