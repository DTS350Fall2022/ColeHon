---
title: "Case Study 12"
author: "Cole Hon"
date: "11/21/2022"
output:
  html_document:
    keep_md: TRUE
---






```r
library(ggplot2)
library(readr)
library(knitr)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(forcats)
library(downloader)
library(corrplot)
```

```
## corrplot 0.92 loaded
```

```r
library(tidyquant)
```

```
## Loading required package: lubridate
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:base':
## 
##     date, intersect, setdiff, union
```

```
## Loading required package: PerformanceAnalytics
```

```
## Loading required package: xts
```

```
## Loading required package: zoo
```

```
## 
## Attaching package: 'zoo'
```

```
## The following objects are masked from 'package:base':
## 
##     as.Date, as.Date.numeric
```

```
## 
## Attaching package: 'xts'
```

```
## The following objects are masked from 'package:dplyr':
## 
##     first, last
```

```
## 
## Attaching package: 'PerformanceAnalytics'
```

```
## The following object is masked from 'package:graphics':
## 
##     legend
```

```
## Loading required package: quantmod
```

```
## Loading required package: TTR
```

```
## Registered S3 method overwritten by 'quantmod':
##   method            from
##   as.zoo.data.frame zoo
```

```r
library(timetk)
library(dygraphs)
library(scales)
```

```
## 
## Attaching package: 'scales'
```

```
## The following object is masked from 'package:readr':
## 
##     col_factor
```

```r
library(tidyverse)
```

```
## ── Attaching packages
## ───────────────────────────────────────
## tidyverse 1.3.2 ──
```

```
## ✔ tibble  3.1.8     ✔ purrr   0.3.4
## ✔ tidyr   1.2.0     ✔ stringr 1.4.1
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ lubridate::as.difftime() masks base::as.difftime()
## ✖ scales::col_factor()     masks readr::col_factor()
## ✖ lubridate::date()        masks base::date()
## ✖ purrr::discard()         masks scales::discard()
## ✖ dplyr::filter()          masks stats::filter()
## ✖ xts::first()             masks dplyr::first()
## ✖ lubridate::intersect()   masks base::intersect()
## ✖ dplyr::lag()             masks stats::lag()
## ✖ xts::last()              masks dplyr::last()
## ✖ lubridate::setdiff()     masks base::setdiff()
## ✖ lubridate::union()       masks base::union()
```

```r
library(USAboundaries)
library(maps)
```

```
## 
## Attaching package: 'maps'
## 
## The following object is masked from 'package:purrr':
## 
##     map
```

```r
library(ggsflabel)
```

```
## 
## Attaching package: 'ggsflabel'
## 
## The following objects are masked from 'package:ggplot2':
## 
##     geom_sf_label, geom_sf_text, StatSfCoordinates
```

```r
library(devtools)
```

```
## Loading required package: usethis
## 
## Attaching package: 'devtools'
## 
## The following object is masked from 'package:downloader':
## 
##     source_url
```

```r
library(remotes)
```

```
## 
## Attaching package: 'remotes'
## 
## The following objects are masked from 'package:devtools':
## 
##     dev_package_deps, install_bioc, install_bitbucket, install_cran,
##     install_deps, install_dev, install_git, install_github,
##     install_gitlab, install_local, install_svn, install_url,
##     install_version, update_packages
## 
## The following object is masked from 'package:usethis':
## 
##     git_credentials
```

```r
library(stringr)
library(leaflet)
```

```
## 
## Attaching package: 'leaflet'
## 
## The following object is masked from 'package:xts':
## 
##     addLegend
```

```r
library(mapview)
library(riem)
library(stringi)
library(stringr)
library(gifski)
library(gganimate)
library(gridExtra)
```

```
## 
## Attaching package: 'gridExtra'
## 
## The following object is masked from 'package:dplyr':
## 
##     combine
```

```r
library(viridis)
```

```
## Loading required package: viridisLite
## 
## Attaching package: 'viridis'
## 
## The following object is masked from 'package:maps':
## 
##     unemp
## 
## The following object is masked from 'package:scales':
## 
##     viridis_pal
```

```r
library(lubridate)
```

###Download Data

```r
avocado <- read.csv("avocado.csv")

head(avocado)
```

```
##   X       Date AveragePrice Total.Volume   X4046     X4225  X4770 Total.Bags
## 1 0 2015-12-27         1.33     64236.62 1036.74  54454.85  48.16    8696.87
## 2 1 2015-12-20         1.35     54876.98  674.28  44638.81  58.33    9505.56
## 3 2 2015-12-13         0.93    118220.22  794.70 109149.67 130.50    8145.35
## 4 3 2015-12-06         1.08     78992.15 1132.00  71976.41  72.58    5811.16
## 5 4 2015-11-29         1.28     51039.60  941.48  43838.39  75.78    6183.95
## 6 5 2015-11-22         1.26     55979.78 1184.27  48067.99  43.61    6683.91
##   Small.Bags Large.Bags XLarge.Bags         type year region
## 1    8603.62      93.25           0 conventional 2015 Albany
## 2    9408.07      97.49           0 conventional 2015 Albany
## 3    8042.21     103.14           0 conventional 2015 Albany
## 4    5677.40     133.76           0 conventional 2015 Albany
## 5    5986.26     197.69           0 conventional 2015 Albany
## 6    6556.47     127.44           0 conventional 2015 Albany
```

