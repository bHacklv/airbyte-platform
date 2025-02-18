
{{/* DO NOT EDIT: This file was autogenerated. */}}

{{/*
    Keycloak Configuration
*/}}

{{/*
Renders the keycloak.url value
*/}}
{{- define "airbyte.keycloak.url" }}
    {{- ternary (printf "%s/auth" .Values.global.airbyteUrl) "" (ne .Values.global.edition "enterprise") }}
{{- end }}

{{/*
Renders the keycloak.url environment variable
*/}}
{{- define "airbyte.keycloak.url.env" }}
- name: KEYCLOAK_HOSTNAME_URL
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_HOSTNAME_URL
{{- end }}

{{/*
Renders the keycloak.service.port value
*/}}
{{- define "airbyte.keycloak.service.port" }}
    {{- .Values.keycloak.service.port | default 8180 }}
{{- end }}

{{/*
Renders the keycloak.service.port environment variable
*/}}
{{- define "airbyte.keycloak.service.port.env" }}
- name: KEYCLOAK_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_PORT
{{- end }}

{{/*
Renders the keycloak.javaOpts value
*/}}
{{- define "airbyte.keycloak.javaOpts" }}
    {{- (printf "-Djgroups.dns.query=%s-airbyte-keycloak-headless-svc" .Release.Name) }}
{{- end }}

{{/*
Renders the keycloak.javaOpts environment variable
*/}}
{{- define "airbyte.keycloak.javaOpts.env" }}
- name: JAVA_OPTS_APPEND
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: JAVA_OPTS_APPEND
{{- end }}

{{/*
Renders the set of all keycloak environment variables
*/}}
{{- define "airbyte.keycloak.envs" }}
{{- include "airbyte.keycloak.url.env" . }}
{{- include "airbyte.keycloak.service.port.env" . }}
{{- include "airbyte.keycloak.javaOpts.env" . }}
{{- end }}

{{/*
Renders the set of all keycloak config map variables
*/}}
{{- define "airbyte.keycloak.configVars" }}
KEYCLOAK_HOSTNAME_URL: {{ include "airbyte.keycloak.url" . | quote }}
KEYCLOAK_PORT: {{ include "airbyte.keycloak.service.port" . | quote }}
JAVA_OPTS_APPEND: {{ include "airbyte.keycloak.javaOpts" . | quote }}
{{- end }}

{{/*
Renders the keycloak.auth.adminRealm value
*/}}
{{- define "airbyte.keycloak.admin.client.auth.adminRealm" }}
    {{- .Values.keycloak.auth.adminRealm }}
{{- end }}

{{/*
Renders the keycloak.admin.client.auth.adminRealm environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.auth.adminRealm.env" }}
- name: KEYCLOAK_ADMIN_REALM
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_ADMIN_REALM
{{- end }}

{{/*
Renders the keycloak.auth.adminCliClientId value
*/}}
{{- define "airbyte.keycloak.admin.client.auth.adminCliClientId" }}
    {{- .Values.keycloak.auth.adminCliClientId }}
{{- end }}

{{/*
Renders the keycloak.admin.client.auth.adminCliClientId environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.auth.adminCliClientId.env" }}
- name: KEYCLOAK_ADMIN_CLI_CLIENT_ID
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_ADMIN_CLI_CLIENT_ID
{{- end }}

{{/*
Renders the keycloak.clientRealm value
*/}}
{{- define "airbyte.keycloak.admin.client.clientRealm" }}
    {{- .Values.keycloak.clientRealm | default "_airbyte-application-clients" }}
{{- end }}

{{/*
Renders the keycloak.admin.client.clientRealm environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.clientRealm.env" }}
- name: KEYCLOAK_CLIENT_REALM
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_CLIENT_REALM
{{- end }}

{{/*
Renders the keycloak.internalBasePath value
*/}}
{{- define "airbyte.keycloak.admin.client.internalBasePath" }}
    {{- .Values.keycloak.internalBasePath | default "/auth" }}
{{- end }}

{{/*
Renders the keycloak.admin.client.internalBasePath environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.internalBasePath.env" }}
- name: KEYCLOAK_INTERNAL_BASE_PATH
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_INTERNAL_BASE_PATH
{{- end }}

{{/*
Renders the keycloak.internalHost value
*/}}
{{- define "airbyte.keycloak.admin.client.internalHost" }}
    {{- ternary (printf "%s-airbyte-keycloak-svc.%s:%d" .Release.Name .Release.Namespace (int .Values.keycloak.service.port)) "localhost" (or (eq .Values.global.edition "enterprise") (eq .Values.global.edition "pro") (ne .Values.global.deploymentMode "oss")) }}
{{- end }}

