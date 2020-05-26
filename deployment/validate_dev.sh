# Validation script to ensure develop deployments are deployed on port 8020
# and are exclusively major-versioned in the endpoints' URL paths (/v2/ but no /v2.4.2/)
if grep -q 'PORT=8020 Rscript --verbose run_api.R' api/run_api.R; then
  if grep -Eq '#* @get /v[0-9]+\.[0-9]+' api/endpoints.R; then
    exit 1
  else
    exit 0
  fi
else
  exit 1
fi
