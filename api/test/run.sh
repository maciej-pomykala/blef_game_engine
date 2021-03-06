# Run API tests with pytest and tavern
if [ -z "$BASE_URL" ]
then
      echo "\$BASE_URL is empty"
      return 1
else
      echo "Running API tests against $BASE_URL"
fi
TEST_DIR=$(dirname "$0")
pip install -r $TEST_DIR/requirements.txt
PYTHONPATH=$PYTHONPATH:$TEST_DIR pytest -q $TEST_DIR/tavern_tests
