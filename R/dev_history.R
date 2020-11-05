# Cacher ce fichier pour la création du package
usethis::use_build_ignore("dev_history.R")

# Définir une licence
usethis::use_gpl3_license("lospa_ISSeP") #usethis::use_mit_license("ISSeP")

# Créer une vignette (fichier .rmd et .md) pour documenter l'utilisation des fonctions package
usethis::use_vignette("laurentspanu")

usethis::use_git()

usethis::use_readme_rmd()
