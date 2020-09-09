
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidyMB

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/tidyMB)](https://CRAN.R-project.org/package=tidyMB)
<!-- badges: end -->

The goal of tidyMB is to provide opinionated table, figure, and .Rmd
templates and styles used in the Motivation and Behaviour program at
Institute for Positive Psychology and Education, Australian Catholic
University.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Motivation-and-Behaviour/tidyMB")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(magrittr)
library(gt)
library(tidyMB)
iris %>%
  head() %>%
  gt() %>%
  apa_style(title = 'Table 1', subtitle = "_Isis Database_")
```

<!--html_preserve-->

<style>html {
  font-family: times, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zhzjgcgzco .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: none;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: none;
  border-top-width: 2px;
  border-top-color: white;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zhzjgcgzco .gt_heading {
  background-color: #FFFFFF;
  text-align: left;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zhzjgcgzco .gt_title {
  color: #333333;
  font-size: 12px;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zhzjgcgzco .gt_subtitle {
  color: #333333;
  font-size: 12px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zhzjgcgzco .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: black;
}

#zhzjgcgzco .gt_col_headings {
  border-top-style: none;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: black;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zhzjgcgzco .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zhzjgcgzco .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zhzjgcgzco .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zhzjgcgzco .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zhzjgcgzco .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: black;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zhzjgcgzco .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: none;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zhzjgcgzco .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: none;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zhzjgcgzco .gt_from_md > :first-child {
  margin-top: 0;
}

#zhzjgcgzco .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zhzjgcgzco .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: none;
  border-top-width: 1px;
  border-top-color: white;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zhzjgcgzco .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#zhzjgcgzco .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zhzjgcgzco .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: none;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#zhzjgcgzco .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zhzjgcgzco .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: none;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zhzjgcgzco .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zhzjgcgzco .gt_table_body {
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: black;
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: black;
}

#zhzjgcgzco .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zhzjgcgzco .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#zhzjgcgzco .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zhzjgcgzco .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#zhzjgcgzco .gt_left {
  text-align: left;
}

#zhzjgcgzco .gt_center {
  text-align: center;
}

#zhzjgcgzco .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zhzjgcgzco .gt_font_normal {
  font-weight: normal;
}

#zhzjgcgzco .gt_font_bold {
  font-weight: bold;
}

#zhzjgcgzco .gt_font_italic {
  font-style: italic;
}

#zhzjgcgzco .gt_super {
  font-size: 65%;
}

#zhzjgcgzco .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="zhzjgcgzco" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<table class="gt_table">

<thead class="gt_header">

<tr>

<th colspan="5" class="gt_heading gt_title gt_font_normal" style>

Table 1

</th>

</tr>

<tr>

<th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>

<em>Isis Database</em>

</th>

</tr>

</thead>

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

Sepal.Length

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

Sepal.Width

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

Petal.Length

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

Petal.Width

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

Species

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

5.1

</td>

<td class="gt_row gt_right">

3.5

</td>

<td class="gt_row gt_right">

1.4

</td>

<td class="gt_row gt_right">

0.2

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

<tr>

<td class="gt_row gt_right">

4.9

</td>

<td class="gt_row gt_right">

3.0

</td>

<td class="gt_row gt_right">

1.4

</td>

<td class="gt_row gt_right">

0.2

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

<tr>

<td class="gt_row gt_right">

4.7

</td>

<td class="gt_row gt_right">

3.2

</td>

<td class="gt_row gt_right">

1.3

</td>

<td class="gt_row gt_right">

0.2

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

<tr>

<td class="gt_row gt_right">

4.6

</td>

<td class="gt_row gt_right">

3.1

</td>

<td class="gt_row gt_right">

1.5

</td>

<td class="gt_row gt_right">

0.2

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

<tr>

<td class="gt_row gt_right">

5.0

</td>

<td class="gt_row gt_right">

3.6

</td>

<td class="gt_row gt_right">

1.4

</td>

<td class="gt_row gt_right">

0.2

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

<tr>

<td class="gt_row gt_right">

5.4

</td>

<td class="gt_row gt_right">

3.9

</td>

<td class="gt_row gt_right">

1.7

</td>

<td class="gt_row gt_right">

0.4

</td>

<td class="gt_row gt_center">

setosa

</td>

</tr>

</tbody>

</table>

</div>

<!--/html_preserve-->
