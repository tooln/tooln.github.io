# WEBSpider - Bug Bounty Tools

WEBSpider is a powerful set of command-line tools designed to assist security researchers and bug bounty hunters. It automates the process of subdomain enumeration, crawling, and vulnerability discovery. By analyzing websites and web applications, it helps identify potential security flaws, including misconfigurations and common vulnerabilities.

## Usage

### Starting the Tool
To start the tool and begin crawling and enumerating subdomains, run the following command:
```bash
./run.sh
```

### Resuming from Where You Left Off
If you wish to resume the process from where it was last interrupted, simply execute:
```bash
./resume.sh
```

### Skipping Remaining Subdomains
If you'd like to skip the remaining subdomains and start processing the results based on previously crawled data, use:
```bash
./skip.sh
```

## Output

The tool generates output in specific directories. To review the results, navigate to each directory and print the vulnerabilities.

1. **Purchasable Email Finder: Emails Directory**:
   To print all discovered email address vulnerabilities:
   ```bash
   ../Scripts/print.sh
   ```

2. **CSPAnalyzer: CSPHeaders Directory**:
   To print all identified Content Security Policy vulnerabilities:
   ```bash
   ../Scripts/print.sh
   ```

3. **Unregistered Domain: Links Directory**:
   To print all unregistered or vulnerable links found:
   ```bash
   ../Scripts/print.sh
   ```

4. **Find Social Media Link: Scripts Directory**:
   To find and print social media source URLs associated with the target:
   ```bash
   ./find_social_media_link.sh
   ```

## Check Domain Availability:

**GoDaddy:** [https://www.godaddy.com/en](https://www.godaddy.com/en)
**OnlyDomains:** [https://www.onlydomains.com/#](https://www.onlydomains.com/#)
**Check .ru Russian Domain:** [https://www.ps.kz/domains](https://www.ps.kz/domains)
