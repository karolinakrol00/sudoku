# Sudoku

Sudoku jest łamigłówką, której celem jest wypełnienie diagramu 9 x 9 w taki sposób, aby w każdym wierszu , w każdej kolumnie i w każdym z 9 podkwadratów 3 x 3 znalazło się po jednej cyfrze od 1 do 9. 

Algorytm zawarty w pliku sudoku.r pozwala na jego rozwiązanie. Bazuje on na zestawie 4 warunków i przedstawieniu sudoku jako sześcianu o wymairach 9 x 9 x 9. Poszczególne wymiary odzwierciedlają położenie elementu w wierszu (i), położenie elementu w kolumnie (j) i wartość elementu (k). 

![alt text](cube.png)

### Warunek 1:
$$\sum_{k=1}^{9} x(i, j, k) = 1$$

### Warunek 2:
$$\sum_{j=1}^{9} x(i, j, k) = 1$$

### Warunek 3:
$$\sum_{i=1}^{9} x(i, j, k) = 1$$

### Warunek 4:
$$\sum_{i=1}^{3} \sum_{j=1}^{3} x(i + U, j + V , k) = 1, U, V \in \{0, 3, 6\}$$

Warunki 1-3 zapewniają, że żadna z liczb nie pojawi się w kolumnie/wierszu więcej niż 1 raz. Warunek 4 gwarantuje, żadna liczba nie powtórzy się w podkwadracie 3 x 3.