---
title: "CaseStudy 11"
author: "Cole Hon"
date: "11/15/2022"
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
```


### Import Data

```r
permit_data <- tempfile()
download("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/permits.csv", permit_data, mode = "wb")
PA_permits <- read_csv(permit_data)
```

```
## New names:
## Rows: 327422 Columns: 8
## ── Column specification
## ──────────────────────────────────────────────────────── Delimiter: "," chr
## (3): StateAbbr, countyname, variable dbl (5): ...1, state, county, year, value
## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
## Specify the column types or set `show_col_types = FALSE` to quiet this message.
## • `` -> `...1`
```

```r
penn <- read.csv('latlong.csv')
head(penn)
```

```
##   County.Name County.Code.Number County.Code.text Longitude Latitude
## 1       Adams                  1                1 -77.22224 39.87210
## 2   Allegheny                  2                2 -79.98620 40.46736
## 3   Armstrong                  3                3 -79.47317 40.81510
## 4      Beaver                  4                4 -80.35107 40.68349
## 5     Bedford                  5                5 -78.49116 40.00738
## 6       Berks                  6                6 -75.93077 40.41940
##   Georeferenced.Latitude...Longitude
## 1   POINT (-77.22224271 39.87209565)
## 2   POINT (-79.98619843 40.46735543)
## 3   POINT (-79.47316899 40.81509526)
## 4   POINT (-80.35107356 40.68349245)
## 5   POINT (-78.49116474 40.00737536)
## 6   POINT (-75.93077327 40.41939635)
```

### Clean Data

```r
PApermits <- PA_permits %>%
  filter(StateAbbr == "PA", year==2010)

permits <- PApermits %>%
  mutate(county = as.character(county))

head(permits)
```

```
## # A tibble: 6 × 8
##     ...1 state StateAbbr county countyname       variable             year value
##    <dbl> <dbl> <chr>     <chr>  <chr>            <chr>               <dbl> <dbl>
## 1 235713    42 PA        1      Adams County     All Permits          2010   306
## 2 235744    42 PA        1      Adams County     Single Family        2010   284
## 3 235775    42 PA        1      Adams County     All Multifamily      2010    22
## 4 235833    42 PA        1      Adams County     5+-Unit Multifamily  2010    22
## 5 235844    42 PA        3      Allegheny County All Permits          2010  1424
## 6 235875    42 PA        3      Allegheny County Single Family        2010  1407
```

```r
pa <- penn %>%
  mutate(county = as.character(County.Code.Number))
```



```r
combined <- left_join(pa,permits, by='county') %>%
  drop_na()
head(combined)
```

```
##   County.Name County.Code.Number County.Code.text Longitude Latitude
## 1       Adams                  1                1 -77.22224  39.8721
## 2       Adams                  1                1 -77.22224  39.8721
## 3       Adams                  1                1 -77.22224  39.8721
## 4       Adams                  1                1 -77.22224  39.8721
## 5   Armstrong                  3                3 -79.47317  40.8151
## 6   Armstrong                  3                3 -79.47317  40.8151
##   Georeferenced.Latitude...Longitude county   ...1 state StateAbbr
## 1   POINT (-77.22224271 39.87209565)      1 235713    42        PA
## 2   POINT (-77.22224271 39.87209565)      1 235744    42        PA
## 3   POINT (-77.22224271 39.87209565)      1 235775    42        PA
## 4   POINT (-77.22224271 39.87209565)      1 235833    42        PA
## 5   POINT (-79.47316899 40.81509526)      3 235844    42        PA
## 6   POINT (-79.47316899 40.81509526)      3 235875    42        PA
##         countyname            variable year value
## 1     Adams County         All Permits 2010   306
## 2     Adams County       Single Family 2010   284
## 3     Adams County     All Multifamily 2010    22
## 4     Adams County 5+-Unit Multifamily 2010    22
## 5 Allegheny County         All Permits 2010  1424
## 6 Allegheny County       Single Family 2010  1407
```


```r
data1 <- combined %>%
  arrange(desc(value))
```



```r
data1$quartile <- ntile(data1$value,4)
data1$quartile
```

```
##   [1] 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3
##  [38] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2
##  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
## [112] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
```


```r
topcounty <- data1 %>%
  filter(row_number() == 1)
```



```r
ntile4 <- data1 %>%
  filter(quartile == 4)
ntile3 <- data1 %>%
  filter(quartile == 3)
ntile2 <- data1 %>%
  filter(quartile == 2)
ntile1 <- data1 %>%
  filter(quartile == 1)