{{/*
Renders the keycloak.admin.client.internalHost environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.internalHost.env" }}
- name: KEYCLOAK_INTERNAL_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_INTERNAL_HOST
{{- end }}

{{/*
Renders the keycloak.internalProtocol value
*/}}
{{- define "airbyte.keycloak.admin.client.internalProtocol" }}
    {{- .Values.keycloak.internalProtocol | default "http" }}
{{- end }}

{{/*
Renders the keycloak.admin.client.internalProtocol environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.internalProtocol.env" }}
- name: KEYCLOAK_INTERNAL_PROTOCOL
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_INTERNAL_PROTOCOL
{{- end }}

{{/*
Renders the keycloak.internalRealm value
*/}}
{{- define "airbyte.keycloak.admin.client.internalRealm" }}
    {{- .Values.keycloak.internalRealm | default "_airbyte-internal" }}
{{- end }}

{{/*
Renders the keycloak.admin.client.internalRealm environment variable
*/}}
{{- define "airbyte.keycloak.admin.client.internalRealm.env" }}
- name: KEYCLOAK_INTERNAL_REALM
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_INTERNAL_REALM
{{- end }}

{{/*
Renders the set of all keycloak.admin.client environment variables
*/}}
{{- define "airbyte.keycloak.admin.client.envs" }}
{{- include "airbyte.keycloak.admin.client.auth.adminRealm.env" . }}
{{- include "airbyte.keycloak.admin.client.auth.adminCliClientId.env" . }}
{{- include "airbyte.keycloak.admin.client.clientRealm.env" . }}
{{- include "airbyte.keycloak.admin.client.internalBasePath.env" . }}
{{- include "airbyte.keycloak.admin.client.internalHost.env" . }}
{{- include "airbyte.keycloak.admin.client.internalProtocol.env" . }}
{{- include "airbyte.keycloak.admin.client.internalRealm.env" . }}
{{- end }}

{{/*
Renders the set of all keycloak.admin.client config map variables
*/}}
{{- define "airbyte.keycloak.admin.client.configVars" }}
KEYCLOAK_ADMIN_REALM: {{ include "airbyte.keycloak.admin.client.auth.adminRealm" . | quote }}
KEYCLOAK_ADMIN_CLI_CLIENT_ID: {{ include "airbyte.keycloak.admin.client.auth.adminCliClientId" . | quote }}
KEYCLOAK_CLIENT_REALM: {{ include "airbyte.keycloak.admin.client.clientRealm" . | quote }}
KEYCLOAK_INTERNAL_BASE_PATH: {{ include "airbyte.keycloak.admin.client.internalBasePath" . | quote }}
KEYCLOAK_INTERNAL_HOST: {{ include "airbyte.keycloak.admin.client.internalHost" . | quote }}
KEYCLOAK_INTERNAL_PROTOCOL: {{ include "airbyte.keycloak.admin.client.internalProtocol" . | quote }}
KEYCLOAK_INTERNAL_REALM: {{ include "airbyte.keycloak.admin.client.internalRealm" . | quote }}
{{- end }}

{{/*
Renders the keycloak.admin.user secret name
*/}}
{{- define "airbyte.keycloak.admin.user.secretName" }}
{{- if .Values.keycloak.secretName }}
    {{- .Values.keycloak.secretName }}
{{- else }}
    {{- .Values.global.secretName | default (printf "%s-airbyte-secrets" .Release.Name) }}
{{- end }}
{{- end }}

