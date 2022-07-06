{{- define "stolon.init-cluster.name" -}}
{{ printf "init-cluster" }}
{{- end -}}

{{- define "stolon.init-cluster.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.init-cluster.name" .) }}
{{- end -}}

{{- define "stolon.init-cluster.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.init-cluster.name" . }}
{{- end -}}

{{- define "stolon.init-cluster.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.init-cluster.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
