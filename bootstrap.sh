#!/bin/sh
DATABASE_URL=$(echo $DATABASE_SOURCE_URL | cut -f1 -d"?" | sed 's/^.*\/\///')
cp /temperature_alignment/libs/scripts/run_prod.py /temperature_alignment/libs/run_script.py
sed -ri 's@config.yaml@'\/temperature_alignment\/config.yaml'@' /temperature_alignment/libs/run_script.py
sed -ri 's@DATABASE_URL@'${DATABASE_URL}'@' /temperature_alignment/config.yaml
sed -ri 's@DATABASE_USERNAME@'${DATABASE_USERNAME}'@' /temperature_alignment/config.yaml
sed -ri 's@DATABASE_PASSWORD@'${DATABASE_PASSWORD}'@' /temperature_alignment/config.yaml
exec $CATALINA_HOME/bin/catalina.sh "$@"
