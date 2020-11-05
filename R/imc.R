

#' Indice de masse corporel - fonction A
#'
#' @param masse numeric
#' @param taille numeric
#'
#' @return a single numeric value
#' @export
#' @importFrom assertthat assert_that
#' @examples
#' imc(72, 1.82)
#'
imc <-  function(masse, taille) {

  assertthat::assert_that(is.numeric(masse))
  assertthat::assert_that(is.numeric(taille))

  if (taille > 2.0) {
    message("La taille doit être exprimée en m et non en cm")
  }

  imc <- masse / (taille ^2)

  return(imc)

}
