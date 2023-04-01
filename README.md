# Sudoku

Sudoku jest łamigłówką, której celem jest wypełnienie diagramu 9 x 9 w taki sposób, aby w każdym wierszu , w każdej kolumnie i w każdym z 9 podkwadratów 3 x 3 znalazło się po jednej cyfrze od 1 do 9. 

Algorytm zawarty w pliku sudoku.r pozwala na jego rozwiązanie. Bazuje on na zestawie 4 warunków i przedstawieniu sudoku jako sześcianu o wymairach 9 x 9 x 9. Poszczególne wymiary odzwierciedlają położenie elementu w wierszu (i), położenie elementu w kolumnie (j) i wartość elementu (k). 

### Warunek 1:
$$\sum_{k=1}^{9} x(i, j, k) = 1$$

### Warunek 2:
$$\sum_{j=1}^{9} x(i, j, k) = 1$$

### Warunek 3:
$$\sum_{i=1}^{9} x(i, j, k) = 1$$

### Warunek 4:
$$\sum_{i=1}^{3} \sum_{j=1}^{3} x(i + U, j + V , k) = 1, U, V \in \{0, 3, 6\}$$

Warunki 1-3 zapewniają, że żadna z liczb nie pojawi się w kolumnie/wierszu więcej niż 1 raz. Warunek 4 gwarantuje, żadna liczba nie powtórzy się w podkwadracie 3 x 3. Algorytm generuje poszczególne warunki. Warunki te zostaną użyte podczas rozwiązywania programu liniowego. Każdy z 4 warunków generuje po 81 warunków ograniczających dla programu liniowego. Dodatkowo, każdy z elementów umieszczonych początkowo w sudoku, wprowadza jeden warunek ograniczający. Program liniowy rozwiązywany jest za pomocą funkcji 'lp' z biblioteki 'lpSolve'. Jako wynik działania algorytmu zwracane jest rozwiązane sudoku.

### Przykład 1
![swappy-20230401_171604](https://user-images.githubusercontent.com/94802710/229297781-4e0941a7-c3ce-4cf8-a1a9-2cadf70f8a50.png) ---->
![swappy-20230401_171637](https://user-images.githubusercontent.com/94802710/229297823-973fc409-80a3-4aa1-8d75-656320781d40.png)

### Przykład 2
![swappy-20230401_171838](https://user-images.githubusercontent.com/94802710/229297933-a01c2279-86aa-47d9-9d90-cc3b85334a3d.png) ---->
![swappy-20230401_170149](https://user-images.githubusercontent.com/94802710/229297001-80ceafa9-87ad-45a4-abbb-21c60674e583.png)

### Przykład 3
![swappy-20230401_164751](https://user-images.githubusercontent.com/94802710/229296295-db076d91-7415-48a0-ab1b-f72bf8db4bf3.png) ---->
![swappy-20230401_165002](https://user-images.githubusercontent.com/94802710/229296320-ed429074-c554-4fd0-aff0-33105bc51e59.png)