```r
avocado$Date <- as.Date(avocado$Date)
```

###Filtering Data

```r
a_cities <- avocado %>%
  filter(! region %in% c("California", "GreatLakes", "MidSouth", "Northeast", "NorthernNewEngland", "Plains", "SouthCentral", "Southeast", "TotalUS", "West", "WestTexNewMexico"))
head(a_cities)
```

```
##   X       Date AveragePrice Total.Volume   X4046     X4225  X4770 Total.Bags
## 1 0 2015-12-27         1.33     64236.62 1036.74  54454.85  48.16    8696.87
## 2 1 2015-12-20         1.35     54876.98  674.28  44638.81  58.33    9505.56
## 3 2 2015-12-13         0.93    118220.22  794.70 109149.67 130.50    8145.35
## 4 3 2015-12-06         1.08     78992.15 1132.00  71976.41  72.58    5811.16
## 5 4 2015-11-29         1.28     51039.60  941.48  43838.39  75.78    6183.95
## 6 5 2015-11-22         1.26     55979.78 1184.27  48067.99  43.61    6683.91
##   Small.Bags Large.Bags XLarge.Bags         type year region
## 1    8603.62      93.25           0 conventional 2015 Albany
## 2    9408.07      97.49           0 conventional 2015 Albany
## 3    8042.21     103.14           0 conventional 2015 Albany
## 4    5677.40     133.76           0 conventional 2015 Albany
## 5    5986.26     197.69           0 conventional 2015 Albany
## 6    6556.47     127.44           0 conventional 2015 Albany
```

```r
a_state <- avocado %>%
  filter(region %in% c("California"))
head(a_state)
```

```
##   X       Date AveragePrice Total.Volume   X4046   X4225    X4770 Total.Bags
## 1 0 2015-12-27         0.90      5040365 1833947 1760956 232755.9    1212707
## 2 1 2015-12-20         0.94      4695737 1676601 1543281 266689.8    1209165
## 3 2 2015-12-13         0.87      5259354 1806690 1627241 232985.1    1592438
## 4 3 2015-12-06         0.78      5775536 1943066 2100246 221957.3    1510267
## 5 4 2015-11-29         0.91      4575711 1461699 1810203 222311.1    1081497
## 6 5 2015-11-22         0.92      4804278 1602216 1917125 215632.2    1069306
##   Small.Bags Large.Bags XLarge.Bags         type year     region
## 1  1090140.1  110737.35    11829.59 conventional 2015 California
## 2  1061703.6  136747.10    10714.52 conventional 2015 California
## 3  1404012.0  180150.37     8275.96 conventional 2015 California
## 4  1376640.9  126664.37     6962.06 conventional 2015 California
## 5   991568.8   82338.39     7590.24 conventional 2015 California
## 6   979612.5   82444.32     7249.07 conventional 2015 California
```

```r
a_regions <- avocado %>%
  filter(region %in% c("GreatLakes", "MidSouth", "Northeast", "NorthernNewEngland", "Plains", "SouthCentral", "Southeast", "West", "WestTexNewMexico"))
head(a_regions)
```

```
##   X       Date AveragePrice Total.Volume    X4046   X4225    X4770 Total.Bags
## 1 0 2015-12-27         1.01      2580603 336673.7 1411809 254629.9   577490.5
## 2 1 2015-12-20         1.01      2504745 383701.8 1337404 241580.6   542059.1
## 3 2 2015-12-13         1.03      2608448 463349.7 1342450 228576.5   574072.0
## 4 3 2015-12-06         1.00      2981347 401676.1 1680591 398320.6   500759.0
## 5 4 2015-11-29         1.07      2198409 318661.4 1199426 248818.7   431502.7
## 6 5 2015-11-22         1.03      2601822 347803.3 1471865 280544.0   501609.2
##   Small.Bags Large.Bags XLarge.Bags         type year     region
## 1   400003.8   98401.09    79085.61 conventional 2015 GreatLakes
## 2   358218.7  122999.48    60840.92 conventional 2015 GreatLakes
## 3   409909.7  148004.93    16157.38 conventional 2015 GreatLakes
## 4   325850.0  124306.44    50602.55 conventional 2015 GreatLakes
## 5   328369.5   83149.01    19984.20 conventional 2015 GreatLakes
## 6   391454.6   89472.08    20682.52 conventional 2015 GreatLakes
```

