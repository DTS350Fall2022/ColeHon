---
title: "Task 4"
author: "Cole Hon"
date: "9/8/2022"
output:
  html_document:
    theme: cosmo
    keep_md: true
editor_options: 
  chunk_output_type: console
---


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
## ✓ readr   2.1.2     ✓ forcats 0.5.1
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```


```r
iris_data <- iris 
tibble(iris_data)
```

```
## # A tibble: 150 × 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          5.1         3.5          1.4         0.2 setosa 
##  2          4.9         3            1.4         0.2 setosa 
##  3          4.7         3.2          1.3         0.2 setosa 
##  4          4.6         3.1          1.5         0.2 setosa 
##  5          5           3.6          1.4         0.2 setosa 
##  6          5.4         3.9          1.7         0.4 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          5           3.4          1.5         0.2 setosa 
##  9          4.4         2.9          1.4         0.2 setosa 
## 10          4.9         3.1          1.5         0.1 setosa 
## # … with 140 more rows
```


```r
arrange_Sepal.Length <- arrange(iris_data, Sepal.Length)
head(arrange_Sepal.Length, 10)
```

```
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1           4.3         3.0          1.1         0.1  setosa
## 2           4.4         2.9          1.4         0.2  setosa
## 3           4.4         3.0          1.3         0.2  setosa
## 4           4.4         3.2          1.3         0.2  setosa
## 5           4.5         2.3          1.3         0.3  setosa
## 6           4.6         3.1          1.5         0.2  setosa
## 7           4.6         3.4          1.4         0.3  setosa
## 8           4.6         3.6          1.0         0.2  setosa
## 9           4.6         3.2          1.4         0.2  setosa
## 10          4.7         3.2          1.3         0.2  setosa
```


```r
testdat <- select(iris_data, Species, Petal.Width)
testdat
```

```
##        Species Petal.Width
## 1       setosa         0.2
## 2       setosa         0.2
## 3       setosa         0.2
## 4       setosa         0.2
## 5       setosa         0.2
## 6       setosa         0.4
## 7       setosa         0.3
## 8       setosa         0.2
## 9       setosa         0.2
## 10      setosa         0.1
## 11      setosa         0.2
## 12      setosa         0.2
## 13      setosa         0.1
## 14      setosa         0.1
## 15      setosa         0.2
## 16      setosa         0.4
## 17      setosa         0.4
## 18      setosa         0.3
## 19      setosa         0.3
## 20      setosa         0.3
## 21      setosa         0.2
## 22      setosa         0.4
## 23      setosa         0.2
## 24      setosa         0.5
## 25      setosa         0.2
## 26      setosa         0.2
## 27      setosa         0.4
## 28      setosa         0.2
## 29      setosa         0.2
## 30      setosa         0.2
## 31      setosa         0.2
## 32      setosa         0.4
## 33      setosa         0.1
## 34      setosa         0.2
## 35      setosa         0.2
## 36      setosa         0.2
## 37      setosa         0.2
## 38      setosa         0.1
## 39      setosa         0.2
## 40      setosa         0.2
## 41      setosa         0.3
## 42      setosa         0.3
## 43      setosa         0.2
## 44      setosa         0.6
## 45      setosa         0.4
## 46      setosa         0.3
## 47      setosa         0.2
## 48      setosa         0.2
## 49      setosa         0.2
## 50      setosa         0.2
## 51  versicolor         1.4
## 52  versicolor         1.5
## 53  versicolor         1.5
## 54  versicolor         1.3
## 55  versicolor         1.5
## 56  versicolor         1.3
## 57  versicolor         1.6
## 58  versicolor         1.0
## 59  versicolor         1.3
## 60  versicolor         1.4
## 61  versicolor         1.0
## 62  versicolor         1.5
## 63  versicolor         1.0
## 64  versicolor         1.4
## 65  versicolor         1.3
## 66  versicolor         1.4
## 67  versicolor         1.5
## 68  versicolor         1.0
## 69  versicolor         1.5
## 70  versicolor         1.1
## 71  versicolor         1.8
## 72  versicolor         1.3
## 73  versicolor         1.5
## 74  versicolor         1.2
## 75  versicolor         1.3
## 76  versicolor         1.4
## 77  versicolor         1.4
## 78  versicolor         1.7
## 79  versicolor         1.5
## 80  versicolor         1.0
## 81  versicolor         1.1
## 82  versicolor         1.0
## 83  versicolor         1.2
## 84  versicolor         1.6
## 85  versicolor         1.5
## 86  versicolor         1.6
## 87  versicolor         1.5
## 88  versicolor         1.3
## 89  versicolor         1.3
## 90  versicolor         1.3
## 91  versicolor         1.2
## 92  versicolor         1.4
## 93  versicolor         1.2
## 94  versicolor         1.0
## 95  versicolor         1.3
## 96  versicolor         1.2
## 97  versicolor         1.3
## 98  versicolor         1.3
## 99  versicolor         1.1
## 100 versicolor         1.3
## 101  virginica         2.5
## 102  virginica         1.9
## 103  virginica         2.1
## 104  virginica         1.8
## 105  virginica         2.2
## 106  virginica         2.1
## 107  virginica         1.7
## 108  virginica         1.8
## 109  virginica         1.8
## 110  virginica         2.5
## 111  virginica         2.0
## 112  virginica         1.9
## 113  virginica         2.1
## 114  virginica         2.0
## 115  virginica         2.4
## 116  virginica         2.3
## 117  virginica         1.8
## 118  virginica         2.2
## 119  virginica         2.3
## 120  virginica         1.5
## 121  virginica         2.3
## 122  virginica         2.0
## 123  virginica         2.0
## 124  virginica         1.8
## 125  virginica         2.1
## 126  virginica         1.8
## 127  virginica         1.8
## 128  virginica         1.8
## 129  virginica         2.1
## 130  virginica         1.6
## 131  virginica         1.9
## 132  virginica         2.0
## 133  virginica         2.2
## 134  virginica         1.5
## 135  virginica         1.4
## 136  virginica         2.3
## 137  virginica         2.4
## 138  virginica         1.8
## 139  virginica         1.8
## 140  virginica         2.1
## 141  virginica         2.4
## 142  virginica         2.3
## 143  virginica         1.9
## 144  virginica         2.3
## 145  virginica         2.5
## 146  virginica         2.3
## 147  virginica         1.9
## 148  virginica         2.0
## 149  virginica         2.3
## 150  virginica         1.8
```


```r
species_mean <- group_by(iris_data, Species)
species_mean <- summarize(species_mean, v1 = mean(Sepal.Length), v2 = mean(Sepal.Width),
                          v3 = mean(Petal.Length),
                          v4 = mean(Petal.Width))
