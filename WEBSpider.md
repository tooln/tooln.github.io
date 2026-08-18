### Break socialMediaDB.txt into specific files per domain:

```bash
for site in facebook instagram linkedin youtube github discord tiktok pinterest threads reddit medium; do grep -Ei "^https?://(www\.)?${site}\.com/" socialMediaDB.txt > "${site}.txt"; done; grep -Ei '^https?://(www\.)?discord\.gg/' socialMediaDB.txt > discord_gg.txt; grep -Ei '^https?://(www\.)?bit\.ly/' socialMediaDB.txt > bitly.txt; grep -Ei '^https?://(www\.)?linktr\.ee/' socialMediaDB.txt > linktr.ee.txt; grep -Eiv '^https?://(www\.)?(facebook|instagram|linkedin|youtube|github|discord|tiktok|pinterest|threads|reddit|medium)\.com/|^https?://(www\.)?discord\.gg/|^https?://(www\.)?bit\.ly/|^https?://(www\.)?linktr\.ee/' socialMediaDB.txt > /tmp/socialMediaDB.txt && mv /tmp/socialMediaDB.txt socialMediaDB.txt
```
