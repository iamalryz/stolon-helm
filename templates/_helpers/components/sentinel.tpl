{{- define "stolon.sentinel.name" -}}
{{ printf "sentinel" }}
{{- end -}}

{{- define "stolon.sentinel.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.sentinel.name" .) }}
{{- end -}}

{{- define "stolon.sentinel.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.sentinel.name" . }}
{{- end -}}

{{- define "stolon.sentinel.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.sentinel.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
