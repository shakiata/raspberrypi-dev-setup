mkdir /home/james/container-program-files/grafana/loki-config

wget https://raw.githubusercontent.com/grafana/loki/v2.4.2/cmd/loki/loki-local-config.yaml -O /home/james/container-program-files/grafana/loki-config/loki-config.yaml

docker run --name loki -v /home/james/container-program-files/grafana/loki-config:/mnt/config -p 3100:3100 grafana/loki:2.4.2 -config.file=/home/james/container-program-files/grafana/loki-config.yaml

wget https://raw.githubusercontent.com/grafana/loki/v2.4.2/clients/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml

docker run --name pomtail -v /home/james/container-program-files/grafana/prom-config:/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.4.2 -config.file=/home/james/container-program-files/grafana/prom-config/promtail-config.yaml