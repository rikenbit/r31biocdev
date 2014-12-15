#!/usr/bin/env bats
@test "R development version binary is found in PATH" {
    #run which R
    run ls /usr/local/R-devel/bin/R
    [ "$status" -eq 0 ]
}
