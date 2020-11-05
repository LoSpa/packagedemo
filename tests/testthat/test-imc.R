test_that("imc works", {

  expect_true(is_numeric(imc(masse = 80, taille = 1.80)))
  expect_equal(round(imc(masse = 80, taille = 1.80), digits = 2), 24.69)

  })
