#!/bin/sh
rm -rf /usr/ports/archivers/zstd
rm -rf /usr/ports/audio/flac
rm -rf /usr/ports/audio/opus
rm -rf /usr/ports/devel/pcre2
rm -rf /usr/ports/ftp/curl
rm -rf /usr/ports/graphics/lcms2
rm -rf /usr/ports/graphics/webp
rm -rf /usr/ports/multimedia/libmediainfo
rm -rf /usr/ports/multimedia/libx264
rm -rf /usr/ports/multimedia/libzen
rm -rf /usr/ports/multimedia/mediainfo
rm -rf /usr/ports/multimedia/x264
rm -rf /usr/ports/security/rhash
rm -rf /usr/ports/textproc/libxml2
rm -rf /usr/ports/textproc/libxml2-python
rm -rf /usr/ports/www/libnghttp3
rm -rf /usr/ports/www/nghttp2
cp -Rp archivers/zstd /usr/ports/archivers/zstd
cp -Rp audio/flac /usr/ports/audio/flac
cp -Rp audio/opus /usr/ports/audio/opus
cp -Rp devel/pcre2 /usr/ports/devel/pcre2
cp -Rp ftp/curl /usr/ports/ftp/curl
cp -Rp graphics/lcms2 /usr/ports/graphics/lcms2
cp -Rp graphics/webp /usr/ports/graphics/webp
cp -Rp multimedia/libmediainfo /usr/ports/multimedia/libmediainfo
cp -Rp multimedia/libx264 /usr/ports/multimedia/libx264
cp -Rp multimedia/libzen /usr/ports/multimedia/libzen
cp -Rp multimedia/mediainfo /usr/ports/multimedia/mediainfo
cp -Rp multimedia/x264 /usr/ports/multimedia/x264
cp -Rp security/rhash /usr/ports/security/rhash
cp -Rp textproc/libxml2 /usr/ports/textproc/libxml2
cp -Rp textproc/libxml2-python /usr/ports/textproc/libxml2-python
cp -Rp www/libnghttp3 /usr/ports/www/libnghttp3
cp -Rp www/nghttp2 /usr/ports/www/nghttp2
chown -R root:wheel /usr/ports
