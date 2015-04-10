### Transfer OpenSSL cipher names to JSSE ciphernames

This shell script takes Mozilla's SSL/TLS recommended cipher list and transfers those ciphers from their OpenSSL name into their JSSE names.
It uses IANA's TLS Cipher Suite List, which is what the Java's JSSE cipher suite names correspond to.

IANA List
---------
	
http://www.iana.org/assignments/tls-parameters/tls-parameters.xml


Usage
-----

```shell
$ ./jlist.sh 
```
  
