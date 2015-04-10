#!/bin/sh
#Using modern ciphers from: https://mozilla.github.io/server-side-tls/ssl-config-generator/?1
#http://www.iana.org/assignments/tls-parameters/tls-parameters.xml
MOZILLA_REC="ECDHE-RSA-AES128-GCM-SHA256","ECDHE-ECDSA-AES128-GCM-SHA256","ECDHE-RSA-AES256-GCM-SHA384","ECDHE-ECDSA-AES256-GCM-SHA384","DHE-RSA-AES128-GCM-SHA256","DHE-DSS-AES128-GCM-SHA256","kEDH+AESGCM","ECDHE-RSA-AES128-SHA256","ECDHE-ECDSA-AES128-SHA256","ECDHE-RSA-AES128-SHA","ECDHE-ECDSA-AES128-SHA","ECDHE-RSA-AES256-SHA384","ECDHE-ECDSA-AES256-SHA384","ECDHE-RSA-AES256-SHA","ECDHE-ECDSA-AES256-SHA","DHE-RSA-AES128-SHA256","DHE-RSA-AES128-SHA","DHE-DSS-AES128-SHA256","DHE-RSA-AES256-SHA256","DHE-DSS-AES256-SHA","DHE-RSA-AES256-SHA"

#IFS=',' read -a ciphers <<< "$MOZILLA_REC"
for cipher in $(echo $MOZILLA_REC | tr "," "\n")
do
	IFS=" - " read -a data <<< `openssl ciphers -V | grep $cipher`
	CODE=`echo ${data[0]}`
	SIZE=${#CODE}
	if [ $SIZE -eq "9" ]
		then 
			count=0
			for jssecipher in $(grep -F $CODE tls-parameters-4.csv | tr "," "\n")
				do
					if [ $count -eq 2 ]
						then
						echo -n \"$jssecipher\",
					fi
					count=$[$count+1]
				done
	fi
done

echo ""
