---
title: "Case Study 2"
author: "Cole Hon"
date: "9/5/2022"
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
urlfile="https://github.com/WJC-Data-Science/DTS350/raw/master/coral.csv"
mydata <- read_csv(url(urlfile))
```

```
## Rows: 370 Columns: 5
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (3): Entity, Code, Event
## dbl (2): Year, Value
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
tail(mydata)
```

```
## # A tibble: 6 × 5
##   Entity Code      Year Event                                      Value
##   <chr>  <chr>    <dbl> <chr>                                      <dbl>
## 1 World  OWID_WRL  2014 Moderate bleaching events (1-30% bleached)     9
## 2 World  OWID_WRL  2014 Severe bleaching events (>30% bleached)        5
## 3 World  OWID_WRL  2015 Moderate bleaching events (1-30% bleached)    14
## 4 World  OWID_WRL  2015 Severe bleaching events (>30% bleached)       16
## 5 World  OWID_WRL  2016 Moderate bleaching events (1-30% bleached)    11
## 6 World  OWID_WRL  2016 Severe bleaching events (>30% bleached)       43
```

```r
head(mydata)
```

```
## # A tibble: 6 × 5
##   Entity      Code   Year Event                                      Value
##   <chr>       <chr> <dbl> <chr>                                      <dbl>
## 1 Australasia <NA>   1980 Moderate bleaching events (1-30% bleached)     3
## 2 Australasia <NA>   1980 Severe bleaching events (>30% bleached)        0
## 3 Australasia <NA>   1981 Moderate bleaching events (1-30% bleached)     1
## 4 Australasia <NA>   1981 Severe bleaching events (>30% bleached)        0
## 5 Australasia <NA>   1982 Moderate bleaching events (1-30% bleached)     0
## 6 Australasia <NA>   1982 Severe bleaching events (>30% bleached)        0
```
 

 

```r
ggplot(mydata, aes(fill = Event, y= Value, x= Year)) + 
  geom_bar(position="stack", stat="identity") +
  facet_wrap( ~ Entity, nrow = 2, scales = "free")
```

![](Case-Study-2_files/figure-html/Replicating the Data-1.png)<!-- -->
 
 As an overall trend, it can be said that coral bleaching is increasing although there are obvious spikes and dips throughout the years.
 
 

```r
ggplot(mydata, aes(fill = Event, y= Value, x= Year)) + 
  geom_smooth(mapping = aes(y = Value, x = Year)) +
  facet_wrap( ~ Entity, nrow = 2, scales = "free")
```

```
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](Case-Study-2_files/figure-html/Creating my own data visulaization-1.png)<!-- -->
 
 This visualization gives an idea of how moderate and severe bleaching events differ from eachother throughout the years by said location
 
 
 
