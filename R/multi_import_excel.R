

#' Lire les onglets d'un fichier excel
#'
#' @param file fichier xlsx en chaîne de caractères
#'
#' @return une liste
#' @export
#' @import assertthat readxl dplyr purrr
#' @examples
#'
multi_import_excel <-  function(file) {

assertthat::assert_that(is.character(file))
assertthat::has_extension(path = file, ext = "xlsx")

  # Sheet
  sheet_n <- excel_sheets(path = file)

  # map
  list_xls <- map(sheet_n, .f = ~ {
    read_excel(file, sheet = .x)


  })
  # rename
  names(list_xls) <- sheet_n

  return(list_xls)



}
