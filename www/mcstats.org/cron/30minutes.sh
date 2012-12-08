#!/usr/local/bin/bash

# executed every 30 minutes

cd /data/www/mcstats.org/cron/

GENERATOR_FILE="../generator.txt"

# prepare
echo 1 > "$GENERATOR_FILE"
/usr/local/bin/php -q prepare-graph-generators.php
echo 8 > "$GENERATOR_FILE"

/usr/local/bin/php -q generators/global-statistics.php
echo 20 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/custom.php
echo 44 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/server-locations.php
echo 56 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/version-trends.php
echo 68 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/version-demographics.php
echo 80 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/server-software.php
echo 92 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/game-version.php
echo 94 > "$GENERATOR_FILE"
/usr/local/bin/php -q generators/operating-system.php
echo 98 > "$GENERATOR_FILE"
/usr/local/bin/php -q server-counts.php
/usr/local/bin/php -q clear-cache.php

# finish !
/usr/local/bin/php -q finish-graph-generation.php
rm "$GENERATOR_FILE"