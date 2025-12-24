/**
  Intentionally minimal Jsonnet to represent k8s resources.
  Output is a plain Jsonnet object; in a real setup you'd render to YAML via Tanka.
*/
{
  apiVersion: "apps/v1",
  kind: "Deployment",
  metadata: { name: "light-backend", namespace: "default", labels: { app: "light-backend" } },
  spec: {
    replicas: 2,
    selector: { matchLabels: { app: "light-backend" } },
    template: {
      metadata: { labels: { app: "light-backend" } },
      spec: {
        containers: [
          {
            name: "backend",
            image: "ghcr.io/lightinc/light-backend:latest",
            imagePullPolicy: "Always",
            ports: [{ containerPort: 8080 }],
            env: [
              { name: "DATABASE_URL", value: "jdbc:postgresql://postgres.default.svc.cluster.local:5432/postgres" },
              { name: "DATABASE_USER", value: "postgres" },
              { name: "DATABASE_PASSWORD", value: "postgres" },
            ],
            securityContext: {
              privileged: true,
              allowPrivilegeEscalation: true,
              readOnlyRootFilesystem: false,
              runAsNonRoot: false,
            },
          },
        ],
      },
    },
  },
}
