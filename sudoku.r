#install.packages('lpSolve')
#install.packages('sudoku')
library(lpSolve)
library(sudoku)

solve_sudoku <- function(given_numbers){

    constr_list <- list()

    # warunek 1
    for (i in 1:9){
        for (j in 1:9){
            constr <- array(0, c(9, 9, 9))
            for (k in 1:9){
                constr[i, j, k] <- 1
            }
            constr_list <- append(constr_list, list(constr))
        }
    }

    # warunek 2
    for (i in 1:9){
        for (j in 1:9){
            constr <- array(0, c(9, 9, 9))
            for (k in 1:9){
                constr[i, k, j] <- 1
            }
            constr_list <- append(constr_list, list(constr))
        }
    }

    # warunek 3
    for (i in 1:9){
        for (j in 1:9){
            constr <- array(0, c(9, 9, 9))
            for (k in 1:9){
                constr[k, i, j] <- 1
            }
            constr_list <- append(constr_list, list(constr))
        }
    }

    # warunek 4
    for (u in c(0, 3, 6)){
        for (v in c(0, 3, 6)){
            for (k in 1:9){
                constr <- array(0, c(9, 9, 9))
                for (i in 1:3){
                    for (j in 1:3){
                        constr[i + u, j + v, k] <- 1
                    }
                }
                constr_list <- append(constr_list, list(constr))
            }
        }
    }

    # condition 5
    place_element <- function(given_constr){
        constr_list <- list()
        for (n in 1:length(given_constr)){
            constr <- array(0, c(9, 9, 9))
            constr[given_constr[n][[1]][1],
             given_constr[n][[1]][2],
             given_constr[n][[1]][3]] <- 1
            constr_list <- append(constr_list, list(constr))
        }
        return(constr_list)
    }

    constr_list <- c(constr_list, place_element(given_numbers))

    # matrices to vectors
    constr_list <- lapply(constr_list, c)
    constr_vector <- unlist(constr_list)

    n <- length(given_numbers)

    # solve
    f.obj <- rep(1, 729)
    f.con <- matrix(constr_vector, nrow = 324 + n, byrow = TRUE)
    f.dir <- rep("=", 324 + n)
    f.rhs <- rep(1, 324 + n)
    solved_sudoku <- array(lp("max", f.obj, f.con, f.dir, f.rhs)$solution, c(9, 9, 9))
    sudoku <- array(0, c(9, 9))

    for (k in 1:9){
        for (j in 1:9){
            for (i in 1:9){
                if (solved_sudoku[i, j, k] == 1){
                    sudoku[i, j] <- k
                }
            }
        }
    }

    # print
    printSudoku(sudoku)
}

sudoku1 <- list(c(1, 1, 6), c(1, 2, 5), c(1, 7, 4),
c(2, 6, 1), c(3, 2, 8), c(3, 4, 2), c(3, 5, 5), c(3, 9, 9),
c(4, 6, 7), c(4, 9, 3), c(5, 2, 1), c(5, 6, 9), c(6, 1, 8),
c(6, 4, 1), c(6, 5, 3), c(6, 8, 6), c(7, 3, 5), c(7, 8, 9),
c(8, 5, 7), c(9, 2, 2), c(9, 4, 3), c(9, 5, 8), c(9, 9, 5))
solve_sudoku(sudoku1)

sudoku2 <- list(c(1, 2, 2), c(2, 4, 6), c(2, 9, 3),
c(3, 2, 7), c(3, 3, 4), c(3, 5, 8), c(4, 6, 3), c(4, 9, 2),
c(5, 2, 8), c(5, 5, 4), c(5, 8, 1), c(6, 1, 6), c(6, 4, 5),
c(7, 5, 1), c(7, 7, 7), c(7, 8, 8), c(8, 1, 5), c(8, 6, 9),
c(9, 8, 4))
solve_sudoku(sudoku2)