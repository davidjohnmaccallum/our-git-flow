# Cleans up a feature branch once the PR has been merged.

# Stop on error
set -e

if [ -z $LOG_AUTO_DIR ]; then 
    echo "\$LOG_AUTO_DIR not set"; 
    exit 2;
fi

if [ ! -d "${LOG_AUTO_DIR}/venv" ]; then 
    echo "\$LOG_AUTO_DIR/venv missing"; 
    exit 2;
fi


cd $LOG_AUTO_DIR
source ./venv/bin/activate
. ./APIAutomation/EnvironmentVariableSetup.sh 
cd ./APIAutomation/LogisticsAutomation/Tests/Tracking 
pytest --html=Report.html 
open ./Report.html
