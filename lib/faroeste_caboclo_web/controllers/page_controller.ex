defmodule FaroesteCabocloWeb.PageController do
  use FaroesteCabocloWeb, :controller
  use Timex


  def home(conn, _params) do
    render(conn, :home, layout: false, dia: _getDay())
  end

  def _getDay do
    inicio_da_marmota = Timex.parse!("06/02/2024", "%d/%m/%Y", :strftime)
    Timex.diff(Timex.now("America/Sao_Paulo"), inicio_da_marmota, :days)
  end
end