{{/*
Renders the keycloak.auth.adminUsername value
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminUsername" }}
    {{- .Values.keycloak.auth.adminUsername }}
{{- end }}

{{/*
Renders the keycloak.admin.user.auth.adminUsername secret key
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminUsername.secretKey" }}
	{{- .Values.keycloak.auth.adminUsernameSecretKey | default "KEYCLOAK_ADMIN_USER" }}
{{- end }}

{{/*
Renders the keycloak.admin.user.auth.adminUsername environment variable
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminUsername.env" }}
- name: KEYCLOAK_ADMIN_USER
  valueFrom:
    secretKeyRef:
      name: {{ include "airbyte.keycloak.admin.user.secretName" . }}
      key: {{ include "airbyte.keycloak.admin.user.auth.adminUsername.secretKey" . }}
{{- end }}

{{/*
Renders the keycloak.auth.adminPassword value
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminPassword" }}
    {{- .Values.keycloak.auth.adminPassword }}
{{- end }}

{{/*
Renders the keycloak.admin.user.auth.adminPassword secret key
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminPassword.secretKey" }}
	{{- .Values.keycloak.auth.adminPasswordSecretKey | default "KEYCLOAK_ADMIN_PASSWORD" }}
{{- end }}

{{/*
Renders the keycloak.admin.user.auth.adminPassword environment variable
*/}}
{{- define "airbyte.keycloak.admin.user.auth.adminPassword.env" }}
- name: KEYCLOAK_ADMIN_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "airbyte.keycloak.admin.user.secretName" . }}
      key: {{ include "airbyte.keycloak.admin.user.auth.adminPassword.secretKey" . }}
{{- end }}

{{/*
Renders the set of all keycloak.admin.user environment variables
*/}}
{{- define "airbyte.keycloak.admin.user.envs" }}
{{- include "airbyte.keycloak.admin.user.auth.adminUsername.env" . }}
{{- include "airbyte.keycloak.admin.user.auth.adminPassword.env" . }}
{{- end }}

{{/*
Renders the set of all keycloak.admin.user secret variables
*/}}
{{- define "airbyte.keycloak.admin.user.secrets" }}
KEYCLOAK_ADMIN_USER: {{ include "airbyte.keycloak.admin.user.auth.adminUsername" . | quote }}
KEYCLOAK_ADMIN_PASSWORD: {{ include "airbyte.keycloak.admin.user.auth.adminPassword" . | quote }}
{{- end }}

{{/*
Renders the keycloak.realmIssuer value
*/}}
{{- define "airbyte.keycloak.client.realmIssuer" }}
    {{- ternary (printf "%s/auth/realms/%s" .Values.global.airbyteUrl (include "airbyte.keycloak.admin.client.internalRealm" .)) (printf "%s-airbyte-keycloak-svc.%s:%d/auth/realms/%s" .Release.Name .Release.Namespace (int (include "airbyte.keycloak.service.port" .)) (include "airbyte.keycloak.admin.client.internalRealm" .)) (eq (include "airbyte.common.cluster.type" .) "data-plane") }}
{{- end }}

{{/*
Renders the keycloak.client.realmIssuer environment variable
*/}}
{{- define "airbyte.keycloak.client.realmIssuer.env" }}
- name: KEYCLOAK_INTERNAL_REALM_ISSUER
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_INTERNAL_REALM_ISSUER
{{- end }}

{{/*
Renders the set of all keycloak.client environment variables
*/}}
{{- define "airbyte.keycloak.client.envs" }}
{{- include "airbyte.keycloak.client.realmIssuer.env" . }}
{{- end }}

{{/*
Renders the set of all keycloak.client config map variables
*/}}
{{- define "airbyte.keycloak.client.configVars" }}
KEYCLOAK_INTERNAL_REALM_ISSUER: {{ include "airbyte.keycloak.client.realmIssuer" . | quote }}
{{- end }}

{{/*
Renders the keycloak.database secret name
*/}}
{{- define "airbyte.keycloak.database.secretName" }}
{{- if .Values.keycloak.database.secretName }}
    {{- .Values.keycloak.database.secretName }}
{{- else }}
    {{- .Values.global.secretName | default (printf "%s-airbyte-secrets" .Release.Name) }}
{{- end }}
{{- end }}

{{/*
Renders the keycloak.database.name value
*/}}
{{- define "airbyte.keycloak.database.name" }}
    {{- .Values.keycloak.database.name | default "db-airbyte" }}
{{- end }}

{{/*
Renders the keycloak.database.name environment variable
*/}}
{{- define "airbyte.keycloak.database.name.env" }}
- name: KEYCLOAK_DATABASE_NAME
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_DATABASE_NAME
{{- end }}

{{/*
Renders the keycloak.database.host value
*/}}
{{- define "airbyte.keycloak.database.host" }}
    {{- .Values.keycloak.database.host | default (printf "airbyte-db-svc.%s.svc.cluster.local" .Release.Namespace) }}
{{- end }}