species_mean
```

```
## # A tibble: 3 × 5
##   Species       v1    v2    v3    v4
##   <fct>      <dbl> <dbl> <dbl> <dbl>
## 1 setosa      5.01  3.43  1.46 0.246
## 2 versicolor  5.94  2.77  4.26 1.33 
## 3 virginica   6.59  2.97  5.55 2.03
```


```r
iris_min <- filter(iris_data, Sepal.Width >= 3, Petal.Width != 2.5)
iris_min
```

```
##    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1           5.1         3.5          1.4         0.2     setosa
## 2           4.9         3.0          1.4         0.2     setosa
## 3           4.7         3.2          1.3         0.2     setosa
## 4           4.6         3.1          1.5         0.2     setosa
## 5           5.0         3.6          1.4         0.2     setosa
## 6           5.4         3.9          1.7         0.4     setosa
## 7           4.6         3.4          1.4         0.3     setosa
## 8           5.0         3.4          1.5         0.2     setosa
## 9           4.9         3.1          1.5         0.1     setosa
## 10          5.4         3.7          1.5         0.2     setosa
## 11          4.8         3.4          1.6         0.2     setosa
## 12          4.8         3.0          1.4         0.1     setosa
## 13          4.3         3.0          1.1         0.1     setosa
## 14          5.8         4.0          1.2         0.2     setosa
## 15          5.7         4.4          1.5         0.4     setosa
## 16          5.4         3.9          1.3         0.4     setosa
## 17          5.1         3.5          1.4         0.3     setosa
## 18          5.7         3.8          1.7         0.3     setosa
## 19          5.1         3.8          1.5         0.3     setosa
## 20          5.4         3.4          1.7         0.2     setosa
## 21          5.1         3.7          1.5         0.4     setosa
## 22          4.6         3.6          1.0         0.2     setosa
## 23          5.1         3.3          1.7         0.5     setosa
## 24          4.8         3.4          1.9         0.2     setosa
## 25          5.0         3.0          1.6         0.2     setosa
## 26          5.0         3.4          1.6         0.4     setosa
## 27          5.2         3.5          1.5         0.2     setosa
## 28          5.2         3.4          1.4         0.2     setosa
## 29          4.7         3.2          1.6         0.2     setosa
## 30          4.8         3.1          1.6         0.2     setosa
## 31          5.4         3.4          1.5         0.4     setosa
## 32          5.2         4.1          1.5         0.1     setosa
## 33          5.5         4.2          1.4         0.2     setosa
## 34          4.9         3.1          1.5         0.2     setosa
## 35          5.0         3.2          1.2         0.2     setosa
## 36          5.5         3.5          1.3         0.2     setosa
## 37          4.9         3.6          1.4         0.1     setosa
## 38          4.4         3.0          1.3         0.2     setosa
## 39          5.1         3.4          1.5         0.2     setosa
## 40          5.0         3.5          1.3         0.3     setosa
## 41          4.4         3.2          1.3         0.2     setosa
## 42          5.0         3.5          1.6         0.6     setosa
## 43          5.1         3.8          1.9         0.4     setosa
## 44          4.8         3.0          1.4         0.3     setosa
## 45          5.1         3.8          1.6         0.2     setosa
## 46          4.6         3.2          1.4         0.2     setosa
## 47          5.3         3.7          1.5         0.2     setosa
## 48          5.0         3.3          1.4         0.2     setosa
## 49          7.0         3.2          4.7         1.4 versicolor
## 50          6.4         3.2          4.5         1.5 versicolor
## 51          6.9         3.1          4.9         1.5 versicolor
## 52          6.3         3.3          4.7         1.6 versicolor
## 53          5.9         3.0          4.2         1.5 versicolor
## 54          6.7         3.1          4.4         1.4 versicolor
## 55          5.6         3.0          4.5         1.5 versicolor
## 56          5.9         3.2          4.8         1.8 versicolor
## 57          6.6         3.0          4.4         1.4 versicolor
## 58          6.7         3.0          5.0         1.7 versicolor
## 59          5.4         3.0          4.5         1.5 versicolor
## 60          6.0         3.4          4.5         1.6 versicolor
## 61          6.7         3.1          4.7         1.5 versicolor
## 62          5.6         3.0          4.1         1.3 versicolor
## 63          6.1         3.0          4.6         1.4 versicolor
## 64          5.7         3.0          4.2         1.2 versicolor
## 65          7.1         3.0          5.9         2.1  virginica
## 66          6.5         3.0          5.8         2.2  virginica
## 67          7.6         3.0          6.6         2.1  virginica
## 68          6.5         3.2          5.1         2.0  virginica
## 69          6.8         3.0          5.5         2.1  virginica
## 70          6.4         3.2          5.3         2.3  virginica
## 71          6.5         3.0          5.5         1.8  virginica
## 72          7.7         3.8          6.7         2.2  virginica
## 73          6.9         3.2          5.7         2.3  virginica
## 74          6.7         3.3          5.7         2.1  virginica
## 75          7.2         3.2          6.0         1.8  virginica
## 76          6.1         3.0          4.9         1.8  virginica
## 77          7.2         3.0          5.8         1.6  virginica
## 78          7.9         3.8          6.4         2.0  virginica
## 79          7.7         3.0          6.1         2.3  virginica
## 80          6.3         3.4          5.6         2.4  virginica
## 81          6.4         3.1          5.5         1.8  virginica
## 82          6.0         3.0          4.8         1.8  virginica
## 83          6.9         3.1          5.4         2.1  virginica
## 84          6.7         3.1          5.6         2.4  virginica
## 85          6.9         3.1          5.1         2.3  virginica
## 86          6.8         3.2          5.9         2.3  virginica
## 87          6.7         3.0          5.2         2.3  virginica
## 88          6.5         3.0          5.2         2.0  virginica
## 89          6.2         3.4          5.4         2.3  virginica
## 90          5.9         3.0          5.1         1.8  virginica
```



```r
iris_size <- iris_data %>%
  mutate(Sepal.Size = 
           case_when(
             Sepal.Length < 5 ~ "small",
             Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
             Sepal.Length >= 6.5 ~ "large"))
head(iris_size)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species Sepal.Size
## 1          5.1         3.5          1.4         0.2  setosa     medium
## 2          4.9         3.0          1.4         0.2  setosa      small
## 3          4.7         3.2          1.3         0.2  setosa      small
## 4          4.6         3.1          1.5         0.2  setosa      small
## 5          5.0         3.6          1.4         0.2  setosa     medium
## 6          5.4         3.9          1.7         0.4  setosa     medium
```



```r
iris_rank <- arrange(iris_data, desc(Petal.Length))
mutate(iris_rank, rank=min_rank(Petal.Length))
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species rank
## 1            7.7         2.6          6.9         2.3  virginica  150
## 2            7.7         3.8          6.7         2.2  virginica  148
## 3            7.7         2.8          6.7         2.0  virginica  148
## 4            7.6         3.0          6.6         2.1  virginica  147
## 5            7.9         3.8          6.4         2.0  virginica  146
## 6            7.3         2.9          6.3         1.8  virginica  145
## 7            7.2         3.6          6.1         2.5  virginica  142
## 8            7.4         2.8          6.1         1.9  virginica  142
## 9            7.7         3.0          6.1         2.3  virginica  142
## 10           6.3         3.3          6.0         2.5  virginica  140
## 11           7.2         3.2          6.0         1.8  virginica  140
## 12           7.1         3.0          5.9         2.1  virginica  138
## 13           6.8         3.2          5.9         2.3  virginica  138
## 14           6.5         3.0          5.8         2.2  virginica  135
## 15           6.7         2.5          5.8         1.8  virginica  135
## 16           7.2         3.0          5.8         1.6  virginica  135
## 17           6.9         3.2          5.7         2.3  virginica  132
## 18           6.7         3.3          5.7         2.1  virginica  132
## 19           6.7         3.3          5.7         2.5  virginica  132
## 20           6.3         2.9          5.6         1.8  virginica  126
## 21           6.4         2.8          5.6         2.1  virginica  126
## 22           6.4         2.8          5.6         2.2  virginica  126
## 23           6.1         2.6          5.6         1.4  virginica  126
## 24           6.3         3.4          5.6         2.4  virginica  126
## 25           6.7         3.1          5.6         2.4  virginica  126
## 26           6.8         3.0          5.5         2.1  virginica  123
## 27           6.5         3.0          5.5         1.8  virginica  123
## 28           6.4         3.1          5.5         1.8  virginica  123
## 29           6.9         3.1          5.4         2.1  virginica  121
## 30           6.2         3.4          5.4         2.3  virginica  121
## 31           6.4         2.7          5.3         1.9  virginica  119
## 32           6.4         3.2          5.3         2.3  virginica  119
## 33           6.7         3.0          5.2         2.3  virginica  117
## 34           6.5         3.0          5.2         2.0  virginica  117
## 35           6.0         2.7          5.1         1.6 versicolor  109
## 36           5.8         2.7          5.1         1.9  virginica  109
## 37           6.5         3.2          5.1         2.0  virginica  109
## 38           5.8         2.8          5.1         2.4  virginica  109
## 39           6.3         2.8          5.1         1.5  virginica  109
## 40           6.9         3.1          5.1         2.3  virginica  109
## 41           5.8         2.7          5.1         1.9  virginica  109
## 42           5.9         3.0          5.1         1.8  virginica  109
## 43           6.7         3.0          5.0         1.7 versicolor  105
## 44           5.7         2.5          5.0         2.0  virginica  105
## 45           6.0         2.2          5.0         1.5  virginica  105
## 46           6.3         2.5          5.0         1.9  virginica  105
## 47           6.9         3.1          4.9         1.5 versicolor  100
## 48           6.3         2.5          4.9         1.5 versicolor  100
## 49           5.6         2.8          4.9         2.0  virginica  100
## 50           6.3         2.7          4.9         1.8  virginica  100
## 51           6.1         3.0          4.9         1.8  virginica  100
## 52           5.9         3.2          4.8         1.8 versicolor   96
## 53           6.8         2.8          4.8         1.4 versicolor   96
## 54           6.2         2.8          4.8         1.8  virginica   96
## 55           6.0         3.0          4.8         1.8  virginica   96
## 56           7.0         3.2          4.7         1.4 versicolor   91
## 57           6.3         3.3          4.7         1.6 versicolor   91
## 58           6.1         2.9          4.7         1.4 versicolor   91
## 59           6.1         2.8          4.7         1.2 versicolor   91
## 60           6.7         3.1          4.7         1.5 versicolor   91
## 61           6.5         2.8          4.6         1.5 versicolor   88
## 62           6.6         2.9          4.6         1.3 versicolor   88
## 63           6.1         3.0          4.6         1.4 versicolor   88
## 64           6.4         3.2          4.5         1.5 versicolor   80
## 65           5.7         2.8          4.5         1.3 versicolor   80
## 66           5.6         3.0          4.5         1.5 versicolor   80
## 67           6.2         2.2          4.5         1.5 versicolor   80
## 68           6.0         2.9          4.5         1.5 versicolor   80
## 69           5.4         3.0          4.5         1.5 versicolor   80
## 70           6.0         3.4          4.5         1.6 versicolor   80
## 71           4.9         2.5          4.5         1.7  virginica   80
## 72           6.7         3.1          4.4         1.4 versicolor   76
## 73           6.6         3.0          4.4         1.4 versicolor   76
## 74           6.3         2.3          4.4         1.3 versicolor   76
## 75           5.5         2.6          4.4         1.2 versicolor   76
## 76           6.4         2.9          4.3         1.3 versicolor   74
## 77           6.2         2.9          4.3         1.3 versicolor   74
## 78           5.9         3.0          4.2         1.5 versicolor   70
## 79           5.6         2.7          4.2         1.3 versicolor   70
## 80           5.7         3.0          4.2         1.2 versicolor   70
## 81           5.7         2.9          4.2         1.3 versicolor   70
## 82           5.8         2.7          4.1         1.0 versicolor   67
## 83           5.6         3.0          4.1         1.3 versicolor   67
## 84           5.7         2.8          4.1         1.3 versicolor   67
## 85           5.5         2.3          4.0         1.3 versicolor   62
## 86           6.0         2.2          4.0         1.0 versicolor   62
## 87           6.1         2.8          4.0         1.3 versicolor   62
## 88           5.5         2.5          4.0         1.3 versicolor   62
## 89           5.8         2.6          4.0         1.2 versicolor   62
## 90           5.2         2.7          3.9         1.4 versicolor   59
## 91           5.6         2.5          3.9         1.1 versicolor   59
## 92           5.8         2.7          3.9         1.2 versicolor   59
## 93           5.5         2.4          3.8         1.1 versicolor   58
## 94           5.5         2.4          3.7         1.0 versicolor   57
## 95           5.6         2.9          3.6         1.3 versicolor   56
## 96           5.0         2.0          3.5         1.0 versicolor   54
## 97           5.7         2.6          3.5         1.0 versicolor   54
## 98           4.9         2.4          3.3         1.0 versicolor   52
## 99           5.0         2.3          3.3         1.0 versicolor   52
## 100          5.1         2.5          3.0         1.1 versicolor   51
## 101          4.8         3.4          1.9         0.2     setosa   49
## 102          5.1         3.8          1.9         0.4     setosa   49
## 103          5.4         3.9          1.7         0.4     setosa   45
## 104          5.7         3.8          1.7         0.3     setosa   45
## 105          5.4         3.4          1.7         0.2     setosa   45
## 106          5.1         3.3          1.7         0.5     setosa   45
## 107          4.8         3.4          1.6         0.2     setosa   38
## 108          5.0         3.0          1.6         0.2     setosa   38
## 109          5.0         3.4          1.6         0.4     setosa   38
## 110          4.7         3.2          1.6         0.2     setosa   38
## 111          4.8         3.1          1.6         0.2     setosa   38
## 112          5.0         3.5          1.6         0.6     setosa   38
## 113          5.1         3.8          1.6         0.2     setosa   38
## 114          4.6         3.1          1.5         0.2     setosa   25
## 115          5.0         3.4          1.5         0.2     setosa   25
## 116          4.9         3.1          1.5         0.1     setosa   25
## 117          5.4         3.7          1.5         0.2     setosa   25
## 118          5.7         4.4          1.5         0.4     setosa   25
## 119          5.1         3.8          1.5         0.3     setosa   25
## 120          5.1         3.7          1.5         0.4     setosa   25
## 121          5.2         3.5          1.5         0.2     setosa   25
## 122          5.4         3.4          1.5         0.4     setosa   25
## 123          5.2         4.1          1.5         0.1     setosa   25
## 124          4.9         3.1          1.5         0.2     setosa   25
## 125          5.1         3.4          1.5         0.2     setosa   25
## 126          5.3         3.7          1.5         0.2     setosa   25
## 127          5.1         3.5          1.4         0.2     setosa   12
## 128          4.9         3.0          1.4         0.2     setosa   12
## 129          5.0         3.6          1.4         0.2     setosa   12
## 130          4.6         3.4          1.4         0.3     setosa   12
## 131          4.4         2.9          1.4         0.2     setosa   12
## 132          4.8         3.0          1.4         0.1     setosa   12
## 133          5.1         3.5          1.4         0.3     setosa   12
## 134          5.2         3.4          1.4         0.2     setosa   12
## 135          5.5         4.2          1.4         0.2     setosa   12
## 136          4.9         3.6          1.4         0.1     setosa   12
## 137          4.8         3.0          1.4         0.3     setosa   12
## 138          4.6         3.2          1.4         0.2     setosa   12
## 139          5.0         3.3          1.4         0.2     setosa   12
## 140          4.7         3.2          1.3         0.2     setosa    5
## 141          5.4         3.9          1.3         0.4     setosa    5
## 142          5.5         3.5          1.3         0.2     setosa    5
## 143          4.4         3.0          1.3         0.2     setosa    5
## 144          5.0         3.5          1.3         0.3     setosa    5
## 145          4.5         2.3          1.3         0.3     setosa    5
## 146          4.4         3.2          1.3         0.2     setosa    5
## 147          5.8         4.0          1.2         0.2     setosa    3
## 148          5.0         3.2          1.2         0.2     setosa    3
## 149          4.3         3.0          1.1         0.1     setosa    2
## 150          4.6         3.6          1.0         0.2     setosa    1
```



```r
?summarize_all
means_sd_species <- iris_data %>%
  group_by(Species) %>%
  summarize_all(list(Mean=mean, Std_dev = sd))
