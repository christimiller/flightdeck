resource "helm_release" "this" {
  chart      = var.chart_name
  name       = var.name
  namespace  = var.k8s_namespace
  repository = var.chart_repository
  values     = concat(local.chart_values, var.chart_values)
  version    = var.chart_version
}

locals {
  chart_values = [
    yamlencode({
      alertmanager = {
        alertmanagerSpec = {
          configSecret      = "alertmanager"
          useExistingSecret = true
        }
      }
      grafana = {
        enabled = false
      }
      kubeControllerManager = {
        enabled = false
      }
      kubeEtcd = {
        enabled = false
      }
      kubeProxy = {
        enabled = false
      }
      kubeScheduler = {
        enabled = false
      }
      prometheus = {
        additionalPodMonitors = [
          yamldecode(file("${path.module}/istio-podmonitor.yaml"))
        ]
        additionalServiceMonitors = [
          yamldecode(file("${path.module}/istio-servicemonitor.yaml"))
        ]
        prometheusSpec = {
          containers = [
            {
              name = "prometheus"
              readinessProbe = {
                failureThreshold = 250
              }
            },
          ]
          podMonitorSelector                      = {}
          podMonitorSelectorNilUsesHelmValues     = false
          ruleSelector                            = {}
          ruleSelectorNilUsesHelmValues           = false
          serviceMonitorSelector                  = {}
          serviceMonitorSelectorNilUsesHelmValues = false
        }
      }
      prometheusOperator = {
        admissionWebhooks = {
          certManager = {
            enabled = true
          }
        }
      }
    })
  ]
}
