import dash
from dash import dcc, html
import pandas as pd
import plotly.express as px

app = dash.Dash(__name__)

# Read scraped data
def get_data():
    df = pd.read_csv("btc_prices.csv", names=["Timestamp", "Price"])
    df["Timestamp"] = pd.to_datetime(df["Timestamp"])
    return df

app.layout = html.Div([
    html.H1("Bitcoin Price Dashboard"),
    dcc.Graph(id='price-chart'),
    html.Div(id="latest-price"),
])

@app.callback(
    dash.dependencies.Output('price-chart', 'figure'),
    dash.dependencies.Output('latest-price', 'children'),
    dash.dependencies.Input('price-chart', 'id')
)
def update_dashboard(_):
    df = get_data()
    fig = px.line(df, x="Timestamp", y="Price", title="Bitcoin Price Over Time")
    latest_price = f"Latest Price: ${df.iloc[-1]['Price']}"
    return fig, latest_price

if __name__ == '__main__':
    app.run_server(debug=True)