```



```r
leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data = ntile4,
                   radius = 7,
                   color = "blue",
                   stroke = FALSE,
                   fillOpacity = 1,
                   popup = ~county,
                   label = ~value) %>%
    addCircleMarkers(data = ntile3,
                   radius = 7,
                   color = "red",
                   stroke = FALSE,
                   fillOpacity = 1,
                   popup = ~county,
                   label = ~value)%>%
    addCircleMarkers(data = ntile2,
                   radius = 7,
                   color = "darkblue",
                   stroke = FALSE,
                   fillOpacity = 1,
                   popup = ~county,
                   label = ~value) %>%
    addCircleMarkers(data = ntile1,
                   radius = 7,
                   color = "green",
                   stroke = FALSE,
                   fillOpacity = 1,
                   popup = ~county,
                   label = ~value) %>%
    addCircleMarkers(data = topcounty,
                   radius = 7,
                   color = "royalblue1",
                   stroke = FALSE,
                   fillOpacity = 1,
                   popup = ~county,
                   label = ~value)
```

```
## Assuming "Longitude" and "Latitude" are longitude and latitude, respectively
## Assuming "Longitude" and "Latitude" are longitude and latitude, respectively
## Assuming "Longitude" and "Latitude" are longitude and latitude, respectively
## Assuming "Longitude" and "Latitude" are longitude and latitude, respectively
## Assuming "Longitude" and "Latitude" are longitude and latitude, respectively
```

```{=html}
<div id="htmlwidget-620cb635b9d106583d12" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-620cb635b9d106583d12">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org/copyright/\">OpenStreetMap<\/a>,  <a href=\"https://opendatacommons.org/licenses/odbl/\">ODbL<\/a>"}]},{"method":"addCircleMarkers","args":[[40.81509526,40.81509526,39.92487511,39.92487511,41.34459792,41.30237777,41.34459792,41.30237777,40.85150926,40.77113737,41.04912086,40.77113737,41.000429,41.04912086,41.000429,41.51357876,40.49127491,40.85150926,41.06091787,41.06091787,40.49127491,41.51357876,40.48555024,39.87209565,40.48555024,39.87209565,39.92487511,39.92487511,40.00444354,40.00444354,40.85150926,41.34459792],[-79.47316899,-79.47316899,-78.11485045,-78.11485045,-77.06942457,-80.26009411,-77.06942457,-80.26009411,-76.71188423,-77.07255968,-76.4100218,-77.07255968,-78.47558343,-76.4100218,-78.47558343,-79.23780995,-78.71894174,-76.71188423,-75.34083603,-75.34083603,-78.71894174,-79.23780995,-78.34907687,-77.22224271,-78.34907687,-77.22224271,-78.11485045,-78.11485045,-75.140236,-75.140236,-76.71188423,-77.06942457],7,null,null,{"interactive":true,"className":"","stroke":false,"color":"blue","weight":5,"opacity":0.5,"fill":true,"fillColor":"blue","fillOpacity":1},null,null,["3","3","29","29","41","43","41","43","49","55","19","55","17","19","17","27","11","49","45","45","11","27","7","1","7","1","29","29","51","51","49","41"],null,["1424","1407","1112","839","832","691","620","606","586","570","523","513","474","463","444","426","415","369","363","354","350","347","337","306","305","284","273","246","240","232","217","212"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addCircleMarkers","args":[[41.34459792,40.85150926,39.97487056,39.97487056,40.91936701,41.99413787,41.99413787,41.13139091,41.13139091,40.99325035,40.99325035,40.16759839,40.16759839,40.91936701,40.33501133,40.61464794,41.40341259,40.33501133,40.61464794,41.40341259,40.19109663,41.30237777,41.30237777,40.310315,41.51357876,41.51357876,40.19109663,40.49127491,40.49127491,40.00737536,40.00737536,41.04912086],[-77.06942457,-76.71188423,-75.75626498,-75.75626498,-75.71107039,-80.0407591,-80.0407591,-79.00101814,-79.00101814,-80.33754114,-80.33754114,-77.26866271,-77.26866271,-75.71107039,-75.11291241,-75.60099481,-79.76286561,-75.11291241,-75.60099481,-79.76286561,-80.25180083,-80.26009411,-80.26009411,-79.47134118,-79.23780995,-79.23780995,-80.25180083,-78.71894174,-78.71894174,-78.49116474,-78.49116474,-76.4100218],7,null,null,{"interactive":true,"className":"","stroke":false,"color":"red","weight":5,"opacity":0.5,"fill":true,"fillColor":"red","fillOpacity":1},null,null,["41","49","15","15","13","25","25","33","33","37","37","21","21","13","9","39","61","9","39","61","63","43","43","65","27","27","63","11","11","5","5","19"],null,["195","195","175","171","159","149","149","124","124","123","123","117","117","112","108","108","99","98","96","93","88","85","82","81","79","77","74","65","65","60","60","60"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addCircleMarkers","args":[[40.77113737,40.310315,40.91936701,40.416105,40.416105,41.77333834,41.77333834,39.92192531,39.92192531,41.04912086,41.02801824,41.02801824,40.48555024,41.43910064,41.43910064,41.000429,40.77113737,40.91936701,41.4480994,41.4480994,40.310315,40.310315,41.04912086,39.87209565,39.87209565,40.48555024,40.77113737,40.81509526,41.000429,39.92487511,40.91936701,40.81509526],[-77.07255968,-79.47134118,-75.71107039,-77.9827661,-77.9827661,-77.25788076,-77.25788076,-76.72576052,-76.72576052,-76.4100218,-76.66470527,-76.66470527,-78.34907687,-75.61218345,-75.61218345,-78.47558343,-77.07255968,-75.71107039,-76.5147922,-76.5147922,-79.47134118,-79.47134118,-76.4100218,-77.22224271,-77.22224271,-78.34907687,-77.07255968,-79.47316899,-78.47558343,-78.11485045,-75.71107039,-79.47316899],7,null,null,{"interactive":true,"className":"","stroke":false,"color":"darkblue","weight":5,"opacity":0.5,"fill":true,"fillColor":"darkblue","fillOpacity":1},null,null,["55","65","13","31","31","59","59","67","67","19","47","47","7","35","35","17","55","13","57","57","65","65","19","1","1","7","55","3","17","29","13","3"],null,["57","57","47","47","47","41","41","41","41","37","36","36","32","31","31","30","29","24","24","24","24","24","23","22","22","20","20","17","17","17","16","15"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addCircleMarkers","args":[[40.85150926,40.19109663,40.19109663,40.48555024,40.61464794,40.33501133,39.92487511,41.34459792,41.74420644,41.74420644,41.06091787,40.61464794,40.85150926,40.00444354,40.00444354,40.77113737,40.91936701,41.000429,41.34459792,41.06091787,40.33501133,41.000429,41.40341259,41.40341259,40.33501133,39.97487056,39.97487056,40.61464794,41.30237777,40.81509526,41.51357876,41.06091787],[-76.71188423,-80.25180083,-80.25180083,-78.34907687,-75.60099481,-75.11291241,-78.11485045,-77.06942457,-77.89879229,-77.89879229,-75.34083603,-75.60099481,-76.71188423,-75.140236,-75.140236,-77.07255968,-75.71107039,-78.47558343,-77.06942457,-75.34083603,-75.11291241,-78.47558343,-79.76286561,-79.76286561,-75.11291241,-75.75626498,-75.75626498,-75.60099481,-80.26009411,-79.47316899,-79.23780995,-75.34083603],7,null,null,{"interactive":true,"className":"","stroke":false,"color":"green","weight":5,"opacity":0.5,"fill":true,"fillColor":"green","fillOpacity":1},null,null,["49","63","63","7","39","9","29","41","53","53","45","39","49","51","51","55","13","17","41","45","9","17","61","61","9","15","15","39","43","3","27","45"],null,["14","14","14","12","12","10","10","10","10","10","9","8","8","8","8","8","7","7","7","7","6","6","6","6","4","4","4","4","3","2","2","2"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addCircleMarkers","args":[40.81509526,-79.47316899,7,null,null,{"interactive":true,"className":"","stroke":false,"color":"royalblue1","weight":5,"opacity":0.5,"fill":true,"fillColor":"royalblue1","fillOpacity":1},null,null,"3",null,"1424",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[39.87209565,41.99413787],"lng":[-80.33754114,-75.11291241]}},"evals":[],"jsHooks":[]}</script>
```

In this case study, I used the leaflet package to make an interactive map of pennsylvania. I selected the amount of building permits in each county, and then divided them up by using the ntile function into 4 separate groups based on the amount of permits each county holds. One group is the bottom 25th percentile, the 25-50th percentile, the 50-75th percentile, and the top 25th percintile. The percentiles the counties fall in are represented on the map by diffferent colors. I used a sepreate color for the top count, which is the one I suiggegested my friend moves to.
