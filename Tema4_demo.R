library(tidyverse)
library(readr)
estudiantes_limpio <- read_csv("C:/Users/VICTUS/Downloads/estudiantes_limpio.csv")
View(estudiantes_limpio)
df <- read_csv("C:/Users/VICTUS/Downloads/estudiantes_limpio.csv")
glimpse(df)
colSums(is.na(df))


df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(asistencia_pct = replace_na(asistencia_pct, mean(asistencia_pct, na.rm = TRUE)))
colSums(is.na(df_limpio)) # debe ser 0 en todas las columnas
nrow(df_limpio) # 6 filas


aprobados <- df_limpio %>%
  filter(nota >= 10.5) %>%
  mutate(estado = 'Aprobado')
print(select(aprobados, nombre, nota, estado))
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota))
print(promedio_por_curso)


write_csv(df_limpio, 'estudiantes_limpio_R.csv')
