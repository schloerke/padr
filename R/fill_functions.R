
fill_na_by_mean <- function(x, ...){
  arguments <- as.list(match.call())
  x_to_fill <- as.data.frame(x)

  if(length(arguments) == 2) {
    cols_to_fill_ind <- sapply(x_to_fill, class) %in% c('integer', 'numeric') %>% which
  } else {
    cols_to_fill_names <- arguments[3:length(arguments)] %>% as.character
    cols_to_fill_ind   <- colnames(x_to_fill) %in% cols_to_fill_names %>% which
    if(length(cols_to_fill_ind) != cols_to_fill_names) {
      stop('One or more supplied variables to fill is not a column name.')
    }
  }

  means <- x_to_fill[cols_to_fill] %>% colMeans(na.rm = TRUE)
  fill_na <- function(x, m) ifelse(x %>% is.na, m, x)

  filled <- mapply(fill_na, x_to_fill[cols_to_fill_ind], means)

  for( i in seq_along(ncol(filled)) ){
    x_to_fill[colnames(x_to_fill) == ( colnames(filled)[i] ) ] <- filled[,i]
  }
  class(x_to_fill) <- class(x)
  return(x_to_fill)
}

