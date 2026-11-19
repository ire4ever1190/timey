# Package

version       = "0.1.0"
author        = "ire4ever1190"
description   = "It runs a command on a cron schedule, not much else to it"
license       = "MIT"
srcDir        = "src"
bin           = @["timey"]


# Dependencies

requires "nim >= 2.2.12"
requires "gh:ire4ever1190/taskman >= 0.7.1"
