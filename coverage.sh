# Opens the test coverage report for an SBT project

# Stop on error
set -e

sbt clean coverage test
sbt coverageReport
open core/target/scala-2.12/scoverage-report/index.html
sbt clean
