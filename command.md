## RUN the Script:
```
./run.sh
```

## Resume the script:
```
source script/requirements.sh && clear && ./script/resume.sh
```

## Skip all Process and Get Output:
```
source script/requirements.sh && clear && ./script/skip_all_process_and_get_result.sh
```

## View all valid social media links:
```
cat socialMediaLinks.txt | grep -v "linkedin.com/sharing/" | grep -v "facebook.com/sharer/" | grep -v "twitter.com/intent/" | grep -v "linkedin.com/shareArticle?"
```

## Find out the origin of any domain or social media link:
```
grep -B 40 "domain.com" output/allLinks.txt | grep "^Link:"
```

## Test to check any subdomain is dead or alive:
```
source script/requirements.sh && clear && python3 script/crawl_subdomain.py --sub "$subdomain" -o test_output.txt
```

## Check Domain Availability on GoDaddy:

[https://www.onlydomains.com/domain/frontSearch?domain=ozonpartners.cn](https://www.onlydomains.com/domain/frontSearch?domain=ozonpartners.cn)