means_sd_species
```

```
## # A tibble: 3 × 9
##   Species    Sepal.Length_Me… Sepal.Width_Mean Petal.Length_Me… Petal.Width_Mean
##   <fct>                 <dbl>            <dbl>            <dbl>            <dbl>
## 1 setosa                 5.01             3.43             1.46            0.246
## 2 versicolor             5.94             2.77             4.26            1.33 
## 3 virginica              6.59             2.97             5.55            2.03 
## # … with 4 more variables: Sepal.Length_Std_dev <dbl>,
## #   Sepal.Width_Std_dev <dbl>, Petal.Length_Std_dev <dbl>,
## #   Petal.Width_Std_dev <dbl>
```

Novel Questions
Q1: How has the housing market changed in the past 30 years?
Q2: Is youth football decresing in participation?
Q3: Which U.S. state would be ideal to HQ a business?

Feedback from 5-10 people
My first two questions recived positive feedback. Whether it was becuase of sole intrerest or applicable use, it was commonly said that I should pursue those first two questions. Feedback said that my first question was pretty broad in regards to application for that question. I know i personally wouldn't be starting a business anytime soon.

Professional Feedback
My first question would be very intsresting to pursue being that I will eventually be in the market to buy a house. It is good to educated myself on a topic that is considered one of the bigger life decisions. 
