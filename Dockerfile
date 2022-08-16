FROM registry.access.redhat.com/ubi8/ubi-minimal:8.6-902

RUN rpm -ivh https://github.com/aquasecurity/trivy-repo/raw/main/rpm/releases/8/x86_64/trivy-0.31.0.el8.x86_64.rpm

RUN mkdir -p /var/trivy/cache

RUN trivy --cache-dir /var/trivy/cache image --download-db-only

USER root
RUN chown -R 1001:root /var/trivy/cache
RUN chmod -R ug+rwX /var/trivy/cache

USER 1001

CMD trivy

