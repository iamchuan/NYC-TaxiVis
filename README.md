# taxiVis-NYC

taxiVis-NYC

A flexdashbord + shiny in R for visualizing NYC taxi pick ups and drop offs.

Data workflow

Get data from NYC Taxi and Limousine Commission (TLC) (http://www.nyc.gov/html/tlc/html/about/trip_record_data.shtml), make changes in data.table

import pandas as pd
import carto
import cartoframes

cdb_auth_client = carto.auth.APIAuthClient(base_url, APIKEY)

df = pd.read_carto(cdb_auth_client, 'tablename')
# do fancy pandas operations (add/drop columns, change values, etc.)
df.sync_carto() # updates carto table with all changes from this session
Map workflow

The following will embed a CARTO map in a Jupyter notebook (interactive or static).

df = pd.read_carto(auth_client, 'tablename')
df.carto_map(interactive=True, stylecol='interesting_col')


Augment from Data Observatory

Not yet implemented
