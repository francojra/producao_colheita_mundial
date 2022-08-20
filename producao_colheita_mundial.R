
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
library(scales)
library(gridExtra)
library(pals)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

prod <- read.csv("coffee-bean-production.csv") 
view(prod)
names(prod)

# Selecionar dados -------------------------------------------------------------------------------------------------------------------------

prod <- prod %>%
  rename(producao = Crops...Coffee..green...656...Production...5510...tonnes) %>%
  select(Entity, Year, producao) %>%
  view()

prod1 <- prod %>%
  filter(Entity %in% c("Brazil", "Peru", "Mexico", "Venezuela",
         "Nicaragua", "Honduras", "China", "India", "Indonesia",
         "Ethiopia", "Vietnam", "Guatemala", "Nicaragua",
         "Colombia", "Uganda", "Madagascar")) %>%
  view()

prod2 <- prod1 %>%
  filter(Entity %in% c("Brazil", "Colombia", 
         "Mexico", "Indonesia",
         "Vietnam")) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

options(scipen = 999)

g1 <- ggplot(prod1, aes(x = fct_reorder(Entity, producao), 
                       y = producao, fill = Entity)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = as.vector(alphabet(16))) +
  scale_y_continuous(labels = comma, 
                     expand = expansion(mult = c(0, .1))) +
  labs(x = "País", y = "Produção de café (t)") +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none")
g1

g2 <- ggplot(prod2, aes(Year, producao, color = Entity)) +
  geom_point(size = 1.6) +
  geom_line(size = 0.8) +
  scale_y_continuous(labels = comma) +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Anos", y = "Produção de café (t)") +
  theme_minimal(base_size = 13) +
  theme(legend.position = c(0.1, 0.8), 
        legend.title = element_blank())
g2

grid.arrange(g1, g2)
