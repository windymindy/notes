#!/bin/sh

docker run --rm --interactive \
    --name $gitlab_ci_container_name \
    --hostname $gitlab_ci_container_hostname \
    --network $gitlab_ci_network \
    --volumes-from $gitlab_ci_volumes \
    --workdir $PWD \
    --env gitlab_ci_url \
    --env CI_JOB_TOKEN \
    $gitlab_ci_helper_image \
    sh ${CI_BUILDS_DIR}/scripts/pull_.sh "$@"
