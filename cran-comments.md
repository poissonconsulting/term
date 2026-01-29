term 0.3.6.9900

## Cran Repository Policy

- [x] Reviewed CRP last edited 2024-08-27.

Fixed failed test on R devel v 4.6

     Expected `summary(term("a[1]"))` to be identical to `summary("a[1]")`.
     Differences:
     `actual`:   "1" "1" "0" "1" "1"
     `expected`: "1" "1" "0" "4" "4"