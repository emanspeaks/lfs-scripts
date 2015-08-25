try tar -xvf ../docbook-xsl-doc-1.78.1.tar.bz2 --strip-components=1
try install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-1.78.1
try cp -v -R VERSION common eclipse epub extensions fo highlighting html \
         htmlhelp images javahelp lib manpages params profiling \
         roundtrip slides template tests tools webhelp website \
         xhtml xhtml-1_1 \
    /usr/share/xml/docbook/xsl-stylesheets-1.78.1 
try ln -sf VERSION /usr/share/xml/docbook/xsl-stylesheets-1.78.1/VERSION.xsl
try install -v -m644 -D README \
                    /usr/share/doc/docbook-xsl-1.78.1/README.txt
try install -v -m644    RELEASE-NOTES* NEWS* \
                    /usr/share/doc/docbook-xsl-1.78.1
try cp -v -R doc/* /usr/share/doc/docbook-xsl-1.78.1

if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
if [ ! -f /etc/xml/catalog ]; then
    xmlcatalog --noout --create /etc/xml/catalog
fi &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/1.78.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.78.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/1.78.1" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.78.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.78.1" \
    /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-1.78.1" \
    /etc/xml/catalog
