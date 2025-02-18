
{{/* DO NOT EDIT: This file was autogenerated. */}}

{{/*
    Metrics Configuration
*/}}

{{/*
Renders the global.metrics.client value
*/}}
{{- define "airbyte.metrics.client" }}
    {{- .Values.global.metrics.client }}
{{- end }}

{{/*
Renders the metrics.client environment variable
*/}}
{{- define "airbyte.metrics.client.env" }}
- name: METRIC_CLIENT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: METRIC_CLIENT
{{- end }}

{{/*
Renders the global.metrics.micrometer.enabled value
*/}}
{{- define "airbyte.metrics.micrometer.enabled" }}
    {{- .Values.global.metrics.micrometer.enabled | default false }}
{{- end }}

{{/*
Renders the metrics.micrometer.enabled environment variable
*/}}
{{- define "airbyte.metrics.micrometer.enabled.env" }}
- name: MICROMETER_METRICS_ENABLED
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: MICROMETER_METRICS_ENABLED
{{- end }}

{{/*
Renders the global.metrics.micrometer.statsdFlavor value
*/}}
{{- define "airbyte.metrics.micrometer.statsdFlavor" }}
    {{- .Values.global.metrics.micrometer.statsdFlavor | default "datadog" }}
{{- end }}

{{/*
Renders the metrics.micrometer.statsdFlavor environment variable
*/}}
{{- define "airbyte.metrics.micrometer.statsdFlavor.env" }}
- name: MICROMETER_METRICS_STATSD_FLAVOR
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: MICROMETER_METRICS_STATSD_FLAVOR
{{- end }}

{{/*
Renders the global.metrics.otel.collector.endpoint value
*/}}
{{- define "airbyte.metrics.otel.collector.endpoint" }}
    {{- .Values.global.metrics.otel.collector.endpoint }}
{{- end }}

{{/*
Renders the metrics.otel.collector.endpoint environment variable
*/}}
{{- define "airbyte.metrics.otel.collector.endpoint.env" }}
- name: OTEL_COLLECTOR_ENDPOINT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: OTEL_COLLECTOR_ENDPOINT
{{- end }}

{{/*
Renders the global.metrics.statsd.host value
*/}}
{{- define "airbyte.metrics.statsd.host" }}
    {{- .Values.global.metrics.statsd.host }}
{{- end }}

{{/*
Renders the metrics.statsd.host environment variable
*/}}
{{- define "airbyte.metrics.statsd.host.env" }}
- name: STATSD_HOST
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
    
{{- end }}

{{/*
Renders the global.metrics.statsd.port value
*/}}
{{- define "airbyte.metrics.statsd.port" }}
    {{- .Values.global.metrics.statsd.port | default 8125 }}
{{- end }}

{{/*
Renders the metrics.statsd.port environment variable
*/}}
{{- define "airbyte.metrics.statsd.port.env" }}
- name: STATSD_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-airbyte-env
      key: STATSD_PORT
{{- end }}

{{/*
Renders the set of all metrics environment variables
*/}}
{{- define "airbyte.metrics.envs" }}
{{- include "airbyte.metrics.client.env" . }}
{{- include "airbyte.metrics.micrometer.enabled.env" . }}
{{- include "airbyte.metrics.micrometer.statsdFlavor.env" . }}
{{- include "airbyte.metrics.otel.collector.endpoint.env" . }}
{{- include "airbyte.metrics.statsd.host.env" . }}
{{- include "airbyte.metrics.statsd.port.env" . }}
{{- end }}

{{/*
Renders the set of all metrics config map variables
*/}}
{{- define "airbyte.metrics.configVars" }}
METRIC_CLIENT: {{ include "airbyte.metrics.client" . | quote }}
MICROMETER_METRICS_ENABLED: {{ include "airbyte.metrics.micrometer.enabled" . | quote }}
MICROMETER_METRICS_STATSD_FLAVOR: {{ include "airbyte.metrics.micrometer.statsdFlavor" . | quote }}
OTEL_COLLECTOR_ENDPOINT: {{ include "airbyte.metrics.otel.collector.endpoint" . | quote }}
STATSD_HOST: {{ include "airbyte.metrics.statsd.host" . | quote }}
STATSD_PORT: {{ include "airbyte.metrics.statsd.port" . | quote }}
{{- end }}
