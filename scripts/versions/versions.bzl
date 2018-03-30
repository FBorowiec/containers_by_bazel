NGINX_VERSION = "1.13.10-1"
NGINX_DEB_VERSION = NGINX_VERSION + "~stretch"

NODEJS_VERSION = "8.11.0"
YARN_VERSION = "1.5.1"

ZULU_VERSION = "8.28.0.1"

ZOOKEEPER_VERSION = "3.4.11"
KAFKA_VERSION = "1.1.0"

ELASTICSEARCH_VERSION = "6.2.3"

KIBANA_VERSION = "6.2.3"

SBT_VERSION = "1.1.2"

POSTGRESQL_MINOR_VERSION = "10"
POSTGRESQL_VERSION = POSTGRESQL_MINOR_VERSION + "." + "3-1"
POSTGRESQL_DEB_VERSION = POSTGRESQL_VERSION + "." + "pgdg90+1"
POSTGIS_MINOR_VERSION = "2.4"
POSTGIS_VERSION = POSTGIS_MINOR_VERSION + ".3"
POSTGIS_CONTAINER_VERSION = POSTGRESQL_VERSION + "-" + POSTGIS_VERSION
POSTGIS_DEB_VERSION = POSTGIS_VERSION + "+dfsg-4.pgdg90+1"
POSTGIS_POSTGRESQL_DEB_VERSION = POSTGIS_DEB_VERSION

REDIS_VERSION = "3.2.6-1"
REDIS_DEB_VERSION = REDIS_VERSION + ""

TOMCAT8_VERSION = "8.5.14-1"
TOMCAT8_DEB_VERSION = TOMCAT8_VERSION + "+deb9u2"

MAVEN_VERSION = "3.5.3"

PHP_VERSION = "7.0.27-0"
PHP_DEB_VERSION = PHP_VERSION + "+deb9u1"

PROMETHEUS_VERSION = "2.2.1"
PROMETHEUS_JMX_JAVAAGENT = "0.3.0"

GRAFANA_VERSION = "5.0.4"
GRAFANA_DEB_VERSION = GRAFANA_VERSION

CASSANDRA_VERSION = "3.11.2"
CASSANDRA_DEB_VERSION = CASSANDRA_VERSION

NEXUS_VERSION = "2.14.8-01"

GERRIT_VERSION = "2.14.7"

DNSMASQ_VERSION = "2.76-5"
DNSMASQ_DEB_VERSION = DNSMASQ_VERSION + "+deb9u1"

ERLANG_VERSION = "20.3-1" # TODO fixing this version only installs erlang-nox, other dependent libs are latest
ERLANG_DEB_VERSION = ERLANG_VERSION + ""

RABBITMQ_VERSION = "3.7.4"

# 18.03 requires libpng12 which stretch does not have
EJABBERD_VERSION = "18.01"

# any higher version causes '7960 extra bytes at beginning or within zipfile'
ZIPKIN_VERSION = "2.4.9"

JENKINS_VERSION = "2.107.1"
JENKINS_SWARM_VERSION = "3.12"

JASPERREPORTS_SERVER_VERSION = "6.4.2"

PENATHO_DI_VERSION = "7.1.0.0-12"

def _version_shell_script_impl(ctx):
  # (.+)=(%\{.+\})   =>   "$2": $1,
  ctx.template_action(
    template=ctx.file._template,
    substitutions={
      "%{NGINX_VERSION}": NGINX_VERSION,
      "%{NGINX_DEB_VERSION}": NGINX_DEB_VERSION,
      "%{NODEJS_VERSION}": NODEJS_VERSION,
      "%{YARN_VERSION}": YARN_VERSION,
      "%{ZULU_VERSION}": ZULU_VERSION,
      "%{ZOOKEEPER_VERSION}": ZOOKEEPER_VERSION,
      "%{KAFKA_VERSION}": KAFKA_VERSION,
      "%{ELASTICSEARCH_VERSION}": ELASTICSEARCH_VERSION,
      "%{SBT_VERSION}": SBT_VERSION,
      "%{POSTGRESQL_MINOR_VERSION}": POSTGRESQL_MINOR_VERSION,
      "%{POSTGRESQL_VERSION}": POSTGRESQL_VERSION,
      "%{POSTGRESQL_DEB_VERSION}": POSTGRESQL_DEB_VERSION,
      "%{POSTGIS_MINOR_VERSION}": POSTGIS_MINOR_VERSION,
      "%{POSTGIS_VERSION}": POSTGIS_VERSION,
      "%{POSTGIS_CONTAINER_VERSION}": POSTGIS_CONTAINER_VERSION,
      "%{POSTGIS_DEB_VERSION}": POSTGIS_DEB_VERSION,
      "%{POSTGIS_POSTGRESQL_DEB_VERSION}": POSTGIS_POSTGRESQL_DEB_VERSION,
      "%{REDIS_VERSION}": REDIS_VERSION,
      "%{REDIS_DEB_VERSION}": REDIS_DEB_VERSION,
      "%{TOMCAT8_VERSION}": TOMCAT8_VERSION,
      "%{TOMCAT8_DEB_VERSION}": TOMCAT8_DEB_VERSION,
      "%{MAVEN_VERSION}": MAVEN_VERSION,
      "%{PHP_VERSION}": PHP_VERSION,
      "%{PHP_DEB_VERSION}": PHP_DEB_VERSION,
      "%{PROMETHEUS_VERSION}": PROMETHEUS_VERSION,
      "%{GRAFANA_VERSION}": GRAFANA_VERSION,
      "%{GRAFANA_DEB_VERSION}": GRAFANA_DEB_VERSION,
      "%{CASSANDRA_VERSION}": CASSANDRA_VERSION,
      "%{CASSANDRA_DEB_VERSION}": CASSANDRA_DEB_VERSION,
      "%{NEXUS_VERSION}": NEXUS_VERSION,
      "%{GERRIT_VERSION}": GERRIT_VERSION,
      "%{DNSMASQ_VERSION}": DNSMASQ_VERSION,
      "%{DNSMASQ_DEB_VERSION}": DNSMASQ_DEB_VERSION,
      "%{ERLANG_VERSION}": ERLANG_VERSION,
      "%{ERLANG_DEB_VERSION}": ERLANG_DEB_VERSION,
      "%{RABBITMQ_VERSION}": RABBITMQ_VERSION,
      "%{EJABBERD_VERSION}": EJABBERD_VERSION,
      "%{ZIPKIN_VERSION}": ZIPKIN_VERSION,
      "%{JENKINS_VERSION}": JENKINS_VERSION,
      "%{JENKINS_SWARM_VERSION}": JENKINS_SWARM_VERSION,
      "%{JASPERREPORTS_SERVER_VERSION}": JASPERREPORTS_SERVER_VERSION,
      "%{PENATHO_DI_VERSION}": PENATHO_DI_VERSION,
    },
    output=ctx.outputs.script
  )

version_shell_script = rule(
  implementation=_version_shell_script_impl,
  attrs={
    "_template": attr.label(
      default=Label("//scripts/versions:template"),
      single_file=True,
      allow_files=True)
  },
  outputs={
    "script": "%{name}.sh"
  },
)
