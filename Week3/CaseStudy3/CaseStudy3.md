---
title: "CaseStudy3"
author: "Cole Hon"
date: "9/12/2022"
output: 
  html_document:
    theme: cosmo
    keep_md: TRUE
editor_options: 
  chunk_output_type: console
---


```r
library(gapminder)
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
library(dplyr)
library(ggplot2)
library(downloader)
library(knitr)

str(gapminder)
```

```
## tibble [1,704 × 6] (S3: tbl_df/tbl/data.frame)
##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ year     : int [1:1704] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
##  $ lifeExp  : num [1:1704] 28.8 30.3 32 34 36.1 ...
##  $ pop      : int [1:1704] 8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
##  $ gdpPercap: num [1:1704] 779 821 853 836 740 ...
```




```r
gminder <- gapminder %>%
  filter(country != "Kuwait")
view(gminder)
```



```r
plot1 <- ggplot(data = gminder) +
  scale_y_continuous(trans = "sqrt") +
  geom_point(mapping = aes(size = pop/100000, x = lifeExp, y = gdpPercap, color = continent)) +
  facet_wrap(~ year, nrow = 1) +
  scale_size_continuous(name = "Population (100k)") +
  theme_bw() 
plot1
```

![](CaseStudy3_files/figure-html/Plot 1-1.png)<!-- -->




```r
weighted_gdpPercap <-  gminder %>%
  group_by(year, continent) %>%
  summarise(gdpPercap_weighted = weighted.mean(gdpPercap),
            Population=pop/10000)
```

```
## `summarise()` has grouped output by 'year', 'continent'. You can override using
## the `.groups` argument.
```





```r
plot2 <- ggplot(data = gminder) +
  geom_point(mapping = aes(x = year, y = gdpPercap, color = continent)) +
  geom_line(mapping = aes(x = year, y = gdpPercap, color = continent, group = country )) +
  geom_point(data=weighted_gdpPercap, mapping = aes(x = year, y = gdpPercap_weighted, size = Population)) +
  geom_line(data=weighted_gdpPercap, mapping = aes(x = year, y = gdpPercap_weighted)) +
  facet_wrap(~ continent, nrow = 1) +
  xlab("Year") + ylab("GDP Per Capita") +
  theme_bw() 
plot2
```

![](CaseStudy3_files/figure-html/Plot 2-1.png)<!-- -->

