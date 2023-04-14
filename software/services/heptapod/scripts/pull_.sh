#!/bin/sh

if test ! -d .hg ; then
    hg --verbose init ;
else
    hg --verbose revert --all --no-backup ;
fi &&

hg --verbose pull --update --force \
    --config auth.gitlab.prefix=${gitlab_ci_url} \
    --config auth.gitlab.username=gitlab-ci-token \
    --config auth.gitlab.password=${CI_JOB_TOKEN} \
    "$@"
