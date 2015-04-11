### Transfer OpenSSL cipher names to JSSE cipher names

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

Time Saver 
----------

This is all that you need. It's current as of April 2015, the publication date.

```java
	public static final String[] SAFE_CIPHER_SUITES = new String[] {			
		"TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256","TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256","TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384","TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384","TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256","TLS_DHE_DSS_WITH_AES_128_GCM_SHA256","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256","TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256","TLS_DHE_DSS_WITH_AES_128_CBC_SHA256","TLS_DHE_RSA_WITH_AES_256_CBC_SHA256","TLS_DHE_DSS_WITH_AES_256_CBC_SHA256","TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"
	};

	public static String[] intersection(String[] stringSetA, String[] stringSetB) {
		Set<String> intersection = new HashSet<String>(
				Arrays.asList(stringSetA));
		intersection.retainAll(Arrays.asList(stringSetB));
		return intersection.toArray(new String[intersection.size()]);
	}
``` 
