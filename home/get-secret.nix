config:
name:
"$(cat ${config.sops.secrets.${name}.path})"