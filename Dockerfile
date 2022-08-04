FROM registry.access.redhat.com/ubi8/ubi:8.6-855

RUN rpm -ivh https://github.com/aquasecurity/trivy-repo/raw/main/rpm/releases/8/x86_64/trivy-0.30.4.el8.x86_64.rpm 

RUN mkdir -p /var/trivy/cache
RUN chown 1001:root /var/trivy/cache
RUN chmod -R ug+rwX /var/trivy/cache

USER 1001

RUN trivy --cache-dir /var/trivy/cache image --download-db-only

CMD trivy

