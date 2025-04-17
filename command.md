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

1. **Purchasable Email Finder: `cd Emails` Directory/Folder**:
   To print all discovered email address vulnerabilities:
   ```bash
   cd Emails && ../Scripts/print_Email.sh
   ```

2. **CSPAnalyzer: `cd CSPHeaders` Directory/Folder**:
   To print all identified Content Security Policy vulnerabilities:
   ```bash
   cd CSPHeaders && ../Scripts/print_CSP.sh
   ```

3. **Unregistered Domain: `cd Links` Directory/Folder**:
   To print all unregistered or vulnerable links found:
   ```bash
   cd Links && ../Scripts/print_Link.sh
   ```

7. **Find Social Media Link: `cd Scripts` Directory/Folder**:
   To find and print social media source URLs associated with the target:
   ```bash
   cd Scripts && ./find_social_media_link.sh
   ```

## Check Domain Availability:

- **GoDaddy:** [https://www.godaddy.com/en](https://www.godaddy.com/en)
- **OnlyDomains:** [https://www.onlydomains.com/#](https://www.onlydomains.com/#)
- **.ru Russian Domain:** [https://www.ps.kz/domains](https://www.ps.kz/domains)
- **.by Belarus Domain:** [https://www.netim.com/en/domain-name/search](https://www.netim.com/en/domain-name/search)
- **.br Brazilian Domain:** [https://registro.br/](https://registro.br/)
- **.edu Domain:** [https://net.educause.edu/search.htm](https://net.educause.edu/search.htm)
- **.kw Domain:** [https://www.101domain.com/domain-availability-search.htm](https://www.101domain.com/domain-availability-search.htm)
