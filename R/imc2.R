

#' Indice de masse corporel - fonction imc2()
#'
#' @param masse numeric
#' @param taille numeric
#'
#' @return a single numeric value
#' @importFrom assertthat assert_that
#' @export
#' @examples
#' imc2(72, 1.82)
#'
#' \dontrun{
#' imc2("75", "1.7")
#' }
#'
imc2 <-  function(masse, taille) {

  assertthat::assert_that(is.numeric(masse))
  assertthat::assert_that(is.numeric(taille))

  if (taille > 2.0) {
    message("La taille doit etre exprimee en m et non en cm")
  }

  imc <- masse / (taille ^2)

  return(imc)

}
