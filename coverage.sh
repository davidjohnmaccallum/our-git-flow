# Opens the test coverage report for an SBT project

# Stop on error
set -e

sbt clean coverage test
sbt coverageReport
rm -rf /tmp/scoverage-report
mv core/target/scala-2.12/scoverage-report /tmp
open /tmp/scoverage-report/index.html
sbt clean
