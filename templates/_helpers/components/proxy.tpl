{{- define "stolon.proxy.name" -}}
{{ printf "proxy" }}
{{- end -}}

{{- define "stolon.proxy.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.proxy.name" .) }}
{{- end -}}

{{- define "stolon.proxy.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.proxy.name" . }}
{{- end -}}

{{- define "stolon.proxy.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
