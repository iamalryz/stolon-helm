{{- define "stolon.store.endpoints" -}}
  {{- $storePodName := (include "common.names.fullname" .Subcharts.etcd) -}}
  {{- $storeServiceHeadless := printf "%s-headless" (include "common.names.fullname" .Subcharts.etcd) -}}
  {{- $storeEndpoints := list -}}
  {{- if .Values.etcd.enabled -}}
    {{- range $index := until (.Values.etcd.replicaCount | int) -}}
      {{- $storeEndpoints = append $storeEndpoints (printf "http://%s-%d.%s:2379" $storePodName $index $storeServiceHeadless) -}}
    {{- end -}}
  {{- else -}}
    {{- $storeEndpoints = .Values.store.endpoints -}}
  {{- end -}}

  {{- printf "%s" (join "," $storeEndpoints) -}}
{{- end -}}