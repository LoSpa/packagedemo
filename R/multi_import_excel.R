

#' Lire les onglets d'un fichier excel
#'
#' @param file fichier xlsx en chaîne de caractères
#'
#' @return une liste
#' @export
#' @import assertthat readxl dplyr purrr
#' @examples
#' multi_import_excel(file = system.file("extdata","datasets.xlsx",package = "laurentspanu"))
multi_import_excel <-  function(file) {

assertthat::assert_that(is.character(file))
assertthat::has_extension(path = file, ext = "xlsx")

  # Sheet
  sheet_n <- excel_sheets(path = file)

  # map
  list_fct <- function(sheet_n, list) {
    map(sheet_n, .f = ~ {
     read_excel(list, sheet = .x)})

  }
  # safe function
 safe_list_fct <- safely(list_fct)

 # data handling...
  list_xls <- safe_list_fct(sheet_n = sheet_n, list = file)

  # rename
  names(list_xls$result) <- sheet_n


  return(list(data = list_xls$result, error =  list_xls$error))



}
