# This script converts md5-checksums file to SQL statements for adding the listed files to files.sql.
# Sample input data:
#\cc1d69880e57dcb45165d74aefb12161 *V:\\Job\\Amadeus\\Npp\\Obide\\trunk\\Src\\Obide.dll
#\5bc743195f85fb27cf1edd4d4200e3f0 *V:\\Job\\Amadeus\\Npp\\Obide\\trunk\\Src\\ObideU.dll
# Corresponding output:
#insert into FileHash(md5sum, filename, pluginName, addedDate, status) values ('cc1d69880e57dcb45165d74aefb12161','Obide.dll','','$Date','ok');
#insert into FileHash(md5sum, filename, pluginName, addedDate, status) values ('5bc743195f85fb27cf1edd4d4200e3f0','ObideU.dll','','$Date','ok');

s/^\\\?\([a-f0-9]*\) \*\(.*\\\)\?\(.*\)/insert into FileHash(md5sum, filename, pluginName, addedDate, status) values ('\1','\3','','$Date','ok');/g
# RegExplanation:
# ^\\\? - optional backslash at line start
# \([a-f0-9]*\) - first extracted portion (\1): md5 hash value
#  \* - mandatory space and asterisk
# \(.*\\\)\? - optional path is everything until the last backslash (\2)
# \(.*\) - last extracted portion (\3): file name
