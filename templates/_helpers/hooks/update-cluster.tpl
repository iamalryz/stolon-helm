{{- define "stolon.update-cluster.name" -}}
{{ printf "update-cluster" }}
{{- end -}}

{{- define "stolon.update-cluster.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.update-cluster.name" .) }}
{{- end -}}

{{- define "stolon.update-cluster.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.update-cluster.name" . }}
{{- end -}}

{{- define "stolon.update-cluster.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.update-cluster.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
