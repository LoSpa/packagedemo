
#' is_num personnalise - function interne
#'
#' @param x an integer , numeric
#' @param y an integer, numeric
#' @ke
#' @return
#' @keywords Internal
#' @examples
#' is_num(25, "250")
#'
is_num <- function(x, y) {

  # fonction custom afin de pourvoir la passer à on_failure()
  is.num <- function(x) {is.numeric(x)}

  # on_failure : le but est de créér un message super custom
  assertthat::on_failure(is.num) <- function(call, env) {
    paste0(get(deparse(call$x)), " n'est pas numeric ou integer")
  }

  # validate_that du on_failure()
  # validate_that ne jette pas une erreur mais une chaine de caractères si erreur.
  # Apràs la fonction continuera !
 is_num_x <- assertthat::validate_that(is.num(x = x))
 is_num_y <- assertthat::validate_that(is.num(x = y))

 # Gestion des différents cas
 if(class(is_num_x) == "character" & class(is_num_y) == "character") {
    stop(paste(is_num_x, is_num_y, sep = " --- "))
  }

  if(class(is_num_x) == "character" & class(is_num_y) == "logical") {
    stop(is_num_x)
  }

  if(class(is_num_x) == "logical" & class(is_num_y) == "character") {
    stop(is_num_y)
  }
}
