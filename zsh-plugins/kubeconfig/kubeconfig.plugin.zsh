export KUBECONFIG=$(for YAML in $(find ${HOME}/kube/ -name '*.yaml') ; do echo -n ":${YAML}"; done)