#!/bin/tcsh

# Kill Python HTTP server on port 8002
set pid_python = `lsof -ti tcp:8002`
if ("$pid_python" != "") then
    echo "Killing Python HTTP server (PID: $pid_python)"
    kill $pid_python
else
    echo "No Python HTTP server found on port 8002"
endif

# Kill MkDocs server on port 8000
set pid_mkdocs = `lsof -ti tcp:8000`
if ("$pid_mkdocs" != "") then
    echo "Killing MkDocs server (PID: $pid_mkdocs)"
    kill $pid_mkdocs
else
    echo "No MkDocs server found on port 8000"
endif