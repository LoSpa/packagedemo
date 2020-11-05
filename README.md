
<!-- README.md is generated from README.Rmd. Please edit that file -->

# laurentspanu

``` r
library(laurentspanu)
library(tidyverse)
#> -- Attaching packages ------------------------------------------------------------------------------------------------------------------------------ tidyverse 1.3.0 --
#> v ggplot2 3.3.2     v purrr   0.3.4
#> v tibble  3.0.3     v dplyr   1.0.2
#> v tidyr   1.1.2     v stringr 1.4.0
#> v readr   1.3.1     v forcats 0.5.0
#> -- Conflicts --------------------------------------------------------------------------------------------------------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```

<!-- badges: start -->

<!-- badges: end -->

Le but de {laurentspanu} est de …

## Exemple

Ce package propose deux fonctions :

  - `imc()`
  - `multi_import_excel()`

## `imc()`

Fonction qui a pour but de calculer l’IMC qui correspond à une valeur
numérique.

``` r

imc(masse = 72, taille = 1.84)
#> [1] 21.26654
```

En utilisant le jeu de données `df_lospa` disponible avec le package

``` r

df_lospa %>% rowwise() %>% mutate(IMC = imc(masse = masse, taille = taille))
#> # A tibble: 7 x 3
#> # Rowwise: 
#>   masse taille   IMC
#>   <dbl>  <dbl> <dbl>
#> 1    72   1.82  21.7
#> 2    75   1.88  21.2
#> 3    80   1.9   22.2
#> 4    65   1.56  26.7
#> 5    99   1.78  31.2
#> 6    56   1.65  20.6
#> 7    73   1.7   25.3
```

## `multi_import_excel()`

Une fonction qui prend en paramètre un seul fichier de format ‘xlsx’ et
retourne un objet de format list contenant les différents tableaux de
chacun des onglets du fichier.  
La fonction est résistante aux onglets corrompus d’un fichier excel via
un `safely()` au sein de la fonction.  
De ce fait la sortie de la fonction est une liste constituée des
éléments `data` et `error`.  
Pour accéder aux données, choisir l’élément `data`.

``` r


tmp <- multi_import_excel(file = system.file("extdata","datasets.xlsx",package = "laurentspanu"))

df <- tmp$data  %>% map(dim)

df
#> $diamant
#> [1] 50 10
#> 
#> $voiture
#> [1] 50  2
#> 
#> $fleur
#> [1] 25  5
```
