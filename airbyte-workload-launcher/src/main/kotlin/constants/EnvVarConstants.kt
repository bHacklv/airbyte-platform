/*
 * Copyright (c) 2020-2025 Airbyte, Inc., all rights reserved.
 */

package io.airbyte.workload.launcher.constants

/**
 * Env var names and other string constants used to set env vars for the containers we launch.
 *
 * Over time, we should try to collect the env vars here. Moving this to a shared library is also likely.
 */
object EnvVarConstants {
  const val DD_AGENT_HOST_ENV_VAR = "DD_AGENT_HOST"
  const val DD_DOGSTATSD_PORT_ENV_VAR = "DD_DOGSTATSD_PORT"
  const val DD_ENV_ENV_VAR = "DD_ENV"
  const val DD_SERVICE_ENV_VAR = "DD_SERVICE"
  const val DD_VERSION_ENV_VAR = "DD_VERSION"
  const val JAVA_OPTS_ENV_VAR = "JAVA_OPTS"
  const val CONTROL_PLANE_AUTH_ENDPOINT_ENV_VAR = "CONTROL_PLANE_AUTH_ENDPOINT"
  const val DATA_PLANE_SERVICE_ACCOUNT_CREDENTIALS_PATH_ENV_VAR = "DATA_PLANE_SERVICE_ACCOUNT_CREDENTIALS_PATH"
  const val DATA_PLANE_SERVICE_ACCOUNT_EMAIL_ENV_VAR = "DATA_PLANE_SERVICE_ACCOUNT_EMAIL"
  const val AIRBYTE_API_AUTH_HEADER_NAME_ENV_VAR = "AIRBYTE_API_AUTH_HEADER_NAME"
  const val AIRBYTE_API_AUTH_HEADER_VALUE_ENV_VAR = "AIRBYTE_API_AUTH_HEADER_VALUE"
  const val KEYCLOAK_CLIENT_ID_ENV_VAR = "KEYCLOAK_CLIENT_ID"
  const val KEYCLOAK_INTERNAL_REALM_ISSUER_ENV_VAR = "KEYCLOAK_INTERNAL_REALM_ISSUER"
  const val INTERNAL_API_HOST_ENV_VAR = "INTERNAL_API_HOST"
  const val ACCEPTANCE_TEST_ENABLED_VAR = "ACCEPTANCE_TEST_ENABLED"
  const val DD_INTEGRATION_ENV_VAR_FORMAT = "DD_INTEGRATION_%s_ENABLED"
  const val WORKLOAD_API_HOST_ENV_VAR = "WORKLOAD_API_HOST"
  const val WORKLOAD_API_CONNECT_TIMEOUT_SECONDS_ENV_VAR = "WORKLOAD_API_CONNECT_TIMEOUT_SECONDS"
  const val WORKLOAD_API_READ_TIMEOUT_SECONDS_ENV_VAR = "WORKLOAD_API_READ_TIMEOUT_SECONDS"
  const val WORKLOAD_API_RETRY_DELAY_SECONDS_ENV_VAR = "WORKLOAD_API_RETRY_DELAY_SECONDS"
  const val WORKLOAD_API_MAX_RETRIES_ENV_VAR = "WORKLOAD_API_MAX_RETRIES"
  const val SECRET_PERSISTENCE = "SECRET_PERSISTENCE"
  const val SECRET_STORE_GCP_PROJECT_ID = "SECRET_STORE_GCP_PROJECT_ID"
  const val AWS_SECRET_MANAGER_REGION = "AWS_SECRET_MANAGER_REGION"
  const val AWS_KMS_KEY_ARN = "AWS_KMS_KEY_ARN"
  const val AWS_SECRET_MANAGER_SECRET_TAGS = "AWS_SECRET_MANAGER_SECRET_TAGS"
  const val AZURE_KEY_VAULT_VAULT_URL = "AB_AZURE_KEY_VAULT_VAULT_URL"
  const val AZURE_KEY_VAULT_TENANT_ID = "AB_AZURE_KEY_VAULT_TENANT_ID"
  const val AZURE_KEY_VAULT_SECRET_TAGS = "AB_AZURE_KEY_VAULT_TAGS"
  const val VAULT_ADDRESS = "VAULT_ADDRESS"
  const val VAULT_PREFIX = "VAULT_PREFIX"
  const val CONCURRENT_SOURCE_STREAM_READ_ENV_VAR = "CONCURRENT_SOURCE_STREAM_READ"
  const val USE_STREAM_CAPABLE_STATE_ENV_VAR = "USE_STREAM_CAPABLE_STATE"
  const val AIRBYTE_EDITION_ENV_VAR = "AIRBYTE_EDITION"
  const val AIRBYTE_VERSION_ENV_VAR = "AIRBYTE_VERSION"
  const val AIRBYTE_ROLE_ENV_VAR = "AIRBYTE_ROLE"
  const val DEPLOYMENT_MODE_ENV_VAR = "DEPLOYMENT_MODE"
  const val AIRBYTE_STAGING_DIRECTORY = "AIRBYTE_STAGING_DIRECTORY"
  const val CONNECTOR_STORAGE_LIMIT_BYTES = "CONNECTOR_STORAGE_LIMIT_BYTES"
  const val USE_FILE_TRANSFER = "USE_FILE_TRANSFER"
  const val USE_RUNTIME_SECRET_PERSISTENCE = "USE_RUNTIME_SECRET_PERSISTENCE"

  // Metrics
  const val MICROMETER_ENV_VAR_PREFIX = "MICROMETER_"
  const val OTEL_COLLECTOR_ENDPOINT = "OTEL_COLLECTOR_ENDPOINT"
  const val STATSD_ENV_VAR_PREFIX = "STATSD_"

  // secrets
  const val AWS_ASSUME_ROLE_ACCESS_KEY_ID_ENV_VAR = "AWS_ASSUME_ROLE_ACCESS_KEY_ID"
  const val AWS_ASSUME_ROLE_SECRET_ACCESS_KEY_ENV_VAR = "AWS_ASSUME_ROLE_SECRET_ACCESS_KEY"
  const val WORKLOAD_API_BEARER_TOKEN_ENV_VAR = "WORKLOAD_API_BEARER_TOKEN"
  const val KEYCLOAK_CLIENT_SECRET_ENV_VAR = "KEYCLOAK_CLIENT_SECRET"
  const val SECRET_STORE_GCP_CREDENTIALS = "SECRET_STORE_GCP_CREDENTIALS"
  const val AWS_SECRET_MANAGER_ACCESS_KEY_ID = "AWS_SECRET_MANAGER_ACCESS_KEY_ID"
  const val AWS_SECRET_MANAGER_SECRET_ACCESS_KEY = "AWS_SECRET_MANAGER_SECRET_ACCESS_KEY"
  const val AZURE_KEY_VAULT_CLIENT_ID = "AB_AZURE_KEY_VAULT_CLIENT_ID"
  const val AZURE_KEY_VAULT_CLIENT_SECRET = "AB_AZURE_KEY_VAULT_CLIENT_SECRET"
  const val VAULT_AUTH_TOKEN = "VAULT_AUTH_TOKEN"
}
