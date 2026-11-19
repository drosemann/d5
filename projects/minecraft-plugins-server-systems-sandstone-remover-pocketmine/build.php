<?php

$phar = new Phar('SandstoneRemover.phar');
$phar->buildFromDirectory(__DIR__);
$phar->setStub($phar->createDefaultStub('src/SandstoneRemover/SandstoneRemover.php'));