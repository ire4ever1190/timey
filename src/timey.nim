import std/[os, strutils, osproc]
import pkg/taskman

# Chud level command parsing

let params = commandLineParams()

if params.len < 2:
  stderr.writeLine("usage: timey <cron string> <command...>")
  quit(QuitFailure)

let
  cron = params[0].parseCron()
  cmd = params[1]
  args = params[2 .. ^1]

# Set up the stuff

let tasks = newScheduler()

tasks.every(cron) do ():
  let process = startProcess(cmd, args = args, options = {poStdErrToStdOut, poUsePath, poParentStreams})
  defer: process.close()
  discard process.waitForExit()

tasks.start()
