<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'jsteenpu' );

/** Database password */
define( 'DB_PASSWORD', '19' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '}EiEI4p~4JSS)r,heBpWT?m!EBA-~N%%J.rZEfZ ~?ov1-3VTh%g_(!K@/gps*aK' );
define( 'SECURE_AUTH_KEY',   'zxc<VwV}Qv4_#i$VBFg3!-Lds)Bf1Oa(t[nSI ZTFN-v&1QLvSnL]!B:+ouX#pvA' );
define( 'LOGGED_IN_KEY',     'XBE>5jqr^P$> W$-dJ$-lD2N1+%ul^9-doW=@[lMjSnGyY8Qc!.PQ8#xo0kI_2_)' );
define( 'NONCE_KEY',         '9@Iv[o0DGLz<8%:?GNJ6~Ey)YhFr}d9}8.wlr~Dyy1`]d:3iD4:ffTc:aPQWWoox' );
define( 'AUTH_SALT',         'UJ~_cC+0-)%%reX^+`2(Yc7Inx.0c#>?N%BhEu+-:joaJ{f/m+@:D#8uNhCRajkJ' );
define( 'SECURE_AUTH_SALT',  'RM1zQ]^Btg3fB7w^QYWoL&Pl4X ,jKI3qdaQg;6pAwgN<]&nr3tZ+1D8&3wh=41Q' );
define( 'LOGGED_IN_SALT',    ';LG5E.OWx,2b-5$$:zLz$Hkj.;E;9`Y&k%Z#:$^?9}IU0:%=(@`:Rp<=%d[h.{~7' );
define( 'NONCE_SALT',        '7@j;QH%)5_YLZEh%::f1nmN<XbH{>H04^ik%x_)H|<2{vu}uQYo! cm2DV7)}p4z' );
define( 'WP_CACHE_KEY_SALT', '32neh>n~}in|%(8,qL,d(%hXc JV9}jpr5dU*k@$yI<cf12m$i_R8UKq&F5&5r$0' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
