
# Produção de colheita no mundo ------------------------------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------------------------------------------------------------
# Data: 16/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/transport -----------------------------------------------------------------------------------------

# Sobre o conjunto de dados ----------------------------------------------------------------------------------------------------------------

### Dados recentes sobre produção de colheita no mundo, baseado sobre
### estimativas publicadas pelo Food and Agriculture Organization (FAO).

### O FAO disponibiliza esses dados por país e região desde 1961. Os
### valores de produção são comunicados em toneladas.

# Pacotes necessários para as análises -----------------------------------------------------------------------------------------------------

library(tidyverse)

# Selecionar dados -------------------------------------------------------------------------------------------------------------------------

prod <- read.csv("coffee-bean-production.csv") 
view(prod)