```r
a_US <- avocado %>%
  filter(region == "TotalUS")
head(a_US)
```

```
##   X       Date AveragePrice Total.Volume   X4046    X4225     X4770 Total.Bags
## 1 0 2015-12-27         0.95     27297984 9626901 10197890 1184340.1    6288852
## 2 1 2015-12-20         0.98     25083647 8710022  9329862 1201020.0    5842744
## 3 2 2015-12-13         0.93     28041335 9855054 10805839 1016163.2    6364280
## 4 3 2015-12-06         0.89     28800397 9405464 12160839  931830.6    6302263
## 5 4 2015-11-29         0.99     22617999 8094804  9003178  731008.4    4789009
## 6 5 2015-11-22         0.96     25114228 8571850 10389880  804662.8    5347836
##   Small.Bags Large.Bags XLarge.Bags         type year  region
## 1    4850404  1252626.3   185822.04 conventional 2015 TotalUS
## 2    4618390  1025048.8   199305.12 conventional 2015 TotalUS
## 3    4964462  1371440.3    28377.23 conventional 2015 TotalUS
## 4    5005077  1233956.2    63229.39 conventional 2015 TotalUS
## 5    3901953   856560.3    30495.62 conventional 2015 TotalUS
## 6    4178583  1137229.8    32022.60 conventional 2015 TotalUS
```


###Creating Visualizations for U.S. overtime & Regions

```r
###
us_plot <- ggplot(data = a_US, mapping = aes(x =Date, y =AveragePrice, color =year)) +
  geom_line() + 
  labs(title = "Average Avocado Prices from 2015 to 2018", subtitle = "Data Based off of the Total U.S.", x = "Date", y = "Average Price") 
us_plot
```

![](CaseStudy12_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
us_plot + transition_reveal(Date)
```

```
## geom_path: Each group consists of only one observation. Do you need to adjust
## the group aesthetic?
## geom_path: Each group consists of only one observation. Do you need to adjust
## the group aesthetic?
```

```r
p_region_plot <- ggplot(data = a_regions, mapping = aes(x = AveragePrice, y = Total.Volume, color = Total.Volume)) +
  geom_point() + 
  labs(title = "Average Avocado Prices from 2015 to 2018 in regards to volume", subtitle = " Data dased off of Regions", x = "Average Price", y = "Total Volume") + transition_time(Date)
p_region_plot
```

![](CaseStudy12_files/figure-html/unnamed-chunk-4-1.gif)<!-- -->
Overtime, the prices of avocados fluctuate. The reason behind this could posisbly be simple supply and demand economics. As we see from the price and volume plot, the lower the volume, the higher the prices are. 



```r
pcity_plot <- ggplot(data = a_cities, mapping = aes(x = Date, y = AveragePrice, color = Total.Volume)) +
  geom_line() +
  facet_wrap(~region) +
  labs(title = "Average Avocado Prices", subtitle = "Each US City", x = "Date", y = "Average Price")+
  scale_color_viridis(discrete = FALSE) + scale_y_continuous(labels = comma) 
pcity_plot 
```

![](CaseStudy12_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
 Overall, coastal cities seem to experience higher avocado prices. I would stay away from the coastal cities if you want to avoid high avocado prices.

###Option 3: Analyze Stock Prices 

```r
a_stock <- tq_get(c("CVGW", "AVO"), get = "stock.prices", from = today()-years(2), to = today())
head(a_stock)
```

```
## # A tibble: 6 × 8
##   symbol date        open  high   low close volume adjusted
##   <chr>  <date>     <dbl> <dbl> <dbl> <dbl>  <dbl>    <dbl>
## 1 CVGW   2020-11-30  72.6  72.6  71.4  71.6  65500     69.1
## 2 CVGW   2020-12-01  72.2  72.5  70.7  71.7  82700     69.1
## 3 CVGW   2020-12-02  71.9  72.5  70.3  70.8  51500     68.3
## 4 CVGW   2020-12-03  70.6  72.3  70.6  71.2  57200     68.7
## 5 CVGW   2020-12-04  72.0  72.2  70.9  71.4  39700     68.9
## 6 CVGW   2020-12-07  71.3  72.3  70.6  71.4  52600     68.9
```


```r
stockplot <- a_stock %>%
  ggplot(aes(x = date, y = close, color = symbol)) +
  geom_line() +
  labs(title = "Stock Prices of different Growers", y = "close price", x = "") +
  theme_tq()
stockplot
```

![](CaseStudy12_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

Stock Prices have between the two growers follow the same trends for the most part. There are a few places where AVO doesn't mirror CVF, but for the most part they are the same. Overall, the market for these growers are down this year by what looks to be a considerable amount. 





