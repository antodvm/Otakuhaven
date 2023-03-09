<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit9c2c4b1cb60dc846ad345fc3e0a98c75
{
    public static $prefixLengthsPsr4 = array (
        'A' => 
        array (
            'Anto\\' => 5,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Anto\\' => 
        array (
            0 => __DIR__ . '/../..' . '/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit9c2c4b1cb60dc846ad345fc3e0a98c75::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit9c2c4b1cb60dc846ad345fc3e0a98c75::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit9c2c4b1cb60dc846ad345fc3e0a98c75::$classMap;

        }, null, ClassLoader::class);
    }
}
