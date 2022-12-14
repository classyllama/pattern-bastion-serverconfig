# Replacing STUB data in PHP Phar

## Download and install the latest version of magento-cloud  CLI tool:

    curl -sS https://accounts.magento.cloud/cli/installer | php

## Create a temp folder, copy magento-cloud into this folder:

    mkdir phar
    cp ~/.magento-cloud/bin/magento-cloud phar/magento-cloud
    cd phar

## Get the default header (stub) from the magento-cloud:

    $ head -n 13 magento-cloud
    #!/usr/bin/env php
    <?php
    /**
     * @file
     * Platform.sh CLI Phar stub.
     */
    
    if (class_exists('Phar')) {
        Phar::mapPhar('default.phar');
        require 'phar://' . __FILE__ . '/bin/platform';
    }
     
    __HALT_COMPILER(); ?>

and save it as stub.php


## Modify shebang in stub.php - replace '#!/usr/bin/env php' with '#!/bin/<auto-generated>' string, for example:

     #!/bin/c57a920043a2f687b2d3c6912fe4d973cbeb3276
     <?php
     /**
      * @file
      * Platform.sh CLI Phar stub.
      */
     
     if (class_exists('Phar')) {
          Phar::mapPhar('default.phar');
          require 'phar://' . __FILE__ . '/bin/platform';
     }
     
    __HALT_COMPILER(); ?>

## Get the location of phar utility (using 'which phar') and update stub header in the phar.file:

    php -d phar.readonly=0 /usr/local/opt/php@7.4/bin/phar stub-set -s stub.php -f magento-cloud

## Check a new stub header:

    $ head magento-cloud
    #!/bin/c57a980043a2f687b2d3c6912fe4d973cbeb3276
     <?php
    /**
     * @file
     * Platform.sh CLI Phar stub.
     */
     
    if (class_exists('Phar')) {
        Phar::mapPhar('default.phar');
        require 'phar://' . __FILE__ . '/bin/platform';
