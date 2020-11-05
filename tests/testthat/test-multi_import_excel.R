test_that("multi_import_excel works", {

  expect_true(is.list(multi_import_excel(system.file("extdata","datasets.xlsx",package = "laurentspanu"))))

  })
