bIOChip
======

b**IOC**hip is a Ruby tool that can quickly fetch intelligence on a given domain to match with APT-related activity. It currently utilizes AlienVault OTX, with plans to incorporate new intelligence providers soon.

## Setup
```
#Install dependencies
bundle install

#Set your AlienVault OTX API Key ($api_alienvault on line 6)
```

## Usage

```
#Single domain
./biochip.rb slack-sso.com

#Domain list
cat urls.dat | awk '{print "./biochip.rb "$1}' | bash

#Or
cat urls.dat | xargs -I domain ./biochip.rb domain
```

## Output 

The following output was generated using the `urls.dat` example file which contains domains tied to `EVILNUM` infrastructure.

```
⚠️  Report for superimarkets.com: Malicious activity found.
☣️  Domain is linked to malware activity:
	* VileLoader (1)
	* DeathStalker (1)
	* Stonefly (1)
	* Maui (1)
	* EVILNUM (1)

⚠️  Report for 1jdm.com: Malicious activity found.
☣️  Domain is linked to malware activity:
	* AM (1)
	* Agent Tesla (1)
	* Malware (1)
	* Tulach Malware (1)
	* adware.pcappstore/veryfast (1)
	* NSIS (1)
	* Static AI - Malicious PE (1)
	* HoneyPot (1)

⚠️  Report for azureservicesapi.com: Malicious activity found.
☣️  Domain is linked to malware activity:
	* VileLoader (1)
	* DeathStalker (1)
	* Stonefly (1)
	* Maui (1)
	* EVILNUM (1)

⚠️  Report for symantecq.com: Malicious activity found.
☣️  Domain is linked to malware activity:
	* VileLoader (1)
	* DeathStalker (1)
	* Stonefly (1)
	* Maui (1)
	* EVILNUM (1)

⚠️  Report for slack-sso.com: Malicious activity found.
🥷🏻  Domain is linked to known adversaries:
	* Evilnum (1)
☣️  Domain is linked to malware activity:
	* EVILNUM (1)

⚠️  Report for slack-hub.com: Malicious activity found.
🥷🏻  Domain is linked to known adversaries:
	* Evilnum (1)
☣️  Domain is linked to malware activity:
	* EVILNUM (1)

⚠️  Report for slack-protect.com: Malicious activity found.
🥷🏻  Domain is linked to known adversaries:
	* Evilnum (1)
☣️  Domain is linked to malware activity:
	* EVILNUM (1)
```