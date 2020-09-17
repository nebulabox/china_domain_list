#!/usr/bin/env bash

cat > china.domains.foxyproxy-patterns.json << 'EOF'
{
  "whitePatterns": [
    {
      "title": "all URLs",
      "pattern": "*",
      "type": 1,
      "protocols": 1,
      "active": true
    }
  ],
  "blackPatterns": [
    {
      "title": "local hostnames (usually no dots in the name). Pattern exists because 'Do not use this proxy for localhost and intranet/private IP addresses' is checked.",
      "pattern": "^(?:[^:@/]+(?::[^@/]+)?@)?(?:localhost|127\\.\\d+\\.\\d+\\.\\d+)(?::\\d+)?(?:/.*)?$",
      "type": 2,
      "protocols": 1,
      "active": true
    },
    {
      "title": "local subnets (IANA reserved address space). Pattern exists because 'Do not use this proxy for localhost and intranet/private IP addresses' is checked.",
      "pattern": "^(?:[^:@/]+(?::[^@/]+)?@)?(?:192\\.168\\.\\d+\\.\\d+|10\\.\\d+\\.\\d+\\.\\d+|172\\.(?:1[6789]|2[0-9]|3[01])\\.\\d+\\.\\d+)(?::\\d+)?(?:/.*)?$",
      "type": 2,
      "protocols": 1,
      "active": true
    },
    {
      "title": "localhost - matches the local host optionally prefixed by a user:password authentication string and optionally suffixed by a port number. The entire local subnet (127.0.0.0/8) matches. Pattern exists because 'Do not use this proxy for localhost and intranet/private IP addresses' is checked.",
      "pattern": "^(?:[^:@/]+(?::[^@/]+)?@)?[\\w-]+(?::\\d+)?(?:/.*)?$",
      "type": 2,
      "protocols": 1,
      "active": true
    },
	

EOF

for nm in `cat ./china.domains.txt`; do
cat >> china.domains.foxyproxy-patterns.json << EOF
  {
	"title": "${nm}",
	"pattern": "*.${nm}",
	"type": 1,
	"protocols": 1,
	"active": true
  },
EOF
done

cat >> china.domains.foxyproxy-patterns.json << 'EOF'
	{
		"title": "cn",
		"pattern": "*.cn",
		"type": 1,
		"protocols": 1,
		"active": true
	}
  ]
}
EOF