{{/*
Renders the keycloak.database.host environment variable
*/}}
{{- define "airbyte.keycloak.database.host.env" }}
- name: KEYCLOAK_DATABASE_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_DATABASE_HOST
{{- end }}

{{/*
Renders the keycloak.database.port value
*/}}
{{- define "airbyte.keycloak.database.port" }}
    {{- .Values.keycloak.database.port | default 5432 }}
{{- end }}

{{/*
Renders the keycloak.database.port environment variable
*/}}
{{- define "airbyte.keycloak.database.port.env" }}
- name: KEYCLOAK_DATABASE_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_DATABASE_PORT
{{- end }}

{{/*
Renders the keycloak.database.user value
*/}}
{{- define "airbyte.keycloak.database.user" }}
    {{- .Values.keycloak.database.user | default "airbyte" }}
{{- end }}

{{/*
Renders the keycloak.database.user secret key
*/}}
{{- define "airbyte.keycloak.database.user.secretKey" }}
	{{- .Values.keycloak.database.userSecretKey | default "KEYCLOAK_DATABASE_USERNAME" }}
{{- end }}

{{/*
Renders the keycloak.database.user environment variable
*/}}
{{- define "airbyte.keycloak.database.user.env" }}
- name: KEYCLOAK_DATABASE_USERNAME
  valueFrom:
    secretKeyRef:
      name: {{ include "airbyte.keycloak.database.secretName" . }}
      key: {{ include "airbyte.keycloak.database.user.secretKey" . }}
{{- end }}

{{/*
Renders the keycloak.database.password value
*/}}
{{- define "airbyte.keycloak.database.password" }}
    {{- .Values.keycloak.database.password | default "airbyte" }}
{{- end }}

{{/*
Renders the keycloak.database.password secret key
*/}}
{{- define "airbyte.keycloak.database.password.secretKey" }}
	{{- .Values.keycloak.database.passwordSecretKey | default "KEYCLOAK_DATABASE_PASSWORD" }}
{{- end }}

{{/*
Renders the keycloak.database.password environment variable
*/}}
{{- define "airbyte.keycloak.database.password.env" }}
- name: KEYCLOAK_DATABASE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "airbyte.keycloak.database.secretName" . }}
      key: {{ include "airbyte.keycloak.database.password.secretKey" . }}
{{- end }}

{{/*
Renders the keycloak.database.url value
*/}}
{{- define "airbyte.keycloak.database.url" }}
    {{- (printf "jdbc:postgresql://%s:%d/%s?currentSchema=keycloak" (include "airbyte.keycloak.database.host" .) (int (include "airbyte.keycloak.database.port" .)) (include "airbyte.keycloak.database.name" .)) }}
{{- end }}

{{/*
Renders the keycloak.database.url environment variable
*/}}
{{- define "airbyte.keycloak.database.url.env" }}
- name: KEYCLOAK_DATABASE_URL
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: KEYCLOAK_DATABASE_URL
{{- end }}

{{/*
Renders the set of all keycloak.database environment variables
*/}}
{{- define "airbyte.keycloak.database.envs" }}
{{- include "airbyte.keycloak.database.name.env" . }}
{{- include "airbyte.keycloak.database.host.env" . }}
{{- include "airbyte.keycloak.database.port.env" . }}
{{- include "airbyte.keycloak.database.user.env" . }}
{{- include "airbyte.keycloak.database.password.env" . }}
{{- include "airbyte.keycloak.database.url.env" . }}
{{- end }}

{{/*
Renders the set of all keycloak.database config map variables
*/}}
{{- define "airbyte.keycloak.database.configVars" }}
KEYCLOAK_DATABASE_NAME: {{ include "airbyte.keycloak.database.name" . | quote }}
KEYCLOAK_DATABASE_HOST: {{ include "airbyte.keycloak.database.host" . | quote }}
KEYCLOAK_DATABASE_PORT: {{ include "airbyte.keycloak.database.port" . | quote }}
KEYCLOAK_DATABASE_URL: {{ include "airbyte.keycloak.database.url" . | quote }}
{{- end }}

{{/*
Renders the set of all keycloak.database secret variables
*/}}
{{- define "airbyte.keycloak.database.secrets" }}
KEYCLOAK_DATABASE_USERNAME: {{ include "airbyte.keycloak.database.user" . | quote }}
KEYCLOAK_DATABASE_PASSWORD: {{ include "airbyte.keycloak.database.password" . | quote }}
{{- end }}
