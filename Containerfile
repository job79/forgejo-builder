FROM scratch AS ctx
COPY build_files /

FROM quay.io/bootc-devel/fedora-bootc-43-minimal

RUN rm -rf /home && ln -s /var/home /home && mkdir -p /var/home && chmod 755 /var/home
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint
